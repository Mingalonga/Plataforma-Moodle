#!/usr/bin/env python3
"""Pieza 2: el programa principal. Pregunta a cada aula y enseña la vista centralizada."""
import json
import sys
import time
from pathlib import Path

from informe import estado_cuenta, juntar_por_correo, para_revisar
from moodle_api import ErrorMoodle, obtener_usuarios

CONFIGURACION = Path(__file__).with_name("aulas.json")


def cargar_configuracion(ruta):
    """Lee aulas.json y comprueba que no falta nada."""
    try:
        config = json.loads(ruta.read_text())
        for aula in config["aulas"]:
            for clave in ("nombre", "url", "token"):
                if not isinstance(aula.get(clave), str):
                    raise KeyError(clave)
            if "token_cambios" in aula and not isinstance(aula["token_cambios"], str):
                raise KeyError("token_cambios")
        if not isinstance(config.get("dias_inactividad"), int):
            raise KeyError("dias_inactividad")
        config["ignorar"] = set(config.get("ignorar", []))
    except (OSError, ValueError, KeyError, TypeError) as error:
        sys.exit(f"Error en {ruta.name}: {error!r}")
    return config


def consultar_aulas(config):
    """Pide los usuarios a cada aula. Devuelve los que respondieron y los que fallaron."""
    usuarios_por_aula, fallos = {}, []
    for aula in config["aulas"]:
        try:
            usuarios_por_aula[aula["nombre"]] = obtener_usuarios(aula, config["ignorar"])
        except ErrorMoodle as error:
            fallos.append(f"{aula['nombre']}: {error}")
    return usuarios_por_aula, fallos


def main():
    config = cargar_configuracion(CONFIGURACION)
    limite = config["dias_inactividad"]
    ahora = time.time()

    usuarios_por_aula, fallos = consultar_aulas(config)
    personas, sin_correo = juntar_por_correo(usuarios_por_aula)

    print(f"Aulas consultadas: {len(usuarios_por_aula)} de {len(config['aulas'])}")
    for fallo in fallos:
        print(f"  ERROR {fallo}  (el informe está INCOMPLETO)")
    varias = sum(1 for p in personas.values() if len(p["cuentas"]) > 1)
    print(f"Personas distintas: {len(personas)} ({varias} en más de un aula)\n")

    for correo, persona in sorted(personas.items(), key=lambda par: par[1]["nombre"] or ""):
        print(f"{persona['nombre']} <{correo}>")
        for aula, usuario in persona["cuentas"]:
            _, texto = estado_cuenta(usuario, limite, ahora)
            print(f"    {aula:<8} {usuario['username']:<16} {texto}")

    print(f"\nPARA REVISAR (más de {limite} días sin entrar, suspendidas o sin estrenar):")
    for _, nombre, aula, username, texto in para_revisar(personas, limite, ahora):
        print(f"    {nombre:<18} {aula:<8} {username:<16} {texto}")
    for aula, usuario in sin_correo:
        print(f"    {usuario['username']} en {aula}: SIN CORREO, no se puede cruzar con otras aulas")


if __name__ == "__main__":
    main()
