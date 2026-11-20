# Diario · 20 de noviembre de 2026 · Nivel 7: permisos por aula y entrar con Microsoft 365

- **Horario:** 16:30 a 17:15, aproximadamente.
- **Objetivo:** decidir quién puede ver y cambiar cada aula, y entrar en la herramienta con la cuenta de Microsoft 365 de la organización en vez de con una contraseña propia.
- **Resultado:** conseguido.
  - Cada persona tiene un permiso por aula: nada, ver, o ver y cambiar (TC-33 a TC-35).
  - Entré con mi cuenta de Microsoft 365 de Grupo ATU. La herramienta no llegó a ver mi contraseña de Microsoft (TC-36).
  - Con esto están hechos los 7 niveles.

## Qué he hecho

### 7a. Permisos por persona y aula

1. **Por defecto, nada.** Cada usuario de la web tiene, para cada aula, *ver* o *cambiar*. Si un aula no aparece en sus permisos, no tiene acceso. Al actualizar, mi usuario `administrador` se quedó sin acceso a ningún aula, como debía ser (TC-33).
2. **`permisos.py`**: un programa de terminal que lista los usuarios y pregunta, aula por aula: n (nada), v (ver) o c (ver y cambiar). Las aulas salen de `aulas.json`, así que con 12 aulas preguntaría por las 12.
3. **Mi usuario de prueba:** Aula 1 con "ver y cambiar" y Aula 2 con "ver". En el Aula 2 la columna Acción dice "solo ver" (TC-34). En la vista "Todas" se ven los dos permisos a la vez (TC-35).
4. En la web:
   - un aula sin permiso no aparece y, si se escribe su dirección a mano, da "no encontrado", como si no existiera;
   - con "ver", intentar un cambio da "prohibido" y queda apuntado;
   - el registro de cambios solo enseña lo de tus aulas;
   - los permisos se leen en cada clic, así que quitar uno tiene efecto al momento, sin cerrar la sesión.

### 7b. Entrar con Microsoft 365

1. **Comprobar si podía registrar aplicaciones** en el directorio de Microsoft (Entra ID) con mi cuenta: el botón *New registration* estaba activo. Decidí registrarla ya, con lo mínimo.
2. **Registrar la aplicación** *Gestion aulas Moodle (pruebas)*:
   - solo para cuentas de esta organización (*single tenant*);
   - dirección de vuelta `http://localhost:5000/auth/callback`;
   - un secreto de cliente con la caducidad más corta, guardado en `~/moodle-lab/m365-secreto.txt` (600) sin que se viera en pantalla ni quedara en el historial (`read -s`).
3. **`configurar_m365.py`** guarda los dos identificadores (organización y aplicación) en `~/moodle-lab/m365.json` (600), fuera del repositorio.
4. **`acceso_microsoft.py`** hace el inicio de sesión con OpenID Connect usando **MSAL**, la librería oficial de Microsoft (versión fijada en `requirements.txt`).
5. **Primera entrada:** Microsoft pidió consentimiento para "iniciar sesión y leer tu perfil". Al volver, la herramienta me dio de alta **sin permisos** y me enseñó "Sin aulas asignadas" (TC-36). Luego me di permisos con `permisos.py`, al revés que al usuario local: Aula 1 nada y Aula 2 ver y cambiar.

## Cómo funciona entrar con Microsoft

1. Pulso "Entrar con Microsoft 365". La web me manda a la página de Microsoft. Para esa ida, guarda en mi navegador un **vínculo** secreto que dura 10 minutos.
2. Escribo mi contraseña **en Microsoft**, no en la herramienta.
3. Microsoft me devuelve a la herramienta con un **código de un solo uso**.
4. La herramienta canjea ese código directamente con Microsoft, usando su secreto, y recibe quién soy.
5. Si soy nuevo, me apunta sin permisos. Si ya existo, uso los permisos que tengo.

## Seguridad

| Riesgo | Medida |
|---|---|
| La herramienta guarda o ve contraseñas de Microsoft | No las ve nunca: se escriben en la página de Microsoft |
| Entra alguien de otra organización | La aplicación es *single tenant* y, además, el código comprueba que la respuesta trae nuestro identificador de organización |
| Alguien de la organización entra sin que nadie lo sepa | Entra, pero sin acceso a ningún aula hasta que se lo den con `permisos.py`; queda registrado como ALTA |
| Robar el código de vuelta o reutilizarlo | Código de un solo uso, canjeado con el secreto y con PKCE; cada intento solo se acepta una vez y durante 10 minutos |
| Que otra web me haga entrar con la cuenta de otra persona (CSRF de inicio de sesión) | La ida es un formulario POST con token CSRF y la vuelta solo se acepta en el navegador que guardó el vínculo |
| El secreto o los identificadores acaban en GitHub | Están en `~/moodle-lab/` con permisos 600; el programa se niega a leerlos si otros usuarios pueden |
| Entrar en una cuenta de Microsoft con la contraseña local | Las cuentas de Microsoft no tienen contraseña local; además, un usuario local no puede llevar «@» |
| La aplicación lee correos, archivos o Teams | No pide ningún permiso de ese tipo: solo `openid` y `profile`, para saber quién es |
| El código de vuelta queda escrito en el registro de la terminal | Se oculta (`/auth/callback?[oculto]`) |
| Quitar un permiso y que siga funcionando | Se leen en cada clic; si se borra la cuenta, la sesión deja de valer |

Al revisar el código encontré y arreglé un fallo de antes: el token anti-CSRF aceptaba un formulario enviado **sin sesión**, porque comparaba vacío con vacío. Ahora un token vacío nunca vale.

## Problemas y dudas

| Qué pasó | Causa | Solución |
|---|---|---|
| La sesión es `SameSite=Strict` y no viaja cuando Microsoft devuelve al usuario | Strict no envía la cookie si se llega desde otra web | Cookie aparte solo para el vínculo (Lax, 10 minutos). Al volver, una página intermedia salta a la vista, para que la llegada cuente como "desde nuestra web" |
| Si se entra por `127.0.0.1`, la vuelta llega a `localhost` y el navegador no lleva la cookie | Para el navegador son sitios distintos | La web manda primero a `localhost` antes de ir a Microsoft |
| El registro de peticiones apuntaba el código de vuelta entero | El servidor de pruebas apunta las direcciones completas | Filtro que lo oculta. El código ya estaba canjeado y no servía |
| MSAL avisa: *response_mode='form_post' is recommended* | Con `form_post`, el código llega en un POST desde Microsoft y no queda en la dirección | No lo usamos: en un POST que viene de otra web, el navegador no envía la cookie del vínculo (Lax), y perderíamos la protección contra el CSRF de inicio de sesión. Con HTTPS en producción se podría usar `form_post` con una cookie `SameSite=None; Secure` |
| He registrado la aplicación en el directorio real de la organización | Era la única forma de probarlo de verdad | Configuración mínima. Se borra en un clic desde *App registrations*. Lo comentaré con la tutora |

## Qué he aprendido

- "Por defecto, nada" es más seguro y casi no da trabajo: basta un programa para dar permisos.
- Con OpenID Connect, la contraseña nunca pasa por nuestra herramienta. Microsoft solo nos dice quién es la persona, y lo que puede hacer en la herramienta lo decidimos nosotros.
- Las cookies `SameSite` protegen mucho, pero hay que pensar en los viajes de ida y vuelta a otras webs.
- Revisar el propio código con ojos de atacante encuentra fallos que las pruebas normales no ven (el CSRF vacío).

## Evidencias

En [`capturas/`](../capturas/):

- TC-33: usuario sin permisos, "Sin aulas asignadas".
- TC-34: Aula 2 con permiso de solo ver.
- TC-35: vista "Todas" con el Aula 1 para cambiar y el Aula 2 para ver.
- TC-36: entrada con Microsoft 365, cuenta nueva sin aulas (correo tapado).

## Ayuda de la IA en esta sesión

Claude diseñó los permisos y el inicio de sesión con Microsoft. También escribió el código y lo probó antes con un Moodle y un Microsoft simulados. Además, me guió para registrar la aplicación, encontró y arregló el fallo del CSRF vacío y el del código en el registro. Yo decidí registrar la aplicación en el directorio de la organización, la registré, creé el secreto, di los permisos y probé todo con mis aulas y mi cuenta. Este borrador lo ha redactado Claude a partir de la sesión y yo lo he revisado.

## Siguiente paso

- Enseñar el trabajo a la tutora con el enlace al repositorio, un vídeo corto y una videollamada si quiere.
- Pendiente: matricular desde la web y lo que faltaría para producción (HTTPS, servidor de verdad, secretos en un gestor).
