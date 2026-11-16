# Diario · 13 de noviembre de 2026 · Nivel 2 (1/2): cursos y alumnos ficticios en el aula 1

- **Horario:** 16:54 a 19:25, con pausas
- **Objetivo:** dar al aula 1 datos con los que trabajar: cursos, usuarios y matrículas.
- **Resultado:** conseguido. 4 cursos y 12 usuarios (11 alumnos y 1 profesor) creados por subida masiva, con sus matrículas.

## Qué he hecho

1. **Volver a encender el entorno** con `git pull` y `source .../laboratorio/entorno-aula1.sh`. Aprendí la diferencia entre ejecutar un script (se abre una terminal hija y los cambios se pierden al terminar) y cargarlo con `source` (se aplica en mi propia terminal).
2. **Crear el CSV de cursos** desde la terminal con un *heredoc* ([`cursos-aula1.csv`](../laboratorio/datos/cursos-aula1.csv)): PRL-01, EXCEL-01, ATC-01 e ING-A2.
3. **Subir los cursos** en *Site administration → Courses → Upload courses*, con vista previa antes de crear nada. Resultado: «Courses created: 4», sin errores (TC-03).
4. **Crear el CSV de usuarios** ([`usuarios-aula1.csv`](../laboratorio/datos/usuarios-aula1.csv)): 12 personas ficticias con correo `@example.com`, una suspendida (Marcos) y un profesor (Sergio). Cada fila incluye las matrículas por `shortname` del curso y rol.
5. **Subir los usuarios** en *Site administration → Users → Accounts → Upload users*. Resultado: 12 usuarios creados y todas las matrículas hechas (TC-04).

## Problemas y dudas

| Qué pasó | Causa | Solución |
|---|---|---|
| No aparecía la opción «Update mode» al subir cursos | Moodle la oculta si el modo es «Only add new courses» (no hay nada que actualizar) | Ninguna; era lo esperado |
| El primer botón «Upload users» no subía nada | En esa pantalla solo lleva a la vista previa | Revisar opciones y pulsar el segundo «Upload users» |

## Qué he aprendido

- El orden importa: un curso tiene que existir para poder matricular a alguien en él.
- El **ID** de curso lo pone Moodle (empieza en 2 porque el 1 es la portada del sitio) y el **shortname** lo pongo yo. La herramienta verá los dos.
- Los ID de usuario empiezan en 3: el 1 es el invitado y el 2 el administrador.
- **Cada aula tiene sus propios usuarios.** La misma persona en dos aulas son dos cuentas sin relación: ese es el problema que tiene que resolver la herramienta.
- Las contraseñas solo aparecen en claro porque estaban en el CSV; Moodle las guarda cifradas (*hash*) y la herramienta nunca podrá verlas. Dejar contraseñas en un CSV solo es aceptable en un laboratorio.
- La subida masiva tiene vista previa y resumen de resultados, lo mismo que la propuesta pide para los cambios de la herramienta.

## Evidencias

- [TC-03](../capturas/TC-03_aula1_subida-cursos_2026-11-13.png): resultado de la subida de cursos.
- [TC-04](../capturas/TC-04_aula1_subida-usuarios_2026-11-13.png): resultado de la subida de usuarios y matrículas.

## Ayuda de la IA en esta sesión

Claude me dio los contenidos de los CSV y me explicó cada columna y cada opción de las pantallas de subida. Yo creé los archivos, hice las subidas y comprobé los resultados en el aula. Este borrador lo ha redactado Claude a partir de la sesión y yo lo he revisado.

## Siguiente paso

Crear situaciones de acceso distintas (activos, inactivos, nunca han entrado) y montar la segunda aula.
