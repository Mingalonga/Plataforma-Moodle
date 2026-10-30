# 00 — Plan de la Fase 1: Descubrimiento

| Campo | Valor |
|---|---|
| Versión | 0.4 |
| Fecha | 2026-10-30 |
| Estado | Revisión del propietario |
| Redacción | Claude (roles Analista y Redactor), a petición del alumno |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |

## 1. Objetivo de la fase

Comprender la situación actual antes de proponer ninguna solución: qué entornos Moodle existen, quién los usa y los gestiona, qué problema concreto se quiere resolver y cuál sería un alcance preliminar razonable. La fase termina cuando el tutor valida ese alcance preliminar (hito de la ficha).

Esta fase **no** elige tecnología, arquitectura ni diseño. La ficha dice expresamente que no prescribe ninguna y que la solución debe salir del análisis de alternativas (Fase 3).

## 2. Fuentes de la fase

| Fuente | Uso |
|---|---|
| Ficha 01, *Plataforma centralizada para los entornos Moodle* (PDF, 9 páginas) | Documento rector: fases, entregables, límites, evaluación y plantilla de seguimiento |
| *Prompt inicial del proyecto Plataforma Moodle* (DOCX) | Inventario de los doce entornos, reglas de rigor, roles y estructura de trabajo |
| Páginas públicas de los doce entornos | Solo observación pasiva, autorizada por el alumno el 2026-10-30 (P-A04) |
| Documentación oficial de Moodle y normativa | Solo cuando haga falta para respaldar una afirmación; se registrará en el documento 02 |

## 3. Alcance de la fase

**Dentro del alcance**

- Plan de fase, registro de preguntas, supuestos y dependencias.
- Esquema de ficha de observación y metodología de consulta de fuentes.
- Inventario de los doce entornos con estado «verificado», «indicio» o «pendiente de confirmar».
- Mapa inicial de actores (quién usa, quién gestiona, quién decide) y perfiles de usuario como hipótesis.
- Descripción de la situación actual, necesidades y problemas, separando lo comprobado de lo supuesto.
- Guion de preguntas para entrevistar a responsables y usuarios.
- Registro inicial de riesgos.
- Alcance preliminar del proyecto y una hipótesis de MVP, sin compromiso técnico.
- Diagnóstico inicial (entregable 01) que reúne todo lo anterior.

**Fuera del alcance**

- Requisitos detallados con criterios de aceptación (Fase 2).
- Comparación de alternativas o elección de tecnología (Fase 3).
- Diseño, viabilidad económica, prototipo y pruebas (Fases 4 a 7).
- Cualquier acceso con credenciales, pruebas intrusivas, escaneos o recogida de datos personales.

## 4. Tareas

| ID | Tarea | Rol principal | Revisión | Depende de | Entregable | Estado |
|---|---|---|---|---|---|---|
| T1 | Plan de fase y estructura de documentación | Coordinador / Redactor | Propietario | — | `00-plan-fase-1.md`, índice, changelog, seguimiento | Hecho (v0.1) |
| T2 | Registro de preguntas, supuestos y dependencias | Analista | Propietario | — | `01-registro-preguntas-supuestos.md` | Hecho (v0.1) |
| T3 | Metodología de observación y registro de fuentes | Analista / Especialista Moodle | Seguridad | T1 | `02-fuentes-y-metodologia.md` | Hecho (v0.1) |
| T4 | Inventario de los doce entornos (observación pasiva) | Analista / Especialista Moodle | Seguridad | T3, P-A04 | `03-inventario-campus.md` | Hecho (v0.2, los doce entornos) |
| T5 | Mapa inicial de actores y perfiles | Analista | UX | T2 | `04-mapa-actores-perfiles.md` | Hecho (v0.1) |
| T6 | Situación actual, necesidades, problemas y guion de entrevistas | Analista | Propietario | T4, T5 | `05-situacion-actual.md` | Hecho (v0.1) |
| T7 | Registro de riesgos inicial | Seguridad / Project Manager | Arquitecto | T4, T6 | `06-registro-riesgos.md` | Hecho (v0.1) |
| T8 | Alcance preliminar e hipótesis de MVP | Coordinador | Arquitecto, UX | T6, T7 | `07-alcance-preliminar.md` | Hecho (v0.1) |
| T9 | Diagnóstico inicial (entregable 01) | Redactor | Todos los roles | T3–T8 | `08-diagnostico-inicial.md` | Hecho (v0.1) |
| T10 | Revisión de calidad y preparación del hito | Coordinador / QA | Tutor | T9 | Fila en `registro-seguimiento.md` y versión 1.0 tras validación | Pendiente |

Prioridad: todas las tareas son necesarias para el hito; el orden de la tabla es el orden propuesto. Las fechas previstas se añadirán cuando el propietario indique el calendario (P-A02).

## 5. Método de trabajo

1. **Paso a paso.** Cada bloque de documentos se entrega en una *pull request* para que el propietario lo revise antes de seguir.
2. **Rigor.** Cada afirmación lleva su etiqueta de origen ([H], [O], [D], [S], [R], [P]) según la tabla del [índice de la fase](README.md#clasificación-de-la-información). No se inventan versiones de Moodle, responsables, volúmenes ni costes.
3. **No bloquear por una incógnita.** Si falta un dato, se registra la pregunta, se trabaja con un supuesto explícito y se marca lo que necesita confirmación.
4. **Observación pasiva.** En los doce entornos solo se mirará la página pública que se carga sin iniciar sesión: título, idioma, identidad visual, enlaces de ayuda o contacto y señales visibles de Moodle. No se intentará iniciar sesión, enumerar usuarios, escanear ni descargar contenido de forma masiva. No se registrarán datos personales.
5. **Trazabilidad.** Cada necesidad o problema detectado lleva un identificador (N-xx, PR-xx) que se reutilizará en la Fase 2 para enlazarlo con requisitos.

## 6. Dependencias y decisiones que corresponden al propietario o al tutor

| ID | Decisión o dato necesario | Quién | Bloquea |
|---|---|---|---|
| P-A01 | Nombres del alumno/a y del tutor/a para la cabecera de la ficha | Propietario | Resuelta: alumno Carlos García Rallo; tutor/a en blanco |
| P-A02 | Calendario y fecha de revisión del hito | Propietario / Tutor | Fechas previstas de las tareas |
| P-A03 | Medio de entrega y formato de la revisión (¿basta el repositorio?) | Tutor | T10 |
| P-A04 | Autorización para observar las páginas públicas de los doce entornos | Propietario / Tutor | Resuelta por el alumno |
| P-A05 | Contacto con responsables de los campus o con usuarios para entrevistas | Propietario / Organización | Resuelta: de momento solo información pública. T5 y T6 trabajarán con supuestos explícitos y un guion de entrevista preparado para cuando sea posible |

El detalle de estas y del resto de preguntas está en el [registro de preguntas](01-registro-preguntas-supuestos.md).

## 7. Criterios de salida de la fase

La Fase 1 se considera lista para revisión del tutor cuando:

- [ ] Los doce entornos tienen ficha de observación, con cada dato marcado como verificado, indicio o pendiente.
- [ ] Existe un mapa de actores con al menos usuarios, gestores de campus, responsables de decisión y soporte.
- [ ] La situación actual y los problemas están descritos separando hechos de supuestos.
- [ ] Las diez preguntas guía de la ficha tienen una respuesta, aunque sea provisional, con su origen indicado.
- [ ] El registro de preguntas indica qué está resuelto, qué está pendiente y a quién se dirige cada pregunta.
- [ ] Existe un registro de riesgos inicial.
- [ ] El alcance preliminar distingue lo imprescindible, lo conveniente y lo futuro, sin elegir solución técnica.
- [ ] El diagnóstico inicial reúne todo lo anterior y enlaza a cada documento.
- [ ] No hay credenciales, datos personales ni secretos en el repositorio.
- [ ] El registro de seguimiento y el changelog están al día.

La fase **no** se da por aprobada por haber producido estos documentos: queda aprobada cuando el tutor valida el alcance preliminar y se anota en el registro de seguimiento.

## 8. Control de versiones

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| 0.1 | 2026-10-30 | Claude (Analista / Redactor) | Primera versión del plan de fase. [Archivada](historico/00-plan-fase-1_v0.1.md) |
| 0.2 | 2026-10-30 | Claude (Analista / Redactor) | Nombre del alumno, respuestas a P-A01, P-A04 y P-A05, T3 y T4 hechas. [Archivada](historico/00-plan-fase-1_v0.2.md) |
| 0.3 | 2026-10-30 | Claude (Analista / Redactor) | T5 a T9 hechas; queda T10 (revisión del tutor). [Archivada](historico/00-plan-fase-1_v0.3.md) |
| 0.4 | 2026-10-30 | Claude (Analista / Redactor) | T4 completa con el entorno 7 |
