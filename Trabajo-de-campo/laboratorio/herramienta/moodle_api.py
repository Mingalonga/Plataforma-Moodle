"""Pieza 1: hablar con la API de Moodle (servicios web REST), solo lectura."""
import json
import stat
import urllib.parse
import urllib.request
from pathlib import Path

# Lista blanca: la herramienta solo puede llamar a estas funciones de lectura.
FUNCIONES_PERMITIDAS = {
    "core_webservice_get_site_info",
    "core_course_get_courses",
    "core_enrol_get_enrolled_users",
    "core_user_get_users",
}
TIEMPO_MAXIMO = 10  # segundos de espera antes de dar un aula por caída
CAMPOS_USUARIO = ("username", "fullname", "email", "lastaccess", "suspended")


class ErrorMoodle(Exception):
    """Cualquier problema al hablar con un aula."""


def leer_token(ruta):
    """Lee el token de su archivo, comprobando que solo lo puede leer su dueño."""
    ruta = Path(ruta).expanduser()
    if not ruta.is_file():
        raise ErrorMoodle(f"no existe el archivo del token {ruta}")
    if ruta.stat().st_mode & (stat.S_IRWXG | stat.S_IRWXO):
        raise ErrorMoodle(f"otros usuarios pueden leer {ruta}; arréglalo con: chmod 600 {ruta}")
    token = ruta.read_text().strip()
    if len(token) != 32 or any(c not in "0123456789abcdef" for c in token):
        raise ErrorMoodle(f"{ruta} no contiene un token válido")
    return token


def comprobar_direccion(url):
    """Solo HTTPS. HTTP se permite únicamente en el propio ordenador (laboratorio)."""
    partes = urllib.parse.urlsplit(url)
    if partes.scheme == "https":
        return
    if partes.scheme == "http" and partes.hostname in ("localhost", "127.0.0.1"):
        return
    raise ErrorMoodle(f"{url}: hay que usar https (http solo vale en localhost)")


def llamar(aula, funcion, parametros=None):
    """Llama a una función de la API de un aula y devuelve la respuesta ya leída."""
    if funcion not in FUNCIONES_PERMITIDAS:
        raise ErrorMoodle(f"la función {funcion} no está en la lista blanca")
    comprobar_direccion(aula["url"])
    datos = {"wstoken": leer_token(aula["token"]), "wsfunction": funcion, "moodlewsrestformat": "json"}
    datos.update(parametros or {})
    direccion = aula["url"].rstrip("/") + "/webservice/rest/server.php"
    cuerpo = urllib.parse.urlencode(datos).encode()
    # Por POST: el token va dentro del mensaje, no en la dirección.
    try:
        with urllib.request.urlopen(direccion, data=cuerpo, timeout=TIEMPO_MAXIMO) as r:
            respuesta = json.load(r)
    except OSError as error:  # aula parada, sin red, tiempo agotado...
        raise ErrorMoodle(f"no responde ({getattr(error, 'reason', error)})") from None
    except ValueError:
        raise ErrorMoodle("la respuesta no es JSON (¿es un Moodle?)") from None
    if isinstance(respuesta, dict) and "exception" in respuesta:
        raise ErrorMoodle(f"Moodle responde: {respuesta.get('message')} ({respuesta.get('errorcode')})")
    return respuesta


def obtener_usuarios(aula, ignorar):
    """Todos los usuarios de un aula, quedándonos solo con los campos que necesitamos."""
    respuesta = llamar(aula, "core_user_get_users",
                       {"criteria[0][key]": "email", "criteria[0][value]": "%"})
    return [
        {campo: u.get(campo) for campo in CAMPOS_USUARIO}
        for u in respuesta.get("users", [])
        if u.get("username") not in ignorar
    ]


def obtener_cursos(aula):
    """Cursos de un aula (sin la portada del sitio) con su número de participantes."""
    cursos = []
    for curso in llamar(aula, "core_course_get_courses"):
        if curso.get("format") == "site":  # la portada de Moodle también cuenta como "curso"
            continue
        matriculados = llamar(aula, "core_enrol_get_enrolled_users", {"courseid": curso["id"]})
        cursos.append({
            "nombre_corto": curso.get("shortname"),
            "nombre": curso.get("fullname"),
            "participantes": len(matriculados),
        })
    return sorted(cursos, key=lambda c: c["nombre_corto"] or "")
