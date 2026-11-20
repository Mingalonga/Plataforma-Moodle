#!/usr/bin/env python3
"""Guarda la configuración para entrar con Microsoft 365 en ~/moodle-lab/m365.json (permisos 600).

Pide los dos identificadores de la aplicación registrada en Microsoft Entra. El secreto NO se
pide aquí: va en su propio archivo (~/moodle-lab/m365-secreto.txt), igual que los tokens.
"""
import json
import os
import sys

import acceso_microsoft

datos = {
    "tenant": input("Directory (tenant) ID: ").strip().lower(),
    "cliente": input("Application (client) ID: ").strip().lower(),
    "secreto": "~/moodle-lab/m365-secreto.txt",
    "redireccion": "http://localhost:5000/auth/callback",
}
for clave in ("tenant", "cliente"):
    if not acceso_microsoft._UUID.fullmatch(datos[clave]):
        sys.exit(f"El {clave} no tiene el formato esperado (8-4-4-4-12 caracteres). No se ha guardado nada.")

descriptor = os.open(acceso_microsoft.ARCHIVO, os.O_WRONLY | os.O_CREAT | os.O_TRUNC, 0o600)
with os.fdopen(descriptor, "w") as archivo:
    json.dump(datos, archivo, indent=2)
print(f"Guardado en {acceso_microsoft.ARCHIVO}")
