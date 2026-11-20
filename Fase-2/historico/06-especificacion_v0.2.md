# 06 — Especificación (entregable 02)

| Campo | Valor |
|---|---|
| Versión | 0.2 |
| Fecha | 2026-11-04 |
| Estado | Revisión del propietario |
| Redacción | Claude (rol Redactor, con revisión de todos los roles), a petición del alumno |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |
| Entregable de la ficha | 02 — Especificación: requisitos priorizados, escenarios de uso, criterios de aceptación y trazabilidad |

Este documento reúne la Fase 2. El detalle está en los documentos [01](01-supuestos-de-partida.md) a [05](05-matriz-trazabilidad.md).

> **v0.2 (2026-11-04).** La tutora ha indicado que el enfoque es la **gestión interna** de las aulas, y la especificación se ha rehecho sobre esa base. La v0.1, que especificaba un catálogo de aulas para el alumnado, está en el [histórico](historico/06-especificacion_v0.1.md).

## 1. Resumen

- La especificación describe una **herramienta interna** para que el **Departamento de Pedagogía y e-learning (DPE)** gestione las doce aulas Moodle **desde un único punto**, sin tener que entrar y salir de cada una. Informática la implementaría y se ocuparía de la parte técnica. El alumnado no la usa, porque ya entra en su curso con la URL que se le facilita.
- Contiene **13 escenarios de uso**, **18 requisitos funcionales** (10 imprescindibles, 4 convenientes y 4 futuros), **6 descartes expresos**, **34 requisitos no funcionales** en los cuatro grupos de la ficha y **36 casos de prueba** definidos.
- Los requisitos se organizan en tres bloques según su **dependencia de la viabilidad**: una **base** que siempre es viable (acceso restringido, inventario, accesos directos a la gestión de cada aula y su mantenimiento), una **consulta** de información de varias aulas a la vez que depende de los servicios web de Moodle, y unas **acciones y acceso único** que quedan como futuro.
- **Limitaciones principales:** la respuesta de la tutora es breve y su interpretación está pendiente de confirmar; la organización no ha respondido; hay **6 datos de la tutora** (DT-01 a DT-06) y **14 supuestos** (SF-01 a SF-14), cada uno con su efecto si es falso; los valores numéricos son propuestas razonadas.

## 2. Alcance que se especifica

| Incluido | Excluido |
|---|---|
| Acceso solo para personal autorizado, con roles de gestión, técnico y consulta | Portal o catálogo de aulas para el alumnado |
| Inventario de las aulas con identificación inequívoca y estado | Modificar o configurar las aulas en producción |
| Accesos directos a las áreas de gestión de cada aula | Guardar o reenviar contraseñas personales de las aulas |
| Búsqueda y filtros; mantenimiento del inventario por el DPE con registro | Reproducir la administración completa de Moodle |
| Registro de entradas y permisos | Unificar las aulas; resolver la versión de Moodle |
| Consulta agregada de varias aulas y búsqueda de cursos, condicionadas a la viabilidad | Acciones de gestión desde la plataforma, acceso único y búsqueda de personas (futuro condicionado) |

## 3. Usuarios y escenarios

Perfiles de la Fase 1 (v0.4): **gestor/a de e-learning** del DPE (PU-08, principal), **técnico/a de Informática** (PU-09), **responsable del DPE** (PU-10) y, solo para consultar, el **CAU** (PU-05).

| Grupo | Escenarios |
|---|---|
| Trabajar con las aulas | ES-01 vista de conjunto al empezar la jornada · ES-02 ir directamente a la gestión de cursos de un aula · ES-03 matricular a un grupo · ES-04 no confundir aulas con el mismo título · ES-12 con lector de pantalla o teclado |
| Consultar varias aulas | ES-05 saber en qué aula está un curso · ES-06 resumen de varias aulas |
| Mantener y administrar | ES-07 alta de un aula · ES-08 cambio, mantenimiento o retirada · ES-09 aula que no responde · ES-10 estado técnico · ES-11 altas y bajas de personal · ES-13 caída de la plataforma |

## 4. Requisitos priorizados

Método **MoSCoW**, el mismo que en el alcance preliminar.

### Imprescindibles (prototipo)

| ID | Requisito |
|---|---|
| RF-01 | Solo entra el personal autorizado |
| RF-02 | Permisos según el rol (gestión, técnico, consulta) |
| RF-03 | Inventario de aulas con nombre propio, marca, dominio, estado y responsables |
| RF-04 | Accesos directos a las áreas de gestión de cada aula, indicando aula y dominio |
| RF-05 | Búsqueda y filtros |
| RF-06 | Altas y cambios sin programar, solo con dominios permitidos y HTTPS |
| RF-07 | Ocultar o retirar sin borrar |
| RF-08 | Registro de cambios del inventario, con vuelta atrás |
| RF-09 | Aviso de aulas sin revisar en 90 días |
| RF-10 | Registro de entradas y de cambios de permisos |
| No funcionales | WCAG 2.2 AA; ordenador, tableta y consulta en móvil; teclado y lector de pantalla; el 90 % de las tareas de prueba llega a la página de gestión en 3 acciones y 20 s o menos, y más rápido que hoy; siempre visible en qué aula se actúa; identificación robusta con doble factor; ninguna contraseña de las aulas; mínimos datos personales; claves de servicio protegidas; sin exposición pública; carga en 2 s; la caída no impide gestionar las aulas; recuperación en 1 día laborable; alta de un aula por el DPE en 15 minutos; guía de operación; copias; responsables del DPE e Informática |

### Convenientes (planificados, según la viabilidad)

Consulta agregada de varias aulas (RF-11), búsqueda de cursos en todas las aulas (RF-12), estado técnico de cada aula (RF-13) y comprobación periódica de que responden (RF-14). Entre los no funcionales: vocabulario del personal, valoración SUS de 70 o más, registros conservados 12 meses, cabeceras de seguridad, consulta en 10 s o menos sin cargar las aulas, disponibilidad del 99 % en horario laboral, esfuerzo de mantenimiento de 4 h/mes o menos e integración que sobreviva a las actualizaciones.

### Futuros condicionados

Acciones de gestión desde la plataforma (RF-15), inicio de sesión único del personal (RF-16), búsqueda de personas en todas las aulas (RF-17) e indicadores para la responsable del DPE (RF-18). Cada uno tiene su condición en el [documento 03](03-requisitos-funcionales.md#rf-15-a-rf-18-futuros-condicionados-c).

### Descartados

Modificar las aulas en producción, unificarlas, tratar contraseñas, portal para el alumnado, reproducir la administración de Moodle y resolver su versión (W-01 a W-06).

## 5. Criterios de aceptación

Los funcionales usan el formato *Dado / Cuando / Entonces* ([documento 03](03-requisitos-funcionales.md)). Los no funcionales tienen un valor y un método de comprobación ([documento 04](04-requisitos-no-funcionales.md)). Todo lo que exija identificarse en un aula o usar sus servicios web se prueba en un **aula de pruebas**, nunca en las reales.

## 6. Trazabilidad

La [matriz](05-matriz-trazabilidad.md) enlaza necesidad → escenario → requisito → caso de prueba, problema → requisito y supuesto → requisitos afectados.

| Comprobación | Resultado |
|---|---|
| Necesidades dentro del enfoque cubiertas | 11 de 11. N-13 (consultar varias aulas) depende de la viabilidad |
| Necesidades fuera del enfoque | 4, con motivo (eran del alumnado o de imagen pública) |
| Problemas abordados | PR-09 (gestión dispersa) es el núcleo; PR-02 y PR-08 quedan fuera del enfoque |
| Requisitos *Must* y *Should* con caso de prueba | 48 de 48 |
| Requisitos sin origen | Ninguno |

## 7. Datos y supuestos principales

- **DT-01 a DT-06 (tutora):** gestión interna; rol de administración y gestión; el alumnado entra por URL; gestiona el DPE; implementa Informática; primero la viabilidad.
- **SF-03.** Cada persona del DPE tiene una cuenta en cada aula.
- **SF-05.** El proyecto no toca las aulas en producción; la integración se demuestra en un aula de pruebas.
- **SF-06.** Informática puede habilitar los servicios web en modo solo lectura. Si no, el panel se queda en la base.
- **SF-12.** Basta con datos agregados; no se guardan datos del alumnado.
- **SF-14.** El proyecto termina con viabilidad, prototipo y recomendación; la implantación sería de Informática.

## 8. Preguntas abiertas que más cambiarían la especificación

| Pregunta | Qué cambiaría |
|---|---|
| P-T01 ¿Qué significa «lo del tema de entorno de pruebas»? | Si hay o no aula de pruebas de la organización (SF-05) |
| P-G01 ¿Qué tareas de gestión se repiten más? | Los accesos directos de RF-04 y los datos de RF-11 |
| P-G04 ¿Basta con consultar o se quieren hacer cambios desde la plataforma? | Prioridad de RF-15 |
| P-C04 ¿Se pueden habilitar los servicios web? | Viabilidad de RF-11 a RF-13 |
| P-G03 / P-I01 ¿Una cuenta por aula? ¿Directorio común? | Viabilidad y prioridad de RF-16 |
| P-G05 ¿Quién decide la viabilidad y con qué criterios? | Contenido del estudio de la Fase 5 |

## 9. Decisión que se pide a la tutora

1. ¿Es correcta la interpretación: una herramienta interna para que el DPE gestione las doce aulas desde un único punto, sin portal para el alumnado?
2. ¿Están bien elegidos los imprescindibles (acceso restringido, inventario y accesos directos a la gestión) y bien condicionadas a la viabilidad la consulta de varias aulas y las acciones desde la plataforma?
3. ¿Qué quería decir con «lo del tema de entorno de pruebas»? ¿Se podría disponer de un aula de pruebas?
4. ¿Sería posible una conversación breve con alguien del DPE y de Informática?

## 10. Comprobación de los criterios de salida de la fase

| Criterio (plan de la fase) | Estado |
|---|---|
| Cada necesidad cubierta o descartada con motivo | Cumplido |
| Cada *Must* y *Should* con criterio de aceptación y caso de prueba | Cumplido |
| Ningún requisito sin origen | Cumplido |
| Grupos de requisitos de la ficha cubiertos | Cumplido |
| Supuestos listados con su efecto | Cumplido |
| Requisitos que dependen de la viabilidad identificados | Cumplido (sección 5 del documento 03) |
| Requisitos aprobados por la tutora (hito) | **Pendiente** |

## 11. Control de versiones

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| 0.1 | 2026-11-03 | Claude (Redactor) | Primera versión de la especificación. [Archivada](historico/06-especificacion_v0.1.md) |
| 0.2 | 2026-11-04 | Claude (Redactor) | Especificación rehecha para el enfoque de gestión interna indicado por la tutora |
