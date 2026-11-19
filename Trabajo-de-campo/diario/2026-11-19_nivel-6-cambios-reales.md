# Diario · 19 de noviembre de 2026 · Nivel 6: cambios reales

- **Horario:** por la tarde, después del nivel 5, hasta las 18:45 (hora de inicio por ajustar).
- **Objetivo:** que la herramienta deje de solo mirar y pueda hacer un cambio real en un Moodle, siempre con vista previa, confirmación y registro.
- **Resultado:** conseguido para **suspender y reactivar** cuentas. Suspendí a Bruno Díaz en el aula 1 desde la web, comprobé en el propio Moodle que estaba suspendido, lo reactivé y las dos acciones quedaron en el registro (TC-27 a TC-30). **Matricular** queda para más adelante.

## Qué he hecho

1. **Una identidad aparte para los cambios, en cada aula.** No reutilicé el usuario de lectura. En cada Moodle creé:
   - el usuario `ws_cambios` (Servicio web Cambios);
   - el rol *Servicio web: cambios*, de contexto Sistema, con solo 2 capacidades: `webservice/rest:use` y `moodle/user:update`;
   - el servicio `gestion_cambios`, con una única función: `core_user_update_users`, y con `ws_cambios` como único usuario autorizado;
   - su token, guardado en `~/moodle-lab/token-cambios-aulaN.txt` con permisos 600.

   En el aula 2, con la receta del aula 1 al lado, fue mucho más rápido.
2. **El código de los cambios** (`cambios.py`), siguiendo los mismos principios que el resto: modular, escalable y seguro. El cambio pasa por cuatro fases:
   1. **Preparar:** comprueba que la cuenta existe, que no es técnica y que el cambio sirve para algo, y monta un "plan" (quién, aula, antes y después).
   2. **Vista previa:** la web enseña el plan y explica qué supone. Todavía no ha cambiado nada (TC-27).
   3. **Confirmar y ejecutar:** vuelve a leer la cuenta por si ha cambiado mientras tanto, hace el cambio y lo vuelve a leer para **comprobar** que Moodle lo ha aplicado.
   4. **Registrar:** apunta el intento, salga bien o mal, en `~/moodle-lab/registro-cambios.jsonl`. Es un archivo que solo crece y tiene permisos 600 (TC-30).
3. En la web: una columna **Acción** en la tabla de personas (Suspender o Reactivar) y una página **Registro de cambios**, con botón para volver a la vista.
4. **Prueba completa en el aula 1:** suspender a Bruno Díaz, comprobarlo en la lista de usuarios de Moodle (sale en gris, TC-29), reactivarlo y revisar el registro.

5. **Página de cada curso** (añadida al usarla): en la tabla de Cursos, cada curso es un enlace. Al pulsarlo salen sus personas con el rol en el curso, el estado y la acción, y se puede filtrar por **Todos, Alumnado y Profesorado** (TC-31, TC-32). No hizo falta ningún permiso nuevo en Moodle, porque `core_enrol_get_enrolled_users` ya devuelve el rol de cada persona. El número del curso solo se acepta si es un número y existe en esa aula. La página avisa de que suspender bloquea la cuenta en toda el aula, no solo en ese curso.

## Seguridad de los cambios

| Riesgo | Medida |
|---|---|
| Se filtra el token de lectura | No sirve para cambiar nada: los cambios usan otro usuario, rol, servicio y token |
| Se filtra el token de cambios | Solo puede suspender o reactivar cuentas (una función, 2 capacidades). No puede borrar, matricular ni leer cursos |
| Un error del código llama a otra función | Lista blanca propia en el código y los dos tokens nunca se mezclan. Moodle rechazaría además cualquier otra función |
| Cambiar más campos de la cuenta de los debidos | Solo se envían `id` y `suspended` |
| Hacer un cambio sin querer | Vista previa obligatoria y botón de confirmar. Un enlace por sí solo no cambia nada |
| Repetir un cambio o provocarlo desde otra web | La confirmación va por POST con token CSRF y un código de un solo uso |
| La cuenta cambia entre la vista previa y la confirmación | Se vuelve a leer antes de cambiar |
| Creer que se ha hecho cuando no | Se vuelve a leer después y el resultado se registra como correcto o error |
| Tocar cuentas técnicas o el administrador | Se rechazan (y Moodle tampoco deja cambiar a un administrador) |
| No saber quién hizo qué | Registro con fecha, persona de la web, aula, usuario, acción y resultado |

**Para producción faltaría:**
- Restringir el token de cambios por IP y ponerle fecha de caducidad.
- Que solo algunas personas puedan hacer cambios. Ahora puede cualquiera que entre en la web; es parte del nivel 7.
- Guardar el registro también fuera del equipo.

## Problemas y dudas

| Qué pasó | Causa | Solución |
|---|---|---|
| La vista previa dice "activa → suspendida" y la tabla dice "inactiva (123 días)" para la misma persona | Son dos cosas distintas: si la cuenta está suspendida y cuánto hace que no entra | Lo dejo anotado. Más adelante conviene llamar al primero "puede entrar" para que no se confunda |
| Faltaba un botón para volver desde el registro | El menú de arriba sí lleva a la vista, pero no se ve como "atrás" | Añadido «← Volver a la vista» |

## Qué he aprendido

- Separar lectura y escritura cuesta unos pocos pasos más en cada aula y reduce mucho el daño si se filtra un token.
- Una herramienta que cambia cosas tiene que comprobar lo que ha hecho y dejarlo apuntado: si no, no hay forma de saber qué pasó.
- Lo modular vuelve a funcionar: los cambios son una pieza nueva (`cambios.py`). La web solo añade dos páginas.

## Evidencias

- TC-27 en [`capturas/`](../capturas/): vista previa antes de suspender.
- TC-28: tabla del aula 1 con Bruno Díaz ya suspendido y el botón Reactivar.
- TC-29: lista de usuarios del propio Moodle, con Bruno Díaz en gris (suspendido).
- TC-30: registro de cambios con la suspensión y la reactivación, las dos correctas.
- TC-31 y TC-32: página de un curso (Atención al cliente y Excel básico) con sus personas, su rol y las pestañas Todos, Alumnado y Profesorado.

## Ayuda de la IA en esta sesión

Claude propuso separar la identidad de cambios y me guió paso a paso para crearla en las dos aulas. También escribió `cambios.py` y las páginas nuevas y los probó antes contra un Moodle simulado. Yo creé los usuarios, roles, servicios y tokens en las dos aulas, bajé el código, hice la prueba real y pedí el botón de volver y la página de cada curso. Este borrador lo ha redactado Claude a partir de la sesión y yo lo he revisado.

## Siguiente paso

Nivel 7: entrar con Microsoft 365 y decidir quién puede ver y cambiar cada aula. Queda pendiente matricular desde la web.
