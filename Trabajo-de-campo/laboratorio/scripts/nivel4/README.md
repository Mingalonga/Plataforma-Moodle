# Nivel 4: vista centralizada por la API

Programa en Python (solo biblioteca estándar) que pregunta a varias aulas Moodle, junta a las personas por correo y marca las cuentas que hay que revisar.

| Archivo | Qué hace |
|---|---|
| `aulas.json` | Configuración: aulas (nombre, dirección, **ruta** del archivo del token), cuentas a ignorar y días de inactividad. No contiene secretos. |
| `moodle_api.py` | Lo único que habla con Moodle: lee el token, comprueba la dirección y llama a la API por POST. |
| `informe.py` | Junta por correo y clasifica cada cuenta (activa, inactiva, suspendida, nunca ha entrado). No usa la red. |
| `centralizar.py` | Programa principal: une las piezas y escribe el informe en pantalla. |

Uso, con los cuatro archivos en la misma carpeta:

```bash
python3 centralizar.py
```

## Medidas de seguridad

1. El token nunca está en el código ni en la configuración, solo la ruta a su archivo.
2. Se niega a usar un archivo de token que puedan leer otros usuarios del sistema (exige `chmod 600`) y comprueba que tiene formato de token.
3. El token viaja por POST, no en la dirección.
4. Solo HTTPS; HTTP se permite únicamente en `localhost` (laboratorio).
5. Lista blanca con las 4 funciones de lectura: el programa no puede llamar a otras aunque el token lo permitiera.
6. Minimización: de cada usuario solo se guardan 5 campos (usuario, nombre, correo, último acceso, suspendido).
7. Tiempo máximo de 10 s por aula; si un aula falla, el informe sigue y se marca como INCOMPLETO.
8. Sin dependencias externas.

Pendiente para un entorno real: guardar los tokens cifrados o en un gestor de secretos, y decidir dónde se ejecuta y quién puede ver el informe, que contiene datos personales.
