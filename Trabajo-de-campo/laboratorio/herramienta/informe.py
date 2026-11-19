"""Pieza 3: juntar a las personas de todas las aulas y ver el estado de cada cuenta.

No habla con Moodle: solo recibe listas de usuarios y las ordena. Así se puede probar sin aulas.
"""
SEGUNDOS_DIA = 86400


def estado_cuenta(usuario, dias_limite, ahora):
    """Devuelve (estado, texto). Estado: suspendida, nunca, inactiva o activa."""
    if usuario.get("suspended"):
        return "suspendida", "suspendida"
    ultimo = usuario.get("lastaccess") or 0
    if ultimo == 0:
        return "nunca", "nunca ha entrado"
    dias = int((ahora - ultimo) // SEGUNDOS_DIA)
    if dias > dias_limite:
        return "inactiva", f"inactiva ({dias} días sin entrar)"
    return "activa", f"activa (hace {dias} días)"


def juntar_por_correo(usuarios_por_aula):
    """Agrupa las cuentas de todas las aulas por correo.

    Recibe {nombre_aula: [usuarios]} y devuelve:
      personas:   {correo: {"nombre": ..., "cuentas": [(aula, usuario), ...]}}
      sin_correo: [(aula, usuario), ...] cuentas que no se pueden cruzar
    """
    personas, sin_correo = {}, []
    for aula, usuarios in usuarios_por_aula.items():
        for usuario in usuarios:
            correo = (usuario.get("email") or "").strip().lower()
            if not correo:
                sin_correo.append((aula, usuario))
                continue
            persona = personas.setdefault(correo, {"nombre": usuario.get("fullname"), "cuentas": []})
            persona["cuentas"].append((aula, usuario))
    return personas, sin_correo


def para_revisar(personas, dias_limite, ahora):
    """Cuentas suspendidas, inactivas o que nunca han entrado, para que alguien las revise."""
    revisar = []
    for correo, persona in sorted(personas.items()):
        for aula, usuario in persona["cuentas"]:
            estado, texto = estado_cuenta(usuario, dias_limite, ahora)
            if estado != "activa":
                revisar.append((estado, persona["nombre"], aula, usuario["username"], texto))
    orden = {"inactiva": 0, "suspendida": 1, "nunca": 2}
    return sorted(revisar, key=lambda fila: orden[fila[0]])
