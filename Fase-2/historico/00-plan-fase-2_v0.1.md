# 00 — Plan de la Fase 2: Requisitos

| Campo | Valor |
|---|---|
| Versión | 0.1 |
| Fecha | 2026-11-03 |
| Estado | Revisión del propietario |
| Redacción | Claude (roles Analista y Redactor), a petición del alumno |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |

## 1. Objetivo de la fase

Según la ficha, la Fase 2 debe «definir usuarios, escenarios de uso, requisitos funcionales y no funcionales, prioridades y criterios de aceptación». La evidencia de avance es un **documento de requisitos trazable** y el hito es **requisitos aprobados**. El entregable asociado es el **02 — Especificación** (requisitos priorizados, escenarios de uso, criterios de aceptación y trazabilidad).

Como en la Fase 1, esta fase **no** elige tecnología, arquitectura ni diseño visual. Los requisitos dicen *qué* debe cumplir la solución, no *cómo*; el cómo sale de la comparación de alternativas (Fase 3).

## 2. Condiciones de partida

- **La Fase 1 no tiene validación formal.** La tutora acusó recibo del resumen v5 el 2026-11-03 y pidió que el alumno la vaya informando, sin pronunciarse sobre el alcance ni sobre las cuestiones planteadas. Por decisión del alumno, la Fase 2 empieza igualmente (ver el [registro de seguimiento de la Fase 1](../Fase-1/registro-seguimiento.md)).
- **La organización no ha respondido** a las preguntas de la Fase 1. Los requisitos se apoyan en los supuestos explícitos del documento [01](01-supuestos-de-partida.md). Cada requisito que dependa de un supuesto lo indica, y se dice qué cambiaría si el supuesto resulta falso.
- Se mantienen los límites de la ficha: sin credenciales, sin datos personales, sin tocar ningún campus y sin pruebas intrusivas.

## 3. Alcance de la fase

**Dentro del alcance**

- Supuestos de partida que sustituyen provisionalmente a las respuestas de la organización.
- Usuarios (perfiles de la Fase 1) y escenarios de uso.
- Requisitos funcionales con prioridad y criterios de aceptación.
- Requisitos no funcionales en los cinco grupos que pide la ficha: funcionales, usabilidad y accesibilidad, seguridad y privacidad, rendimiento y disponibilidad, mantenimiento.
- Matriz de trazabilidad necesidad → escenario → requisito → caso de prueba.
- Especificación (entregable 02).

**Fuera del alcance**

- Comparar alternativas o elegir tecnología (Fase 3).
- Diseño de pantallas, flujos visuales o arquitectura (Fase 4).
- Ejecutar las pruebas: aquí solo se definen los casos; se ejecutan en la Fase 7.

## 4. Método

- **Priorización: MoSCoW**, el mismo método de la Fase 1, para no romper la continuidad con el alcance preliminar (AL-01 a AL-14). *Must* = imprescindible para el prototipo; *Should* = conveniente, se planifica; *Could* = futuro condicionado; *Won't* = descartado de forma expresa, con motivo. La ficha pide que el prototipo cubra los *Must* aceptados y que el resto quede «planificado, justificado o descartado de manera expresa».
- **Redacción de requisitos.** Una frase con «debe», un solo comportamiento comprobable por requisito, sin nombrar tecnología.
- **Criterios de aceptación** en formato *Dado / Cuando / Entonces* para los funcionales, y con un valor medible y un método de comprobación para los no funcionales.
- **Identificadores.** ES-xx (escenarios), RF-xx (funcionales), RNF-UX / SEG / REN / MAN-xx (no funcionales), CP-xx (casos de prueba), SF-xx (supuestos de la Fase 2). Se reutilizan los de la Fase 1: N-xx, PR-xx, PU-xx, AL-xx, RS-xx.
- **Etiquetas de origen**: las mismas que en la Fase 1 ([H], [O], [D], [S], [R], [P]).

## 5. Tareas

| ID | Tarea | Depende de | Entregable | Estado |
|---|---|---|---|---|
| T1 | Registrar la respuesta de la tutora y la decisión de continuar | — | Registro de seguimiento de la Fase 1 | Hecho |
| T2 | Plan de la fase | T1 | `00-plan-fase-2.md` | Hecho (v0.1) |
| T3 | Supuestos de partida | Fase 1 (registro de preguntas) | `01-supuestos-de-partida.md` | Hecho (v0.1) |
| T4 | Usuarios y escenarios de uso | T3, Fase 1 (perfiles) | `02-usuarios-escenarios.md` | Hecho (v0.1) |
| T5 | Requisitos funcionales | T4 | `03-requisitos-funcionales.md` | Hecho (v0.1) |
| T6 | Requisitos no funcionales | T4 | `04-requisitos-no-funcionales.md` | Hecho (v0.1) |
| T7 | Trazabilidad y casos de prueba | T5, T6 | `05-matriz-trazabilidad.md` | Hecho (v0.1) |
| T8 | Especificación (entregable 02) | T3–T7 | `06-especificacion.md` | Hecho (v0.1) |
| T9 | Revisión del alumno | T8 | Registro de seguimiento | Pendiente |
| T10 | Presentación a la tutora (hito «requisitos aprobados») | T9 | Registro de seguimiento | Pendiente |

## 6. Criterios de salida

- Cada necesidad de la Fase 1 (N-01 a N-10) está cubierta por al menos un requisito o descartada con motivo.
- Cada requisito *Must* y *Should* tiene criterio de aceptación y al menos un caso de prueba.
- Ningún requisito queda sin origen (necesidad, problema, escenario o restricción de la ficha).
- Los cinco grupos de requisitos de la ficha están cubiertos.
- Los supuestos de los que dependen los requisitos están listados, con qué cambiaría si fueran falsos.

## 7. Riesgos propios de esta fase

| ID | Riesgo | Respuesta |
|---|---|---|
| RP-07 | Requisitos construidos sobre supuestos que la organización desmienta (amplía RP-01) | Supuestos explícitos y enlazados a cada requisito; si uno cae, la matriz indica qué requisitos revisar |
| RP-08 | Avanzar sin el hito de la Fase 1 validado (materializa RP-03) | Decisión registrada; la Fase 2 no cambia el alcance preliminar, solo lo concreta, para que una corrección de la tutora se pueda aplicar sin rehacer todo |
| RP-09 | Fijar valores numéricos sin datos reales (tiempos, carga, disponibilidad) | Cada valor se marca [S] o [R] con su justificación y se revisará cuando haya datos |

## 8. Control de versiones

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| 0.1 | 2026-11-03 | Claude (Analista / Redactor) | Primera versión |
