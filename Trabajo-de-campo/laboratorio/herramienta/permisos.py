#!/usr/bin/env python3
"""Decide qué puede hacer cada persona de la web en cada aula (nivel 7).

Para cada aula de aulas.json pregunta: n (nada), v (ver) o c (ver y cambiar).
"""
import sys

import cuentas_web
from centralizar import CONFIGURACION, cargar_configuracion

OPCIONES = {"n": None, "v": "ver", "c": "cambiar"}
TEXTO = {None: "nada", "ver": "ver", "cambiar": "ver y cambiar"}

cuentas = cuentas_web.cargar()
if not cuentas:
    sys.exit("No hay usuarios. Crea uno antes con crear_usuario.py.")

print("Usuarios de la web:")
for nombre in sorted(cuentas):
    actuales = cuentas_web.permisos(nombre)
    resumen = ", ".join(f"{aula}: {TEXTO[nivel]}" for aula, nivel in sorted(actuales.items())) or "sin acceso"
    print(f"  {nombre} ({resumen})")

usuario = input("\nUsuario al que cambiar los permisos: ").strip()
if usuario not in cuentas:
    sys.exit("Ese usuario no existe.")

actuales = cuentas_web.permisos(usuario)
nuevos = {}
print("Para cada aula: n = nada, v = ver, c = ver y cambiar. Intro deja lo que tenía.")
for aula in cargar_configuracion(CONFIGURACION)["aulas"]:
    nombre = aula["nombre"]
    actual = actuales.get(nombre)
    respuesta = input(f"  {nombre} (ahora: {TEXTO[actual]}): ").strip().lower()
    if respuesta == "":
        nivel = actual
    elif respuesta in OPCIONES:
        nivel = OPCIONES[respuesta]
    else:
        sys.exit(f"Respuesta no válida: {respuesta!r}. No se ha cambiado nada.")
    if nivel:
        nuevos[nombre] = nivel

cuentas_web.poner_permisos(usuario, nuevos)
print(f"Guardado. {usuario}: " + (", ".join(f"{a}: {TEXTO[n]}" for a, n in nuevos.items()) or "sin acceso"))
