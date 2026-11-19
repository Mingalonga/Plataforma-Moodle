# Diario · 17 de noviembre de 2026 · Nivel 3 (1/2): servicios web en el aula 1

- **Horario:** 17:40 a 19:00
- **Objetivo:** abrir la «puerta oficial» de Moodle (servicios web REST) en el aula 1 con un usuario de solo lectura, y comprobar con llamadas reales qué datos de la propuesta se pueden obtener.
- **Resultado:** conseguido. Primeras llamadas a la API funcionando desde la terminal. Se obtienen todos los datos que pide la propuesta para la consulta, con un rol de **siete** capacidades de lectura, cada una justificada por una prueba.

## Qué he hecho

1. **Activar los servicios web** (*Advanced features → Enable web services*) y el **protocolo REST** (*Server → Web services → Manage protocols*) (TC-12, TC-13). En Moodle 4.1 solo vienen REST y SOAP; XML-RPC ya no está de serie.
2. **Crear un usuario técnico** `ws_lectura`, solo para la herramienta. El token tiene los mismos permisos que su usuario, así que nunca se usa el administrador.
3. **Crear un rol a medida** «Servicio web: solo lectura» (`ws_lectura`), desde cero (sin arquetipo) y asignable solo a nivel de sistema (TC-14, TC-15), y **asignarlo** al usuario técnico (TC-16).
4. **Crear el servicio** «Gestión centralizada (lectura)» (`gestion_lectura`), solo para usuarios autorizados, con cuatro funciones (TC-17), y **autorizar** al usuario técnico (TC-18).
5. **Crear el token** sin restricción de IP ni caducidad (TC-19, TC-20, con el token oculto). Guardado fuera del repositorio en `~/moodle-lab/token-aula1.txt` con permisos `600` (solo yo puedo leerlo).
6. **Hacer llamadas a mano con `curl`** ([`llamadas-api.md`](../laboratorio/llamadas-api.md)) y analizar las respuestas JSON ([`respuestas/`](../laboratorio/respuestas/)).

## Qué datos se obtienen y con qué permiso

| Dato que pide la propuesta | ¿Se obtiene? | Función | Observación |
|---|---|---|---|
| Nombre y versión del aula | Sí | `core_webservice_get_site_info` | `release: 4.1.18 (Build: 20250414)` |
| Lista de cursos | Sí, **sin** el campo `visible` | `core_course_get_courses` | `visible` solo se devuelve con `moodle/course:update` (permiso de edición) |
| Matriculados, rol y último acceso | Sí | `core_enrol_get_enrolled_users` | Incluye `firstaccess`, `lastaccess`, `lastcourseaccess` y `roles` |
| Cursos de una persona en el aula | Sí | `core_enrol_get_enrolled_users` | Campo `enrolledcourses` |
| Cuenta suspendida | Sí | `core_user_get_users` | `suspended: true`. La función de matriculados no lo da |
| Correo electrónico | Solo con `moodle/site:viewuseridentity` | `core_user_get_users` | Sin ese permiso, ni se muestra ni se puede buscar por él |

## Rol final de solo lectura (7 capacidades)

> **Actualización 19/11:** se añadió una octava, `moodle/course:viewhiddencourses`, porque un curso oculto hacía fallar la lista de cursos entera (ver el diario del nivel 5).

| Capacidad | Por qué |
|---|---|
| `webservice/rest:use` | Usar REST |
| `moodle/user:viewdetails` | Ver la ficha de usuario |
| `moodle/user:viewalldetails` | Verla sin compartir curso. Moodle la marca con riesgo de privacidad |
| `moodle/user:viewhiddendetails` | Ver campos ocultos, como el último acceso. Riesgo de privacidad |
| `moodle/course:view` | Ver cursos sin estar matriculado |
| `moodle/course:viewparticipants` | Ver los matriculados |
| `moodle/site:viewuseridentity` | Ver y buscar por correo. **Añadida tras la prueba de la búsqueda por correo** |

Moodle avisaba de «Missing capabilities: 5» al autorizar al usuario. No eran necesarias para funcionar, pero alguna recorta datos (`course:update` → `visible`).

## Experimento: buscar por correo sin poder verlo

- **Hipótesis:** quizá se puede buscar a alguien por correo aunque Moodle no muestre el correo. Eso permitiría reconocer a Carmen (`carmen.ruiz` en el aula 1, `cruiz` en el aula 2).
- **Resultado:** lista vacía, aunque Carmen existe. Moodle solo devuelve a una persona si quien pregunta puede ver el campo por el que busca. Así impide averiguar, probando correos, quién está en el aula.
- **Segunda hipótesis:** falta `moodle/site:viewuseridentity`. Se añade al rol y se repite la misma llamada, sin crear otro token.
- **Resultado:** aparece Carmen **con** su correo. Confirmado.
- **Conclusión:** para reconocer a la misma persona entre aulas, la herramienta necesita ver el correo, es decir, un permiso más sobre datos personales que habrá que justificar ante Informática.

## Problemas y dudas

| Qué pasó | Causa | Solución |
|---|---|---|
| No encontraba al usuario técnico al asignar el rol | La búsqueda mira nombre y correo, no el nombre de usuario | Buscar «lectura» |
| Casi asigno el rol a Carmen | Estaba seleccionada otra línea | Comprobar la línea marcada antes de pulsar «Add» |
| `Expecting value: line 1 column 1` | `curl` interpretó `[0]` como un rango (*globbing*) y no hizo la petición; `-s` ocultó el error | Añadir `-g` (`curl -sg`) |
| `Prevención` en las respuestas | `json.tool` escapa las tildes por defecto | `--no-ensure-ascii` |
| El archivo del token ocupa 33 bytes | `echo` añade un salto de línea | Tenerlo en cuenta al leer el token desde un programa |

## Qué he aprendido

- Los servicios web son la puerta para programas: funciones con nombre, un token en vez de contraseña y respuestas en JSON.
- Hay **dos candados**: el rol (qué puede ver el usuario) y el servicio (qué funciones puede llamar el token). La respuesta de `get_site_info` muestra solo las cuatro funciones del servicio y `userissiteadmin: false`.
- En Moodle los permisos son capacidades agrupadas en roles, y los roles se asignan en un contexto (sistema, categoría, curso).
- El **mínimo privilegio** tiene un coste: con menos permisos la llamada funciona, pero llega con menos datos. Cada permiso extra se añade solo cuando una prueba demuestra que hace falta.
- Incluso un rol de solo lectura maneja datos personales, así que entra en el ENS y en la protección de datos.
- En un aula real el token debería tener restricción de IP (solo el servidor de la herramienta) y fecha de caducidad.
- `get_site_info` devuelve también una `userprivateaccesskey`: la herramienta no debería guardarla ni mostrarla.

## Evidencias

- TC-12 a TC-20 en [`capturas/`](../capturas/): activación, protocolo REST, rol, asignación, servicio y funciones, autorización y token (oculto).
- Respuestas JSON en [`laboratorio/respuestas/`](../laboratorio/respuestas/).

## Ayuda de la IA en esta sesión

Claude me explicó los servicios web, los roles y las capacidades, y me dio la lista de capacidades y funciones y los comandos `curl`. También interpretó conmigo las respuestas y propuso la hipótesis de `viewuseridentity`, que comprobé yo. Toda la configuración y las llamadas las hice yo en el aula. Las capturas con el token se taparon antes de subirlas. Este borrador lo ha redactado Claude a partir de la sesión y yo lo he revisado.

## Siguiente paso

Repetir la configuración en el aula 2 (Moodle 4.1.2), cronometrando el tiempo, y comprobar si se comporta igual.
