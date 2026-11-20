#!/usr/bin/env python3
"""Pieza 5: la web. Enseña la vista centralizada y pide confirmación para cada cambio.

No habla con Moodle directamente: lo hacen moodle_api.py, informe.py y cambios.py.
"""
import functools
import logging
import os
import secrets
import time
from datetime import timedelta
from pathlib import Path

from flask import Flask, abort, redirect, render_template, request, session, url_for

import cambios
import cuentas_web
from centralizar import CONFIGURACION, cargar_configuracion, consultar_aulas
from informe import estado_cuenta, juntar_por_correo, para_revisar
from moodle_api import ROLES, ErrorMoodle, obtener_curso, obtener_cursos, obtener_participantes, obtener_usuarios

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
        # Si la cuenta se ha borrado mientras tenía la sesión abierta, la sesión deja de valer.
        if "usuario" not in session or not cuentas_web.existe(session["usuario"]):
            session.clear()
            return redirect(url_for("entrar"))
        return vista(*args, **kwargs)
    return envoltorio


# --- Permisos (nivel 7) -------------------------------------------------------------
# Se leen en cada petición, así que quitar un permiso tiene efecto inmediato.
# Un aula sin permiso se trata como si no existiera (404): ni siquiera se confirma que existe.

def mis_permisos():
    return cuentas_web.permisos(session["usuario"])


def aulas_visibles(config):
    permisos = mis_permisos()
    return [aula for aula in config["aulas"] if aula["nombre"] in permisos]


def puede_cambiar(nombre_aula):
    return mis_permisos().get(nombre_aula) == "cambiar"


def aula_permitida(config, nombre, para_cambiar=False):
    """El aula pedida, solo si existe y la persona tiene permiso. Si no, 404 o 403."""
    aula = buscar_aula(config, nombre)
    permiso = mis_permisos().get(aula["nombre"])
    if permiso is None:
        abort(404)
    if para_cambiar and permiso != "cambiar":
        registro.warning("PERMISO denegado: %s quiso cambiar en %s", session["usuario"], aula["nombre"])
        abort(403)
    return aula


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
    config["aulas"] = aulas_visibles(config)  # solo las aulas en las que tiene permiso
    nombres_aulas = [aula["nombre"] for aula in config["aulas"]]
    if not nombres_aulas:
        return render_template("sin_permisos.html")

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
            cuentas.append({"aula": aula, "usuario": usuario["username"], "estado": estado, "texto": texto,
                            "suspendida": bool(usuario["suspended"])})
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
        aulas_con_cambios={a["nombre"] for a in config["aulas"]
                           if a.get("token_cambios") and puede_cambiar(a["nombre"])},
        aviso=session.pop("aviso", None),
    )



def buscar_aula(config, nombre):
    for aula in config["aulas"]:
        if aula["nombre"] == nombre:
            return aula
    abort(404)


# Filtro de la página de un curso: qué roles entran en cada pestaña.
GRUPOS_ROL = {
    "alumnado": {"student"},
    "profesorado": {"editingteacher", "teacher"},
}


@app.route("/curso")
@requiere_sesion
def ver_curso():
    """Las personas de un curso, con su rol, su estado y la acción. Solo lectura hasta pulsar una acción."""
    config = cargar_configuracion(CONFIGURACION)
    aula = aula_permitida(config, request.args.get("aula", ""))
    id_curso = request.args.get("curso", "")
    if not id_curso.isdigit():  # solo números: nada raro llega a Moodle
        abort(404)
    grupo = request.args.get("rol", "todos")
    if grupo != "todos" and grupo not in GRUPOS_ROL:
        abort(404)

    limite, ahora = config["dias_inactividad"], time.time()
    try:
        curso = obtener_curso(aula, id_curso)
        if curso is None:
            abort(404)
        participantes = obtener_participantes(aula, id_curso)
        # El estado (suspendida, último acceso) y el correo salen de la lista de usuarios del aula.
        usuarios = {u["id"]: u for u in obtener_usuarios(aula, config["ignorar"])}
    except ErrorMoodle as error:
        session["aviso"] = {"ok": False, "texto": f"No se pudo abrir el curso: {error}"}
        return redirect(url_for("vista", aula=aula["nombre"]))

    filas, cuenta = [], {"todos": 0, **{g: 0 for g in GRUPOS_ROL}}
    for p in participantes:
        usuario = usuarios.get(p["id"])
        if usuario is None:  # cuentas técnicas o ignoradas
            continue
        roles = set(p["roles"])
        cuenta["todos"] += 1
        for g, incluidos in GRUPOS_ROL.items():
            if roles & incluidos:
                cuenta[g] += 1
        if grupo != "todos" and not roles & GRUPOS_ROL[grupo]:
            continue
        estado, texto = estado_cuenta(usuario, limite, ahora)
        filas.append({
            "nombre": usuario["fullname"], "correo": usuario["email"], "usuario": usuario["username"],
            "roles": ", ".join(ROLES.get(r, r) for r in p["roles"]) or "sin rol",
            "estado": estado, "texto": texto, "suspendida": bool(usuario["suspended"]),
        })
    filas.sort(key=lambda f: f["nombre"] or "")
    return render_template("curso.html", aula=aula["nombre"], curso=curso, filas=filas, grupo=grupo,
                           cuenta=cuenta, con_cambios=bool(aula.get("token_cambios")) and puede_cambiar(aula["nombre"]),
                           aviso=session.pop("aviso", None))


@app.route("/cambio")
@requiere_sesion
def vista_previa():
    """Paso 1 de un cambio: enseña qué va a pasar. No cambia nada."""
    config = cargar_configuracion(CONFIGURACION)
    aula = aula_permitida(config, request.args.get("aula", ""), para_cambiar=True)
    try:
        plan = cambios.preparar(aula, request.args.get("usuario", ""), request.args.get("accion", ""),
                                config["ignorar"])
    except (cambios.CambioNoPermitido, ErrorMoodle) as error:
        session["aviso"] = {"ok": False, "texto": f"No se puede preparar el cambio: {error}"}
        return redirect(url_for("vista", aula=aula["nombre"]))
    curso = request.args.get("curso", "")
    plan["curso"] = int(curso) if curso.isdigit() else None  # para volver al curso después
    plan["codigo"] = secrets.token_urlsafe(16)  # liga la confirmación a ESTA vista previa
    session["plan"] = plan
    return render_template("cambio.html", plan=plan, efecto=cambios.ACCIONES[plan["accion"]]["efecto"],
                           volver=volver_de(plan))


@app.route("/cambio/confirmar", methods=["POST"])
@requiere_sesion
def confirmar_cambio():
    """Paso 2 de un cambio: solo se ejecuta lo que se vio en la vista previa, y una sola vez."""
    comprobar_token_formulario()
    plan = session.pop("plan", None)
    if not plan or not secrets.compare_digest(request.form.get("codigo", ""), plan["codigo"]):
        session["aviso"] = {"ok": False, "texto": "La vista previa ha caducado o ya se usó. Vuelve a empezar."}
        return redirect(url_for("vista"))
    config = cargar_configuracion(CONFIGURACION)
    # Se vuelve a comprobar: el permiso se ha podido quitar entre la vista previa y la confirmación.
    aula = aula_permitida(config, plan["aula"], para_cambiar=True)
    ok, detalle = cambios.ejecutar(aula, plan, session["usuario"])
    registro.info("CAMBIO %s: %s %s en %s por %s (%s)", "correcto" if ok else "ERROR",
                  plan["accion"], plan["username"], plan["aula"], session["usuario"], detalle)
    texto = f"{plan['nombre']} ({plan['username']}, {plan['aula']}): {detalle}"
    session["aviso"] = {"ok": ok, "texto": ("Hecho. " if ok else "No se ha hecho. ") + texto}
    return redirect(volver_de(plan))


def volver_de(plan):
    """Después de un cambio (o al cancelarlo) se vuelve a donde se empezó: el curso o la vista."""
    if plan.get("curso"):
        return url_for("ver_curso", aula=plan["aula"], curso=plan["curso"])
    return url_for("vista", aula=plan["aula"])


@app.route("/registro")
@requiere_sesion
def ver_registro():
    # Cada persona solo ve los cambios de las aulas que puede ver.
    permisos = mis_permisos()
    lineas = [linea for linea in cambios.leer_registro() if linea.get("aula") in permisos]
    return render_template("registro.html", lineas=lineas)


if __name__ == "__main__":
    # Solo escucha en este ordenador. debug=False: nunca enseñar errores internos.
    app.run(host="127.0.0.1", port=5000, debug=False)
