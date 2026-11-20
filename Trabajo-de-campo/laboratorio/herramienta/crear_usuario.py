#!/usr/bin/env python3
"""Crea (o cambia la contraseña de) una persona que puede entrar en la web."""
import getpass
import re
import sys

import cuentas_web

usuario = input("Nombre de usuario: ").strip()
if not re.fullmatch(r"[a-z0-9._-]{3,30}", usuario):
    sys.exit("Usuario no válido: 3 a 30 caracteres, solo minúsculas, números, punto, guion y guion bajo.")
contrasena = getpass.getpass("Contraseña (no se verá al escribir): ")
if contrasena != getpass.getpass("Repítela: "):
    sys.exit("Las contraseñas no coinciden.")
try:
    cuentas_web.crear(usuario, contrasena)
except ValueError as error:
    sys.exit(f"No se ha creado: {error}.")
print(f"Usuario {usuario} guardado en {cuentas_web.ARCHIVO}")
print("Si es nuevo no tiene acceso a ninguna aula: dáselo con permisos.py")
