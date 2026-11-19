# La herramienta (niveles 4 y 5)

Programa en Python que pregunta a varias aulas Moodle, junta a las personas por correo y marca las cuentas que hay que revisar. Se puede usar desde la terminal (`centralizar.py`, nivel 4) o desde una web con inicio de sesión (`web.py`, nivel 5).

| Archivo | Qué hace |
|---|---|
| `aulas.json` | Configuración: aulas (nombre, dirección, **ruta** del archivo del token), cuentas a ignorar y días de inactividad. No contiene secretos. |
| `moodle_api.py` | Lo único que habla con Moodle: lee el token, comprueba la dirección y llama a la API por POST. |
| `informe.py` | Junta por correo y clasifica cada cuenta (activa, inactiva, suspendida, nunca ha entrado). No usa la red. |
| `centralizar.py` | Programa de terminal: une las piezas y escribe el informe en pantalla. |
| `cuentas_web.py` | Cuentas de la web: guarda solo la huella (hash) de cada contraseña, en `~/moodle-lab/usuarios-web.json` con permisos 600. |
| `crear_usuario.py` | Crea o cambia una cuenta de la web (mínimo 12 caracteres). |
| `web.py` | La web (Flask): inicio de sesión y vista centralizada. Solo enseña; los datos vienen de las piezas anteriores. |
| `templates/`, `static/` | HTML (Jinja), estilo y fuentes. El logo (`static/logo.png`) no se publica: hay que copiarlo en local. |
| `requirements.txt` | Versiones exactas de Flask y sus dependencias. |

Uso:

```bash
python3 centralizar.py                      # informe en la terminal (sin dependencias)
python3 -m venv .venv && .venv/bin/pip install -r requirements.txt
.venv/bin/python crear_usuario.py           # una vez
.venv/bin/python web.py                     # http://127.0.0.1:5000
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

### Además, en la web

1. Contraseñas guardadas como huella (scrypt), nunca en claro, y comparación de igual duración exista o no el usuario.
2. Mismo mensaje de error si falla el usuario o la contraseña; 5 intentos fallidos bloquean 5 minutos.
3. Sesión en cookie firmada con una clave aleatoria (`~/moodle-lab/clave-web.txt`, 600), `HttpOnly`, `SameSite=Strict`, caduca a los 30 minutos y se renueva al entrar.
4. Token anti-CSRF en todos los formularios (también en «Salir»).
5. Cabeceras: `Content-Security-Policy` (nada de fuera, ni dentro de otra web), `nosniff`, `no-referrer` y `no-store` (las páginas con datos personales no se guardan).
6. Jinja escapa todos los datos: un nombre con HTML se muestra como texto.
7. Solo escucha en `127.0.0.1`, sin modo depuración. Registro de entradas y salidas en la terminal.
8. Fuentes incluidas en la herramienta (licencia OFL), sin cargar nada de Google ni de otros servidores.

Pendiente para un entorno real: HTTPS (y `SESSION_COOKIE_SECURE=True`), un servidor de verdad en vez del de desarrollo de Flask, guardar los tokens cifrados o en un gestor de secretos, que el bloqueo de intentos no se pierda al reiniciar, entrar con Microsoft 365 (nivel 7) y decidir dónde se ejecuta y quién puede ver la vista, que contiene datos personales.
