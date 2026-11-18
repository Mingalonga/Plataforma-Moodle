# Diario · 18 de noviembre de 2026 · Nivel 3 (2/2): servicios web en el aula 2, cronometrado

- **Horario:** 17:09 a 17:24 (configuración cronometrada). Antes hubo un rato perdido con el touchpad del portátil, que no cuenta.
- **Objetivo:** repetir en el aula 2 (Moodle 4.1.2) la misma configuración de servicios web que en el aula 1 y **medir cuánto se tarda**, para estimar el esfuerzo con las 12 aulas de Grupo ATU.
- **Resultado:** conseguido en **unos 15 minutos**. La llamada final encuentra a Carmen Ruiz en el aula 2 buscándola por su correo.

## Tiempos por paso

| Paso | Qué | Hora al acabar | Minutos |
|---|---|---|---|
| — | Inicio del crono | 17:09 | — |
| 1 | Activar los servicios web | 17:10 | 1 |
| 2 | Activar el protocolo REST | 17:11 | 1 |
| 3 | Crear el usuario técnico `ws_lectura` | 17:12 | 1 |
| 4 | Crear el rol «Servicio web: solo lectura» (7 capacidades) | 17:15 | 3 |
| 5 | Asignar el rol a nivel de sistema (con tropiezo, ver abajo) | 17:18 | 3 |
| 6 | Crear el servicio y añadir las 4 funciones | 17:20 | 2 |
| 7 | Autorizar al usuario técnico en el servicio | 17:21 | 1 |
| 8 | Crear el token y guardarlo (`chmod 600`) | 17:23 | 2 |
| 9 | Prueba final con `curl` | 17:24 | 1 |
| | **Total** | | **≈ 15** |

Para comparar, el aula 1 llevó ayer unos 80 minutos, pero aquello incluía aprender qué era cada cosa y probar los permisos uno a uno. Hoy se repetía una receta ya escrita.

## Estimación para las 12 aulas

- **A mano, con la receta:** unos 15 minutos por aula, así que unas **3 horas** para 12 aulas, siempre que se tenga acceso de administrador a todas.
- **Pegas:**
  - Son 9 pasos con clics y casillas en cada aula. Hoy ha fallado uno en el paso 5 (abajo), y con 12 aulas es fácil que alguna quede mal sin que se note.
  - Los tokens habría que renovarlos cuando caduquen o se filtren (ver abajo), y eso también se haría aula por aula.
  - En Grupo ATU no sé todavía quién administra cada plataforma ni si yo tendría acceso a todas. Es una dependencia de organización, no técnica.
- **Idea para reducirlo (sin probar):** Moodle trae comandos para la terminal (`admin/cli/cfg.php`) que activan ajustes como los servicios web. El rol, el servicio y el token habría que crearlos con un pequeño script PHP. Si funciona, configurar una aula nueva sería ejecutar un comando. Lo dejo como posible mejora; no lo he comprobado.

## Problemas y dudas

| Qué pasó | Causa | Solución |
|---|---|---|
| El rol nuevo no salía en *Assign system roles*, solo Manager y Course creator | Lo más probable es que al crearlo no quedara marcada la casilla **System** en los contextos donde se puede asignar | Editar el rol en *Define roles*, marcar **System** y guardar |
| Al autorizar al usuario sale *Missing capabilities: 5* | Moodle avisa de los permisos que las 4 funciones *podrían* usar y el rol no tiene: `course:update`, `course:viewhiddencourses`, `course:useremail`, `user:update` y `site:accessallgroups` | Nada: se dejaron fuera a propósito (escritura o más privacidad que la necesaria) |
| El token se vio en una captura de la terminal | Pegué la captura entera con el `echo` del token | Borrar el token en *Manage tokens* y crear uno nuevo. Esa captura no se sube |

Lección del último punto: un token que se ha visto se da por **quemado**, aunque aquí el riesgo era mínimo (aula solo en mi ordenador, solo lectura, datos inventados). En la herramienta real, revocar y crear un token nuevo debería ser rápido y estar documentado.

## Resultado de la prueba

La búsqueda por `carmen.ruiz@example.com` en el aula 2 devuelve el usuario **`cruiz`** (id 6, no suspendida, nunca ha entrado). En el aula 1, la misma persona es **`carmen.ruiz`**.

Esto confirma algo importante para el nivel 4: **el nombre de usuario no sirve para cruzar aulas**, porque cada aula puede tener el suyo. El dato común es el **correo**. El script que junte alumnos de varias aulas tendrá que unirlos por correo y avisar cuando falte o no coincida.

## Qué he aprendido

- Con la receta escrita, poner un aula en marcha para la herramienta es cuestión de minutos. El coste está en aprender la primera vez y en no equivocarse en las repeticiones.
- Moodle 4.1.2 y 4.1.18 se comportan igual en todo lo probado hoy.
- La casilla de contexto del rol es fácil de olvidar y el fallo no avisa: el rol simplemente no aparece. Merece una línea propia en la receta.
- El correo es la llave para reconocer a la misma persona en aulas distintas.

## Evidencias

- Respuesta de la prueba final descrita arriba (la captura no se sube porque mostraba el token).
- Recetas de llamadas en [`laboratorio/llamadas-api.md`](../laboratorio/llamadas-api.md).

## Ayuda de la IA en esta sesión

Claude me dio los pasos uno a uno a partir de la receta de ayer, me ayudó a ver por qué no salía el rol y me explicó el aviso de *Missing capabilities*. Toda la configuración, el cronometraje y la prueba los hice yo en el aula. Este borrador lo ha redactado Claude a partir de la sesión y yo lo he revisado.

## Siguiente paso

Nivel 4: un script que pida los alumnos a las dos aulas por la API, los junte por correo y marque las cuentas inactivas (más de 90 días sin entrar) y las suspendidas.
