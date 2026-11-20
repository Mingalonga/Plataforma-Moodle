"""Pieza 6: los cambios. Prepara la vista previa, ejecuta el cambio, lo comprueba y lo registra.

Regla de oro: el registro se escribe SIEMPRE, salga bien o mal, y nunca se borra ni se reescribe.
"""
import json
import os
from datetime import datetime, timezone
from pathlib import Path

from moodle_api import ErrorMoodle, cambiar_suspension, obtener_usuario

REGISTRO = Path("~/moodle-lab/registro-cambios.jsonl").expanduser()  # una línea JSON por cambio
ACCIONES = {
    "suspender": {"suspender": True, "texto": "suspender", "efecto": "No podrá entrar en el aula hasta que se reactive. No se borra nada."},
    "reactivar": {"suspender": False, "texto": "reactivar", "efecto": "Podrá volver a entrar en el aula con su contraseña de siempre."},
}


class CambioNoPermitido(Exception):
    """El cambio no tiene sentido o no se debe hacer (se explica en el mensaje)."""


def preparar(aula, username, accion, ignorar):
    """Lee el estado actual y devuelve el plan para la vista previa. No cambia nada."""
    if accion not in ACCIONES:
        raise CambioNoPermitido("acción desconocida")
    if username in ignorar:
        raise CambioNoPermitido("las cuentas técnicas no se tocan desde la herramienta")
    if not aula.get("token_cambios"):
        raise CambioNoPermitido(f"{aula['nombre']} no tiene token de cambios configurado")
    usuario = obtener_usuario(aula, username)
    if usuario is None:
        raise CambioNoPermitido(f"no existe el usuario {username} en {aula['nombre']}")
    suspender = ACCIONES[accion]["suspender"]
    if bool(usuario["suspended"]) == suspender:
        raise CambioNoPermitido(f"{username} ya está {'suspendida' if suspender else 'activa'}: no hay nada que cambiar")
    return {
        "aula": aula["nombre"],
        "id": usuario["id"],
        "username": usuario["username"],
        "nombre": usuario["fullname"],
        "accion": accion,
        "antes": "suspendida" if usuario["suspended"] else "activa",
        "despues": "suspendida" if suspender else "activa",
    }


def ejecutar(aula, plan, quien):
    """Hace el cambio del plan, comprueba que se ha aplicado y lo registra. Devuelve (ok, mensaje)."""
    suspender = ACCIONES[plan["accion"]]["suspender"]
    try:
        actual = obtener_usuario(aula, plan["username"])
        if actual is None or actual["id"] != plan["id"]:
            raise CambioNoPermitido("el usuario ya no es el mismo que en la vista previa")
        if bool(actual["suspended"]) == suspender:
            raise CambioNoPermitido("alguien ya lo cambió desde la vista previa")
        cambiar_suspension(aula, plan["id"], suspender)
        comprobado = obtener_usuario(aula, plan["username"])  # ¿se ha aplicado de verdad?
        if comprobado is None or bool(comprobado["suspended"]) != suspender:
            raise ErrorMoodle("Moodle no dio error, pero al volver a leer la cuenta el cambio no aparece")
        ok, detalle = True, f"{plan['antes']} → {plan['despues']}"
    except (ErrorMoodle, CambioNoPermitido) as error:
        ok, detalle = False, str(error)
    registrar(quien, plan, ok, detalle)
    return ok, detalle


def registrar(quien, plan, ok, detalle):
    """Añade una línea al registro (archivo con permisos 600, solo se añade al final)."""
    linea = {
        "fecha": datetime.now(timezone.utc).astimezone().isoformat(timespec="seconds"),
        "quien": quien,
        "aula": plan["aula"],
        "usuario": plan["username"],
        "accion": plan["accion"],
        "resultado": "correcto" if ok else "ERROR",
        "detalle": detalle,
    }
    descriptor = os.open(REGISTRO, os.O_WRONLY | os.O_CREAT | os.O_APPEND, 0o600)
    with os.fdopen(descriptor, "a") as archivo:
        archivo.write(json.dumps(linea, ensure_ascii=False) + "\n")


def leer_registro(ultimas=100):
    """Las últimas líneas del registro, de la más nueva a la más antigua."""
    if not REGISTRO.exists():
        return []
    lineas = REGISTRO.read_text().splitlines()[-ultimas:]
    return [json.loads(linea) for linea in reversed(lineas) if linea.strip()]
