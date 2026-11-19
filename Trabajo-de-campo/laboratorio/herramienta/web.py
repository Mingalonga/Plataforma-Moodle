#!/usr/bin/env python3
"""Pieza 5: la web. Solo enseña: los datos los traen moodle_api.py e informe.py."""
import functools
import logging
import os
import secrets
import time
from datetime import timedelta
from pathlib import Path

from flask import Flask, abort, redirect, render_template, request, session, url_for

import cuentas_web
from centralizar import CONFIGURACION, cargar_configuracion, consultar_aulas
from informe import estado_cuenta, juntar_por_correo, para_revisar
from moodle_api import ErrorMoodle, obtener_cursos

ARCHIVO_CLAVE = Path("~/moodle-lab/clave-web.txt").expanduser()
INTENTOS_MAXIMOS = 5          # fallos seguidos antes de bloquear
MINUTOS_BLOQUEO = 5
logging.basicConfig(level=logging.INFO, format="%(asctime)s %(message)s")
registro = logging.getLogger("web")


def clave_secreta():
    """Clave con la que se firman las cookies de sesión. Se crea una vez, con permisos 600."""
    if not ARCHIVO_CLAVE.exists():
        descriptor = os.open(ARCHIVO_CLAVE, os.O_WRONLY | os.O_CREAT | os.O_EXCL, 0o600)
        with os.fdopen(descriptor, "w") as archivo:
            archivo.write(secrets.token_hex(32))
    return ARCHIVO_CLAVE.read_text().strip()


app = Flask(__name__)
app.config.update(
    SECRET_KEY=clave_secreta(),
    SESSION_COOKIE_HTTPONLY=True,        # JavaScript no puede leer la cookie
    SESSION_COOKIE_SAMESITE="Strict",    # otras webs no pueden usar tu sesión
    SESSION_COOKIE_SECURE=False,         # en producción, True (solo por HTTPS)
    PERMANENT_SESSION_LIFETIME=timedelta(minutes=30),
)
fallos = {}  # dirección IP -> (número de fallos, hora del último)


@app.after_request
def cabeceras_de_seguridad(respuesta):
    respuesta.headers["Content-Security-Policy"] = "default-src 'self'; frame-ancestors 'none'"
    respuesta.headers["X-Content-Type-Options"] = "nosniff"
    respuesta.headers["Referrer-Policy"] = "no-referrer"
    respuesta.headers["Cache-Control"] = "no-store"  # hay datos personales: que no se guarden
    return respuesta


def token_formulario():
    """Token anti-CSRF: demuestra que el formulario viene de esta web y no de otra."""
    if "csrf" not in session:
        session["csrf"] = secrets.token_urlsafe(32)
    return session["csrf"]


app.jinja_env.globals["token_formulario"] = token_formulario


def comprobar_token_formulario():
    enviado = request.form.get("csrf", "")
    if not secrets.compare_digest(enviado, session.get("csrf", "")):
        abort(400)


def requiere_sesion(vista):
    @functools.wraps(vista)
    def envoltorio(*args, **kwargs):
        if "usuario" not in session:
            return redirect(url_for("entrar"))
        return vista(*args, **kwargs)
    return envoltorio


def bloqueado(ip):
    numero, ultimo = fallos.get(ip, (0, 0))
    if numero >= INTENTOS_MAXIMOS and time.time() - ultimo < MINUTOS_BLOQUEO * 60:
        return True
    if numero >= INTENTOS_MAXIMOS:
        fallos.pop(ip)  # ya pasó el bloqueo
    return False


@app.route("/entrar", methods=["GET", "POST"])
def entrar():
    error = None
    if request.method == "POST":
        comprobar_token_formulario()
        ip = request.remote_addr
        usuario = request.form.get("usuario", "")
        if bloqueado(ip):
            error = f"Demasiados intentos. Espera {MINUTOS_BLOQUEO} minutos."
        elif cuentas_web.comprobar(usuario, request.form.get("contrasena", "")):
            fallos.pop(ip, None)
            session.clear()  # sesión nueva al entrar
            session.permanent = True
            session["usuario"] = usuario
            registro.info("ENTRADA correcta: %s desde %s", usuario, ip)
            return redirect(url_for("vista"))
        else:
            numero, _ = fallos.get(ip, (0, 0))
            fallos[ip] = (numero + 1, time.time())
            registro.warning("ENTRADA fallida: %r desde %s", usuario[:30], ip)
            error = "Usuario o contraseña incorrectos."  # el mismo mensaje en los dos casos
    return render_template("entrar.html", error=error)


@app.route("/salir", methods=["POST"])
def salir():
    comprobar_token_formulario()
    registro.info("SALIDA: %s", session.get("usuario"))
    session.clear()
    return redirect(url_for("entrar"))


@app.route("/")
@requiere_sesion
def vista():
    config = cargar_configuracion(CONFIGURACION)
    limite, ahora = config["dias_inactividad"], time.time()
    nombres_aulas = [aula["nombre"] for aula in config["aulas"]]

    # Filtro por aula: solo se acepta un nombre que esté en aulas.json.
    elegida = request.args.get("aula")
    if elegida is not None and elegida not in nombres_aulas:
        abort(404)
    if elegida:
        config["aulas"] = [aula for aula in config["aulas"] if aula["nombre"] == elegida]

    usuarios_por_aula, fallos_aulas = consultar_aulas(config)
    personas, sin_correo = juntar_por_correo(usuarios_por_aula)

    cursos_por_aula = {}  # nombre del aula -> lista de cursos (o texto del error)
    for aula in config["aulas"]:
        if aula["nombre"] in usuarios_por_aula:
            try:
                cursos_por_aula[aula["nombre"]] = obtener_cursos(aula)
            except ErrorMoodle as error:
                cursos_por_aula[aula["nombre"]] = f"No se pudieron leer los cursos: {error}"

    filas = []
    for correo, persona in sorted(personas.items(), key=lambda par: par[1]["nombre"] or ""):
        cuentas = []
        for aula, usuario in persona["cuentas"]:
            estado, texto = estado_cuenta(usuario, limite, ahora)
            cuentas.append({"aula": aula, "usuario": usuario["username"], "estado": estado, "texto": texto})
        filas.append({"nombre": persona["nombre"], "correo": correo, "cuentas": cuentas})

    return render_template(
        "vista.html",
        filas=filas,
        revisar=para_revisar(personas, limite, ahora),
        sin_correo=sin_correo,
        fallos=fallos_aulas,
        aulas_ok=len(usuarios_por_aula),
        aulas_total=len(config["aulas"]),
        limite=limite,
        nombres_aulas=nombres_aulas,
        elegida=elegida,
        cursos_por_aula=cursos_por_aula,
    )


if __name__ == "__main__":
    # Solo escucha en este ordenador. debug=False: nunca enseñar errores internos.
    app.run(host="127.0.0.1", port=5000, debug=False)
