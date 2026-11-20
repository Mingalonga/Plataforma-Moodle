"""Pieza 4: las cuentas de las personas que pueden entrar en la web y sus permisos.

Las contraseñas nunca se guardan: solo su huella cifrada (hash), que no se puede deshacer.

Permisos (nivel 7): para cada aula, "ver" o "cambiar". Un aula que no aparece = sin acceso.
Por defecto nadie tiene acceso a nada: hay que darlo con permisos.py.
"""
import json
import os
from pathlib import Path

from werkzeug.security import check_password_hash, generate_password_hash

ARCHIVO = Path("~/moodle-lab/usuarios-web.json").expanduser()  # fuera de la carpeta del código
LONGITUD_MINIMA = 12
NIVELES = ("ver", "cambiar")  # de menos a más: "cambiar" incluye "ver"
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
    cuenta = cuentas.get(usuario, {})
    cuenta["huella"] = generate_password_hash(contrasena)  # cambiar la contraseña no toca los permisos
    cuenta.setdefault("permisos", {})
    cuentas[usuario] = cuenta
    guardar(cuentas)


def existe(usuario):
    return usuario in cargar()


def permisos(usuario):
    """Aula -> "ver" o "cambiar". Se lee del archivo en cada petición: quitar un permiso es inmediato.

    Cualquier valor que no sea uno de los conocidos se ignora (como si no tuviera acceso).
    """
    cuenta = cargar().get(usuario) or {}
    return {aula: nivel for aula, nivel in cuenta.get("permisos", {}).items() if nivel in NIVELES}


def poner_permisos(usuario, nuevos):
    cuentas = cargar()
    if usuario not in cuentas:
        raise ValueError(f"no existe el usuario {usuario}")
    for aula, nivel in nuevos.items():
        if nivel not in NIVELES:
            raise ValueError(f"permiso no válido para {aula}: {nivel}")
    cuentas[usuario]["permisos"] = dict(nuevos)
    guardar(cuentas)


def comprobar(usuario, contrasena):
    """True si usuario y contraseña son correctos.

    Las cuentas de Microsoft no tienen huella: con contraseña local no se puede entrar en ellas.
    """
    cuenta = cargar().get(usuario)
    huella = cuenta.get("huella") if cuenta else None
    correcta = check_password_hash(huella or _HUELLA_FALSA, contrasena)
    return bool(huella) and correcta


def alta_microsoft(usuario, nombre):
    """La primera vez que alguien entra con Microsoft se apunta, SIN permisos.

    Así aparece en permisos.py y el administrador decide qué puede ver. Devuelve True si es nueva.
    """
    cuentas = cargar()
    if usuario in cuentas:
        return False
    cuentas[usuario] = {"tipo": "microsoft", "nombre": nombre, "permisos": {}}
    guardar(cuentas)
    return True
