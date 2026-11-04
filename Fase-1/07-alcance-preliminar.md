# 07 — Alcance preliminar

| Campo | Valor |
|---|---|
| Versión | 0.3 |
| Fecha | 2026-11-04 |
| Estado | Revisión del propietario |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |
| Redacción | Claude (roles Coordinador, Arquitecto y UX), a petición del alumno |

> Este documento es el **hito de la Fase 1** según la ficha: «alcance preliminar validado». Es una **hipótesis** para que la tutora la valide. No elige tecnología, arquitectura ni diseño; eso corresponde a las Fases 3 y 4.
>
> **Cambio de alcance (v0.3, 2026-11-04).** La tutora indica que el enfoque es la **gestión interna** de las aulas, orientada al rol de administración y gestión, y no al alumnado, que ya entra en su curso con una URL. El entorno lo gestionaría el **Departamento de Pedagogía y e-learning (DPE)**, la implementación la haría **Informática** y antes de nada hay que estudiar la **viabilidad**. El alcance se rehace sobre esa base. El alcance anterior (catálogo para el alumnado) se conserva en la [v0.2](historico/07-alcance-preliminar_v0.2.md) y en la sección 7 de este documento se indica qué pasa con cada capacidad. El cambio está anotado en el [registro de seguimiento](registro-seguimiento.md#cambios-de-alcance).

## 1. Problema que se propone abordar

El personal que gestiona los entornos Moodle de la organización no dispone de un punto común desde el que trabajar con todas las aulas. Hay doce aulas en doce direcciones, cada una con su inicio de sesión y su menú de administración, y para gestionarlas hay que **entrar y salir de una a otra** (PR-09, indicado por la tutora). Además, cinco aulas tienen el mismo título y no hay una vista de conjunto de su estado (PR-03, PR-04, N-12).

**Condición:** el tamaño real del problema no está medido: no se sabe qué tareas de gestión se repiten ni cuánto tiempo cuestan hoy (PR-07, P-G01, P-G02). El alcance se propone para poder comprobarlo.

## 2. Objetivo preliminar

Estudiar la viabilidad y, si resulta viable, demostrar con un prototipo una forma de que el Departamento de Pedagogía y e-learning **gestione las doce aulas desde un único punto**, de forma segura, accesible y fácil de mantener, sin modificar las aulas en producción y con un reparto claro de tareas entre el DPE e Informática.

## 3. Alcance propuesto por prioridad (MoSCoW)

Método: **MoSCoW**, igual que en la v0.2. Las capacidades nuevas se numeran a partir de AL-15 para no confundirlas con las anteriores. Prioridades provisionales: se fijan con criterios de aceptación en la Fase 2.

### Imprescindible (Must): hipótesis de MVP

| ID | Capacidad | Necesidad |
|---|---|---|
| AL-15 | Acceso **restringido al personal autorizado**, con permisos según el rol (gestión, técnico, consulta) | N-14 |
| AL-16 | **Inventario de gestión** de las aulas: marca, nombre propio que las distinga, dirección, estado, responsable y datos técnicos básicos | N-12, N-03 |
| AL-17 | **Accesos directos a las áreas de gestión** de cada aula (administración del sitio, cursos, usuarios, matriculaciones, informes) desde un único punto, indicando siempre en qué aula se entra | N-11, N-03 |
| AL-18 | **Búsqueda y filtros** sobre las aulas y sus accesos (por marca, estado o responsable) | N-11, N-12 |
| AL-19 | **Mantenimiento del inventario por el DPE**, sin programar, con registro de cambios y fecha de última revisión (sustituye a AL-05) | N-06, N-15 |
| AL-20 | **Reparto escrito de responsabilidades** entre el DPE e Informática y guía de operación | N-15, N-06 |
| AL-04 | Diseño **accesible** (WCAG 2.2 AA como referencia) y adaptable a distintas pantallas (se mantiene) | N-08 |
| AL-06 | **Ninguna contraseña personal** de las aulas guardada en la plataforma y **mínimos datos personales** (se mantiene y se refuerza) | N-07, N-14 |

### Conveniente (Should): se planifica, condicionado a la viabilidad

| ID | Capacidad | Condición |
|---|---|---|
| AL-21 | **Consulta de información de gestión de varias aulas a la vez**, solo lectura (por ejemplo, cursos activos, número de matrículas, actividad reciente), mediante los servicios web de Moodle | Servicios web habilitables (P-C04), versión de Moodle confirmada (P-C01) y aula de pruebas (P-C05). En el proyecto se demostraría solo sobre un aula de pruebas |
| AL-22 | **Búsqueda de un curso en todas las aulas** a la vez | Igual que AL-21 |
| AL-08 | Comprobación periódica y no intrusiva de que cada aula responde (se mantiene) | — |
| AL-23 | **Estado técnico** de cada aula visible para Informática (versión, mantenimiento, avisos) | Datos facilitados por Informática o por los servicios web |

### Futuro (Could): solo si se confirma necesidad, viabilidad y permisos

| ID | Capacidad | Condición previa |
|---|---|---|
| AL-24 | **Inicio de sesión único** del personal en todas las aulas | Directorio común (P-I01, S-09), cambios en la autenticación de cada aula (Informática) y Moodle con soporte |
| AL-25 | **Realizar tareas de gestión desde la plataforma** (crear cursos, matricular), sin entrar en el aula | Igual que AL-21 y, además, permisos de escritura, confirmación de cada acción y registro (RS-10, RS-11) |
| AL-26 | **Buscar a una persona usuaria en todas las aulas** | Finalidad justificada por el DPE y base legal (RS-03, A-09) |
| AL-27 | **Indicadores agregados** para la responsable o el responsable del DPE | AL-21 |

### Fuera del alcance (Won't) en este proyecto

- **Portal o catálogo de aulas para el alumnado.** El alumnado entra en su curso con la URL que se le facilita **[D]**.
- Modificar, actualizar o configurar las aulas Moodle en producción. Las pruebas de integración, si llegan, se harían solo en un aula de pruebas.
- Unificar las aulas en un único Moodle. Se puede citar en el estudio de viabilidad como alternativa de referencia, pero decidirlo corresponde a la organización.
- Reproducir dentro de la plataforma las funciones que ya ofrece Moodle (no es un «segundo Moodle»).
- Pedir, guardar o reenviar contraseñas personales de las aulas.

## 4. Alternativas que deberá comparar la Fase 3

Sin evaluarlas todavía:

1. No desarrollar nada y mejorar lo existente (accesos guardados y documentados para el DPE, nombres distintos para cada aula, gestor de contraseñas corporativo).
2. Página interna de accesos directos dentro de una herramienta ya contratada (por ejemplo, la intranet o SharePoint, si se confirma Microsoft 365, S-09).
3. Aplicación web interna con inventario, accesos directos y permisos.
4. Panel con integración de solo lectura con los servicios web de Moodle.
5. Inicio de sesión único para el personal con el directorio corporativo.
6. Herramientas existentes para gestionar varios Moodle a la vez (de terceros o complementos de Moodle).
7. Unificar las aulas en un único Moodle (solo como referencia para la viabilidad).
8. Solución por etapas que combine las anteriores.

## 5. Supuestos y condiciones del alcance

- El enfoque de gestión interna está indicado por la tutora (S-10); **el grado de integración no**. Por eso solo los accesos directos y el inventario son imprescindibles; la consulta y las acciones dependen de la viabilidad.
- Cada persona del DPE tiene una cuenta en cada aula (S-11). Si ya existiera un acceso común, AL-24 cambiaría de prioridad.
- Informática debe poder dedicar tiempo a la implementación y a la custodia de claves (D-05, P-G06).
- La viabilidad se estudia **antes** de cualquier implementación (D-06), como indica la tutora y prevé la Fase 5 de la ficha.

## 6. Cómo se comprobará (propuesta para la Fase 2)

Indicadores provisionales: tiempo y número de pasos para llegar a una tarea de gestión de cualquier aula, comparados con la forma actual; número de inicios de sesión necesarios para una jornada tipo; proporción de consultas que se resuelven sin entrar en el aula (si se aprueba AL-21); valoración del personal del DPE; resultado de la revisión de accesibilidad y de la revisión de seguridad.

## 7. Qué pasa con el alcance anterior (v0.2)

| ID | Capacidad (v0.2) | Situación en la v0.3 |
|---|---|---|
| AL-01 | Catálogo de los campus para usuarios | Sustituida por AL-16 (inventario interno) |
| AL-02 | Búsqueda por texto | Sustituida por AL-18 |
| AL-03 | Acceso directo a la página de acceso del campus | Sustituida por AL-17 (accesos a la gestión) |
| AL-04 | Diseño adaptable y accesible | Se mantiene |
| AL-05 | Procedimiento de altas, cambios y retiradas | Sustituida por AL-19 |
| AL-06 | Ningún dato personal ni credencial | Se mantiene, reforzada |
| AL-07 | Filtros por marca o área formativa | Integrada en AL-18 (sin áreas formativas, que eran para el alumnado) |
| AL-08 | Comprobación periódica de enlaces | Se mantiene |
| AL-09 | Página de ayuda con el canal del CAU | Fuera (Won't): era para el alumnado |
| AL-10 | Vista para el CAU | Integrada en AL-15 y AL-16 (el CAU como perfil de consulta) |
| AL-11 | Personalización «mis campus» | Fuera (Won't): era para el alumnado |
| AL-12 | Inicio de sesión único | Sustituida por AL-24 (para el personal) |
| AL-13 | Consulta de datos mediante la API de Moodle | Sube a conveniente como AL-21 y AL-22 |
| AL-14 | Analítica mínima de uso | Sustituida por AL-27 (indicadores de gestión) |

## 8. Decisión que se pide a la tutora

1. ¿Es correcta la interpretación del enfoque: una herramienta interna para que el DPE gestione las doce aulas desde un único punto?
2. ¿Está de acuerdo con que lo imprescindible sean el acceso restringido, el inventario y los accesos directos a la gestión, y con dejar la consulta de datos y las acciones desde la plataforma condicionadas a la viabilidad?
3. ¿Qué quería decir con «lo del tema de entorno de pruebas»? (P-T01)
4. ¿Quién decidiría la viabilidad, y sería posible hablar brevemente con alguien del DPE y de Informática? (P-G05)

## 9. Control de versiones

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| 0.1 | 2026-10-30 | Claude (Coordinador / Arquitecto / UX) | Primera versión del alcance preliminar. [Archivada](historico/07-alcance-preliminar_v0.1.md) |
| 0.2 | 2026-10-30 | Claude (Coordinador) | Web corporativa sin enlaces a campus (PR-08) y áreas formativas como posible clasificación. [Archivada](historico/07-alcance-preliminar_v0.2.md) |
| 0.3 | 2026-11-04 | Claude (Coordinador / Arquitecto / UX) | Cambio de alcance tras la respuesta de la tutora: gestión interna para el DPE. Nuevas capacidades AL-15 a AL-27, nuevas alternativas para la Fase 3 y tabla de correspondencia con la v0.2 |
