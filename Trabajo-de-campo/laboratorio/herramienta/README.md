# La herramienta (niveles 4 a 7)

Programa en Python que pregunta a varias aulas Moodle, junta a las personas por correo y marca las cuentas que hay que revisar. Se puede usar desde la terminal (`centralizar.py`, nivel 4) o desde una web con inicio de sesión (`web.py`, nivel 5). Desde la web se puede abrir cada curso para ver su alumnado y profesorado, y suspender y reactivar cuentas, con vista previa, confirmación y registro (nivel 6). Cada persona solo ve y cambia las aulas que se le permiten, y se puede entrar con Microsoft 365 (nivel 7).

| Archivo | Qué hace |
|---|---|
| `aulas.json` | Configuración: aulas (nombre, dirección, **rutas** de los archivos de los tokens de lectura y de cambios), cuentas a ignorar y días de inactividad. No contiene secretos. |
| `moodle_api.py` | Lo único que habla con Moodle: lee el token, comprueba la dirección y llama a la API por POST. |
| `informe.py` | Junta por correo y clasifica cada cuenta (activa, inactiva, suspendida, nunca ha entrado). No usa la red. |
| `centralizar.py` | Programa de terminal: une las piezas y escribe el informe en pantalla. |
| `cuentas_web.py` | Cuentas de la web: guarda solo la huella (hash) de cada contraseña, en `~/moodle-lab/usuarios-web.json` con permisos 600. |
| `crear_usuario.py` | Crea o cambia una cuenta local de la web (mínimo 12 caracteres). Cambiar la contraseña no toca los permisos. |
| `permisos.py` | Da a cada persona, aula por aula, "nada", "ver" o "ver y cambiar". Por defecto, nada. |
| `acceso_microsoft.py` | Entrar con Microsoft 365 (OpenID Connect con MSAL). La contraseña se escribe en Microsoft, nunca aquí. |
| `configurar_m365.py` | Guarda los identificadores de la aplicación registrada en Microsoft en `~/moodle-lab/m365.json` (600). |
| `cambios.py` | Cambios reales (nivel 6): prepara el plan, lo ejecuta, comprueba el resultado en Moodle y lo apunta en `~/moodle-lab/registro-cambios.jsonl`. |
| `web.py` | La web (Flask): inicio de sesión, vista centralizada, vista previa y confirmación de cambios y registro. Los datos y los cambios vienen de las piezas anteriores. |
| `templates/`, `static/` | HTML (Jinja), estilo y fuentes. El logo (`static/logo.png`) no se publica: hay que copiarlo en local. |
| `requirements.txt` | Versiones exactas de Flask y sus dependencias. |

Uso:

```bash
python3 centralizar.py                      # informe en la terminal (sin dependencias)
python3 -m venv .venv && .venv/bin/pip install -r requirements.txt
.venv/bin/python crear_usuario.py           # una vez
.venv/bin/python permisos.py                # qué aulas puede ver o cambiar
.venv/bin/python configurar_m365.py         # opcional: entrar con Microsoft 365
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

### Además, en los cambios (nivel 6)

1. **Dos identidades por aula.** La lectura usa `ws_lectura`; los cambios, un usuario aparte (`ws_cambios`) con un rol de solo 2 capacidades (`webservice/rest:use` y `moodle/user:update`), un servicio con una única función (`core_user_update_users`) y su propio token. Si se filtra el token de lectura, no se puede cambiar nada.
2. **Dos cerrojos:** Moodle solo deja usar esa función con ese token y, además, el código tiene su propia lista blanca de cambios y nunca mezcla los dos tokens.
3. Solo se envían dos campos (`id` y `suspended`): la petición no puede tocar nada más de la cuenta.
4. **Vista previa** obligatoria: nada cambia hasta confirmar. La confirmación es un formulario POST con token CSRF y un código de un solo uso, así que no se puede repetir ni provocar con un enlace.
5. Antes de cambiar se vuelve a leer la cuenta (por si ha cambiado entre la vista previa y la confirmación) y después se vuelve a leer para **comprobar** que Moodle lo ha aplicado.
6. Se niega a tocar las cuentas técnicas y del administrador, y a hacer cambios que no cambian nada.
7. **Registro** de cada intento, salga bien o mal (fecha, quién, aula, usuario, acción, resultado), en un archivo que solo crece y con permisos 600.

### Además, en permisos y Microsoft 365 (nivel 7)

1. Nada por defecto: una cuenta nueva (local o de Microsoft) no ve ninguna aula hasta que se le da permiso.
2. Un aula sin permiso responde "no encontrado", como si no existiera; intentar cambiar con permiso de solo ver responde "prohibido" y se apunta.
3. Los permisos se leen en cada petición y se vuelven a comprobar al confirmar un cambio.
4. Microsoft: aplicación *single tenant* y comprobación del identificador de organización en la respuesta; solo se piden `openid` y `profile`.
5. Código de un solo uso con PKCE, canjeado con el secreto; ida por POST con CSRF y vuelta ligada al navegador con una cookie de 10 minutos.
6. Secreto e identificadores fuera del repositorio, con permisos 600; el código de vuelta no se escribe en el registro.

Pendiente para un entorno real: HTTPS (y `SESSION_COOKIE_SECURE=True`), un servidor de verdad en vez del de desarrollo de Flask, guardar los tokens cifrados o en un gestor de secretos, que el bloqueo de intentos no se pierda al reiniciar, restringir el token de cambios por IP y con fecha de caducidad, usar `form_post` con HTTPS para que el código de Microsoft no viaje en la dirección, guardar los permisos y las cuentas en una base de datos y decidir dónde se ejecuta y quién puede ver la vista, que contiene datos personales.
