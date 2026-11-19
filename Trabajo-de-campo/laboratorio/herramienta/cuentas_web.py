"""Pieza 4: las cuentas de las personas que pueden entrar en la web.

Las contraseñas nunca se guardan: solo su huella cifrada (hash), que no se puede deshacer.
"""
import json
import os
from pathlib import Path

from werkzeug.security import check_password_hash, generate_password_hash

ARCHIVO = Path("~/moodle-lab/usuarios-web.json").expanduser()  # fuera de la carpeta del código
LONGITUD_MINIMA = 12
# Huella de una contraseña inventada: se usa cuando el usuario no existe, para tardar
# lo mismo que con uno que sí existe y no dar pistas de qué usuarios hay.
_HUELLA_FALSA = generate_password_hash("no-existe-este-usuario")


def cargar():
    if not ARCHIVO.exists():
        return {}
    return json.loads(ARCHIVO.read_text())


def guardar(cuentas):
    ARCHIVO.parent.mkdir(parents=True, exist_ok=True)
    # Se crea con permisos 600 desde el principio (solo su dueño lo puede leer).
    descriptor = os.open(ARCHIVO, os.O_WRONLY | os.O_CREAT | os.O_TRUNC, 0o600)
    with os.fdopen(descriptor, "w") as archivo:
        json.dump(cuentas, archivo, indent=2)


def crear(usuario, contrasena):
    if len(contrasena) < LONGITUD_MINIMA:
        raise ValueError(f"la contraseña debe tener al menos {LONGITUD_MINIMA} caracteres")
    cuentas = cargar()
    cuentas[usuario] = {"huella": generate_password_hash(contrasena)}
    guardar(cuentas)


def comprobar(usuario, contrasena):
    """True si usuario y contraseña son correctos."""
    cuenta = cargar().get(usuario)
    huella = cuenta["huella"] if cuenta else _HUELLA_FALSA
    correcta = check_password_hash(huella, contrasena)
    return bool(cuenta) and correcta
