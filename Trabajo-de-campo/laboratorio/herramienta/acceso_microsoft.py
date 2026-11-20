"""Pieza 7: entrar con la cuenta de Microsoft 365 de la organización (OpenID Connect).

La herramienta nunca ve la contraseña de Microsoft: la persona la escribe en la página de
Microsoft, y Microsoft nos devuelve quién es. Usa MSAL, la librería oficial de Microsoft.

Configuración en ~/moodle-lab/m365.json (fuera del código, permisos 600):
    {"tenant": "...", "cliente": "...", "secreto": "~/moodle-lab/m365-secreto.txt",
     "redireccion": "http://localhost:5000/auth/callback"}
Si el archivo no existe, la web funciona igual, solo con usuario y contraseña.
"""
import json
import re
import secrets
import stat
import time
from pathlib import Path

ARCHIVO = Path("~/moodle-lab/m365.json").expanduser()
MINUTOS_PARA_VOLVER = 10          # tiempo máximo entre ir a Microsoft y volver
_UUID = re.compile(r"[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")
_pendientes = {}  # state -> (flujo, vínculo, hora). En memoria: si se reinicia, hay que volver a entrar.


class ErrorAcceso(Exception):
    pass


def _leer_privado(ruta):
    """Lee un archivo que solo puede leer su dueño (como los tokens de Moodle)."""
    ruta = Path(ruta).expanduser()
    if ruta.stat().st_mode & (stat.S_IRWXG | stat.S_IRWXO):
        raise ErrorAcceso(f"{ruta} lo pueden leer otros usuarios: haz chmod 600 {ruta}")
    return ruta.read_text().strip()


def configuracion():
    """La configuración de Microsoft, o None si no está puesta."""
    if not ARCHIVO.exists():
        return None
    datos = json.loads(_leer_privado(ARCHIVO))
    for clave in ("tenant", "cliente"):
        if not _UUID.fullmatch(str(datos.get(clave, "")).lower()):
            raise ErrorAcceso(f"m365.json: «{clave}» no tiene formato de identificador de Microsoft")
    if not str(datos.get("redireccion", "")).startswith(("https://", "http://localhost:")):
        raise ErrorAcceso("m365.json: la redirección debe ser https, o http solo en localhost")
    return datos


def _aplicacion(config):
    import msal  # solo se carga si se usa Microsoft
    return msal.ConfidentialClientApplication(
        config["cliente"],
        authority=f"https://login.microsoftonline.com/{config['tenant']}",  # solo esta organización
        client_credential=_leer_privado(config["secreto"]),
    )


def empezar(config):
    """Paso 1: la dirección de Microsoft a la que mandar a la persona y un vínculo para su navegador.

    No se piden permisos sobre correo, archivos, etc.: solo saber quién es (openid, profile).
    """
    _limpiar()
    flujo = _aplicacion(config).initiate_auth_code_flow([], redirect_uri=config["redireccion"])
    vinculo = secrets.token_urlsafe(32)
    _pendientes[flujo["state"]] = (flujo, vinculo, time.time())
    return flujo["auth_uri"], vinculo


def terminar(config, parametros, vinculo):
    """Paso 2: Microsoft vuelve con un código. Se canjea y se devuelve quién es (su usuario de Microsoft).

    Comprueba que la vuelta corresponde a una ida desde ESTE navegador (vínculo), que no ha
    caducado, que la respuesta es de nuestra organización y que trae un usuario.
    """
    pendiente = _pendientes.pop(parametros.get("state", ""), None)
    if pendiente is None:
        raise ErrorAcceso("inicio de sesión caducado o ya usado; vuelve a intentarlo")
    flujo, vinculo_esperado, hora = pendiente
    if not vinculo or not secrets.compare_digest(vinculo, vinculo_esperado):
        raise ErrorAcceso("la vuelta de Microsoft no corresponde a este navegador")
    if time.time() - hora > MINUTOS_PARA_VOLVER * 60:
        raise ErrorAcceso("inicio de sesión caducado; vuelve a intentarlo")
    if "error" in parametros:
        raise ErrorAcceso(f"Microsoft no ha dejado entrar: {parametros.get('error_description', parametros['error'])}")

    # MSAL comprueba state y nonce, canjea el código (con PKCE) y valida emisor, destinatario y caducidad.
    resultado = _aplicacion(config).acquire_token_by_auth_code_flow(flujo, parametros)
    if "error" in resultado:
        raise ErrorAcceso(f"Microsoft no ha dejado entrar: {resultado.get('error_description', resultado['error'])}")
    datos = resultado.get("id_token_claims") or {}
    if datos.get("tid", "").lower() != config["tenant"].lower():
        raise ErrorAcceso("la cuenta no es de nuestra organización")
    usuario = (datos.get("preferred_username") or "").strip().lower()
    if "@" not in usuario:
        raise ErrorAcceso("Microsoft no ha devuelto un usuario válido")
    return usuario, datos.get("name") or usuario


def _limpiar():
    """Olvida los intentos que no han vuelto a tiempo (no crece sin límite)."""
    limite = time.time() - MINUTOS_PARA_VOLVER * 60
    for state in [s for s, (_, _, hora) in _pendientes.items() if hora < limite]:
        _pendientes.pop(state, None)
