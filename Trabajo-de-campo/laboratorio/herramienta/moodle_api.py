"""Pieza 1: hablar con la API de Moodle (servicios web REST).

Dos llaves separadas: el token de lectura solo puede leer y el de cambios solo puede cambiar.
"""
import json
import stat
import urllib.parse
import urllib.request
from pathlib import Path

# Listas blancas: con cada token solo se puede llamar a sus funciones.
FUNCIONES_LECTURA = {
    "core_webservice_get_site_info",
    "core_course_get_courses",
    "core_enrol_get_enrolled_users",
    "core_user_get_users",
}
FUNCIONES_CAMBIOS = {
    "core_user_update_users",
}
TIEMPO_MAXIMO = 10  # segundos de espera antes de dar un aula por caída
CAMPOS_USUARIO = ("id", "username", "fullname", "email", "lastaccess", "suspended")


class ErrorMoodle(Exception):
    """Cualquier problema al hablar con un aula. `codigo` es el código de error de Moodle, si lo hay."""

    def __init__(self, mensaje, codigo=None):
        super().__init__(mensaje)
        self.codigo = codigo


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


def llamar(aula, funcion, parametros=None, para_cambios=False):
    """Llama a una función de la API de un aula y devuelve la respuesta ya leída.

    Con para_cambios=True usa el token de cambios y solo admite FUNCIONES_CAMBIOS;
    si no, el de lectura y solo FUNCIONES_LECTURA. Nunca se mezclan.
    """
    permitidas, clave_token = (FUNCIONES_CAMBIOS, "token_cambios") if para_cambios else (FUNCIONES_LECTURA, "token")
    if funcion not in permitidas:
        raise ErrorMoodle(f"la función {funcion} no está en la lista blanca de este token")
    if not aula.get(clave_token):
        raise ErrorMoodle(f"el aula no tiene configurado {clave_token} en aulas.json")
    comprobar_direccion(aula["url"])
    datos = {"wstoken": leer_token(aula[clave_token]), "wsfunction": funcion, "moodlewsrestformat": "json"}
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
        raise ErrorMoodle(f"Moodle responde: {respuesta.get('message')} ({respuesta.get('errorcode')})",
                          codigo=respuesta.get("errorcode"))
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
        try:
            participantes = len(llamar(aula, "core_enrol_get_enrolled_users", {"courseid": curso["id"]}))
        except ErrorMoodle as error:
            if error.codigo != "errorcoursecontextnotvalid":
                raise
            # Curso oculto: el rol de solo lectura no tiene permiso para entrar en él.
            # Se enseña el curso igualmente, avisando, en vez de romper toda el aula.
            participantes = None
        cursos.append({
            "id": curso["id"],
            "nombre_corto": curso.get("shortname"),
            "nombre": curso.get("fullname"),
            "participantes": participantes,
        })
    return sorted(cursos, key=lambda c: c["nombre_corto"] or "")


# Nombres de los roles estándar de Moodle. Un rol que no esté aquí se enseña con su nombre corto.
ROLES = {
    "student": "Alumno/a",
    "editingteacher": "Profesor/a",
    "teacher": "Profesor/a sin edición",
    "manager": "Gestor/a",
}


def obtener_curso(aula, id_curso):
    """Un curso concreto (id, código y nombre). None si no existe en el aula."""
    respuesta = llamar(aula, "core_course_get_courses", {"options[ids][0]": int(id_curso)})
    for curso in respuesta:
        if curso.get("id") == int(id_curso) and curso.get("format") != "site":
            return {"id": curso["id"], "nombre_corto": curso.get("shortname"), "nombre": curso.get("fullname")}
    return None


def obtener_participantes(aula, id_curso):
    """Personas matriculadas en un curso con sus roles en ese curso (solo los campos necesarios)."""
    return [
        {
            "id": u.get("id"),
            "username": u.get("username"),
            "fullname": u.get("fullname"),
            "roles": [r.get("shortname") for r in u.get("roles", [])],
        }
        for u in llamar(aula, "core_enrol_get_enrolled_users", {"courseid": int(id_curso)})
    ]


def obtener_usuario(aula, username):
    """Un usuario concreto, leído en el momento (con el token de lectura). None si no existe."""
    respuesta = llamar(aula, "core_user_get_users",
                       {"criteria[0][key]": "username", "criteria[0][value]": username})
    usuarios = respuesta.get("users", [])
    if len(usuarios) != 1:
        return None
    return {campo: usuarios[0].get(campo) for campo in CAMPOS_USUARIO}


def cambiar_suspension(aula, id_usuario, suspender):
    """Suspende (True) o reactiva (False) una cuenta. Solo se envía el campo `suspended`."""
    respuesta = llamar(aula, "core_user_update_users", {
        "users[0][id]": int(id_usuario),
        "users[0][suspended]": 1 if suspender else 0,
    }, para_cambios=True)
    avisos = respuesta.get("warnings") if isinstance(respuesta, dict) else None
    if avisos:
        raise ErrorMoodle("Moodle avisa: " + "; ".join(a.get("message", "?") for a in avisos))
