# Diario · 16 de noviembre de 2026 · Nivel 2 (2/2): situaciones de acceso y segunda aula

- **Horario:** 16:15 a 19:15, con pausas
- **Objetivo:** que los usuarios del aula 1 tengan situaciones de acceso distintas y montar una segunda aula con otra versión de Moodle.
- **Resultado:** conseguido. El aula 1 tiene usuarios activos, inactivos, que nunca han entrado y uno suspendido. El aula 2 (Moodle 4.1.2) funciona en `http://localhost:8001` con sus propios cursos y usuarios. **Nivel 2 completado.**

## Qué he hecho

### Situaciones de acceso en el aula 1

1. **Entrar como cinco alumnos** (Ana, Carmen, Elena, Pablo y Rosa) desde una ventana privada del navegador, para que Moodle registre un acceso real (TC-06). En *Browse list of users* aparecen con acceso reciente y el resto con «Never» (TC-05).
2. **Mirar la base de datos por dentro** con `psql` dentro del contenedor `db`, con una consulta de solo lectura (`SELECT`) a la tabla `m_user` (TC-07).
3. **Simular inactividad** con cuatro `UPDATE` sobre el campo `lastaccess` ([`inactividad-aula1.sql`](../laboratorio/inactividad-aula1.sql)): Bruno (120 días), David (200 días), Lucía (400 días) y Fernando (60 días, por debajo del límite de 90, para probar la frontera). Comprobado en la lista de usuarios (TC-08).

Estado final del aula 1:

| Situación | Usuarios |
|---|---|
| Activos (acceso reciente) | Ana, Carmen, Elena, Pablo, Rosa |
| Inactivos más de 90 días | Bruno, David, Lucía |
| Por debajo del límite (60 días) | Fernando |
| Nunca han entrado | Nuria, Sergio (profesor) |
| Suspendido | Marcos |

### Segunda aula

4. **Elegir la versión con un dato del trabajo de la Fase 1:** según el inventario, la mayoría de las aulas de Grupo ATU tienen Moodle 4.1.2+ y solo el campus principal la 4.1.19. Se descarga la 4.1.2 (`Build: 20230313`) en `~/moodle-lab/aula2`.
5. **Separarla del aula 1** con otro nombre de proyecto de Docker Compose (`COMPOSE_PROJECT_NAME=aula2`) y otro puerto (`MOODLE_DOCKER_WEB_PORT=8001`). Quedan diez contenedores, cinco por aula, cada aula con su propia red interna y su base de datos. Variables recogidas en [`entorno-aula2.sh`](../laboratorio/entorno-aula2.sh).
6. **Instalar Moodle** en el aula 2 con el instalador de terminal y entrar como administrador (TC-09).
7. **Cargar datos pensados para provocar los problemas de juntar aulas** ([`cursos-aula2.csv`](../laboratorio/datos/cursos-aula2.csv), [`usuarios-aula2.csv`](../laboratorio/datos/usuarios-aula2.csv)): 3 cursos y 7 usuarios (TC-10, TC-11).

## Casos preparados para la herramienta

| Caso | Aula 1 | Aula 2 | Qué tendrá que resolver la herramienta |
|---|---|---|---|
| Misma persona, mismo usuario y correo | `ana.lopez`, `fernando.gil` | `ana.lopez`, `fernando.gil` | Mostrar a la persona una sola vez con sus dos aulas |
| Estado distinto en cada aula | `marcos.vidal` suspendido | `marcos.vidal` activo | Detectarlo y permitir un cambio global (suspender en todas) |
| Misma persona, distinto usuario | `carmen.ruiz` | `cruiz` (mismo correo) | Decidir cómo se reconoce a una persona: ¿por correo? |
| Mismo `shortname` de curso | `PRL-01` | `PRL-01` | Distinguir el curso por aula, no solo por su nombre corto |
| Solo en un aula | 9 usuarios | 3 alumnos y 1 profesora | Nada especial |

## Problemas y dudas

| Qué pasó | Causa | Solución |
|---|---|---|
| Error de sintaxis en `psql` | Escribí como órdenes las piezas de la explicación (`exec db`, `psql`, `-U moodle`) y psql las juntó con el `SELECT` porque esperaba un `;` (indicador `moodle-#`) | Tras el error la orden se descarta; repetir solo el `SELECT` |
| La página de acceso no tiene botón para mostrar u ocultar la contraseña | La versión 4.1 no lo incluye; según Claude se añadió en versiones posteriores (por comprobar) | Ninguna; anotado como observación de usabilidad |

## Qué he aprendido

- Una ventana privada del navegador no comparte la sesión con la normal: puedo ser administrador en una y alumno en otra.
- `lastaccess` es una **marca de tiempo Unix** (segundos desde el 1 de enero de 1970 en UTC). `0` significa «nunca». «Inactivo más de 90 días» es una resta: `ahora − 90 × 86.400`.
- Moodle guarda las horas en UTC y las convierte a la zona de cada usuario al mostrarlas.
- **Un `UPDATE` sin `WHERE` cambia todas las filas.** Es la razón práctica de que la herramienta tenga vista previa y confirmación.
- Docker reutiliza las imágenes: la segunda aula arrancó en segundos. Cada proyecto de Compose tiene su propia red, y dentro de cada contenedor Apache escucha en el 80 sin chocar con el otro.
- Los ID internos no sirven para reconocer a una persona entre aulas: Carmen es el usuario 5 en el aula 1 y el 6 en el aula 2.
- El mismo `shortname` de curso puede existir en dos aulas sin que Moodle lo impida.

## Evidencias

- [TC-05](../capturas/TC-05_aula1_lista-usuarios-ultimo-acceso_2026-11-16.png): lista de usuarios tras los primeros accesos.
- [TC-06](../capturas/TC-06_aula1_vista-alumna-mis-cursos_2026-11-16.png): vista de «My courses» de una alumna.
- [TC-07](../capturas/TC-07_aula1_consulta-sql-usuarios_2026-11-16.png): consulta SQL a `m_user`.
- [TC-08](../capturas/TC-08_aula1_usuarios-con-inactividad_2026-11-16.png): lista de usuarios con la inactividad simulada.
- [TC-09](../capturas/TC-09_aula2_panel-administrador_2026-11-16.png): aula 2 en `localhost:8001`.
- [TC-10](../capturas/TC-10_aula2_subida-usuarios_2026-11-16.png): subida de usuarios del aula 2.
- [TC-11](../capturas/TC-11_aula2_cursos_2026-11-16.png): cursos del aula 2.

## Ayuda de la IA en esta sesión

Claude me dio las órdenes SQL y los comandos, me explicó cada uno y diseñó los datos del aula 2 para que provocaran los casos difíciles. La elección de la versión 4.1.2 sale del inventario que hice en la Fase 1. Yo ejecuté todo, entré con los usuarios y comprobé los resultados. Este borrador lo ha redactado Claude a partir de la sesión y yo lo he revisado.

## Siguiente paso

Nivel 3: activar los servicios web en las dos aulas y hacer las primeras llamadas a mano.
