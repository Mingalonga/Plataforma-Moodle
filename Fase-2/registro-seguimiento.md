# Registro de seguimiento de la Fase 2

Formato de la Ficha 01 (página 7). Se añade una fila por cada revisión, aunque no se cierre el hito. Las filas no se borran. El registro de la fase anterior está en [`Fase-1/registro-seguimiento.md`](../Fase-1/registro-seguimiento.md).

| Fecha | Hito revisado | Acuerdos y cambios | Próxima revisión |
|---|---|---|---|
| 2026-11-03 | Inicio de la Fase 2 (sin validación formal de la Fase 1) | La tutora acusa recibo del resumen de la Fase 1 sin validar el alcance. El alumno decide empezar la Fase 2 con la información disponible, sobre supuestos explícitos. Se redacta el paquete 0.1 completo: plan, supuestos, escenarios, requisitos funcionales y no funcionales, trazabilidad con casos de prueba y especificación (entregable 02). | Revisión del alumno; después, informar a la tutora |
| 2026-11-03 | Revisión del paquete 0.1 por el alumno | El alumno da su conformidad y se fusiona la PR #5. Pide un resumen para la tutora y una guía detallada para él. Se crean ambos PDF en `entregas/`. | Envío del resumen a la tutora |
| 2026-11-03 | Preguntas para la organización | A petición del alumno se prepara un PDF de 2 páginas con las 16 preguntas imprescindibles para las fases siguientes, en lenguaje no técnico y sin pedir datos personales. | Envío a Grupo ATU (a través de la tutora o del contacto que se obtenga) |
| 2026-11-04 | Respuesta de la tutora a las dudas del alumno | La tutora indica que el enfoque es la gestión interna de las aulas, orientada al rol de administración y gestión; el alumnado entra por URL; gestiona el Departamento de Pedagogía y e-learning e implementa Informática; antes, viabilidad. Texto literal en el [registro de la Fase 1](../Fase-1/registro-seguimiento.md). Se rehace la fase: **paquete 0.2**, resumen v2, guía v2 y preguntas v2. Las preguntas v1 no llegan a enviarse a la organización (pierden relevancia, como indica la tutora). | Revisión del alumno; después, enviar el resumen v2 a la tutora y confirmar la interpretación (T12) |
| 2026-11-05 | Respuestas de Grupo ATU a las 9 preguntas | Responden el Departamento de Pedagogía y e-learning e Informática (texto literal abajo). El DPE pide ver a los alumnos de forma global y por aula, controlar accesos y hacer cambios globales o individuales, con un estudio de viabilidad real. Informática pide un documento breve y directo con dosier aparte; el perfil de prueba llegaría tras el plano. Se actualiza la fase: **paquete 0.3**, resumen v3, guía v3 y registro de preguntas de la Fase 1 v0.10. Se propone un documento ejecutivo de viabilidad y un dosier (T14). | Decisión del alumno sobre T14; envío del resumen v3 a la tutora |
| 2026-11-05 | Los planos (T14) | El alumno da el visto bueno a la propuesta. Se redactan el documento ejecutivo de viabilidad (3 páginas), el dosier de respaldo independiente (10 páginas) y una guía interna para el alumno, en `planos/`. La viabilidad es preliminar: se basa en la documentación de Moodle y se confirmará en un aula de prueba (pruebas V-01 a V-08). | Envío al DPE; respuesta de Informática sobre el aula de prueba |

### Respuestas de Grupo ATU (2026-11-05), texto literal

> **Departamento de Pedagogía y e-learning**
>
> 1. ¿Qué tareas realizáis en las aulas (crear cursos, matricular, dar de alta usuarios, revisar informes, copias de cursos…) y cuáles se repiten más? → Todo, y esto lo gestionamos desde el Departamento además de generar contenido subir tareas etc. todo lo que conlleva una gestión total de Moodle menos la parte de diseño y programación que la gestiona otro Departamento. (Pero esto no afecta a la petición)
> 2. ¿Cuántas personas gestionáis las aulas, en cuántas trabaja cada una y cuánto tiempo se dedica hoy a entrar y salir de ellas? → No te puedo decir un numero exacto porque varia un poco también con los planes que se ejecuten pero vamos a decir entre 20-30 personas (Pero esto tampoco afecta a la petición)
> 3. ¿Tenéis una cuenta distinta en cada aula? ¿Con qué permisos? → Cada plataforma Moodle se gestiona de manera independiente en url´s diferentes y cada persona tiene roles diferentes no tiene los mismo permisos un profesor que un alumno que todos los empleados esto se hace para salvaguardar los peligros que ello pueda acarrear el estar en posesión de los mismos (Tampoco esto afecta a la petición)
> 4. ¿Qué os gustaría ver de todas las aulas a la vez? ¿Bastaría con consultarlo o querríais también hacer cambios desde la plataforma? → Sí, nos gustaría por ejemplo poder ver los alumnos de manera global e independiente, hacer controles de accesos, poder gestionar cambios globales o individuales, es eso en lo que necesitamos que investigues y hagas una viabilidad real, si solo fuera consultarlo con un hipervínculo seria suficiente pero queremos ir más allá, contemplando todo, el alumnado y el docente no es necesario que este contemplado en este proyecto porque lo queremos principalmente para la gestión de las plataformas, pero vemos todas las posibilidades que nos ofrezcas → Esta si es la parte en la que queremos que trabajes.
>
> **Informática**
>
> 5. ¿Qué versión de Moodle tiene cada aula y dónde está alojada? → actualmente tenemos la mas actualizada en la 4.1.18 pero puede no ser la misma en todas nuestras plataformas, esto no afectaría a la petición porque las actualizaciones son cambiantes no es algo que vaya ser estático en el tiempo.
> 6. ¿Se podrían activar los servicios web de Moodle, al menos en modo de solo lectura? ¿Existe un aula o un entorno de pruebas? → podríamos crearte un perfil de prueba para que accedas pero sin antes no tener un plano de trazabilidad no sería viable, para la petición sin antes tener una base de qué hacer y cómo no es necesario.
> 7. ¿Existe un directorio común para el personal (por ejemplo, Microsoft 365)? ¿Hay normas internas de seguridad para herramientas internas? → como herramienta corporativa tenemos el Microsoft365, y sí hay normas para todo no se si te han pasado protocolos de empresa, normas de seguridad etc. pero si no es así consúltalo en la sede.
> 8. ¿Qué parte del proyecto podría asumir Informática (instalación, permisos, claves de acceso, mantenimiento) y con qué disponibilidad? → Si lo ve viable puede asumir todo o delegar en ti ciertas partes eso ya lo decidirían pero si no se ve viable la petición disponen de un tiempo muy limitado con lo cual el proyecto ha de ser claro y directo no van a leer 20 paginas si no se ven claras y directas las explicaciones aunque desp haya un dosier que lo respalde... que seria independiente, no sé si me explico...
>
> **Viabilidad**
>
> 9. ¿Quién decidiría si el proyecto es viable, con qué criterios (coste, plazo, seguridad, esfuerzo) y con qué presupuesto orientativo? → primero el Departamento de elearning haría una valoración pros/contras.. etc. y después se expondría al Departamento de informática entre ellos y dirección si lo ven viable se pondría en marcha. → esto tampoco afectaría a la tarea
>
> Buenos días Carlos, te he ido respondiendo un poco así a las dudas no sé si con esto te queda un poquito más claro, al final, un poco en resumen, te estamos pidiendo que nos hagas los planos de una casa en la que queremos meter ciertas habitaciones y nos tienes un poco que hacer el proyecto para poder gestionarlo todo desde un mismo espacio.

## Gestión de tareas

Tablero de tareas de la fase en la sección 5 de [`00-plan-fase-2.md`](00-plan-fase-2.md#5-tareas).

## Cambios de alcance

| Fecha | Cambio propuesto | Motivo | Impacto | Decisión |
|---|---|---|---|---|
| 2026-11-03 | Sin cambios de alcance. La especificación 0.1 concreta el alcance preliminar (AL-01 a AL-14) sin modificarlo | — | — | — |
| 2026-11-04 | La especificación pasa de un catálogo para el alumnado a una herramienta interna de gestión (alcance preliminar v0.3, AL-15 a AL-27) | Indicación de la tutora | Fase 2 rehecha; suben los requisitos de seguridad; los *Should* dependen de la viabilidad | Aceptado por el alumno; pendiente de confirmar con la tutora. Registrado también en la [Fase 1](../Fase-1/registro-seguimiento.md#cambios-de-alcance) |
| 2026-11-05 | La vista de alumnos, el control de accesos y los cambios individuales y globales desde la plataforma pasan de futuro a imprescindibles; el acceso con Microsoft 365, a conveniente | Petición expresa de Grupo ATU (DO-04, DO-07) | Suben los requisitos de seguridad (permisos por aula, registro de consultas y cambios, claves con escritura limitada); la viabilidad pasa a ser el entregable central | Incorporado en el paquete 0.3; pendiente de validar con la tutora |
