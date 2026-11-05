# 00 — Plan de la Fase 2: Requisitos

| Campo | Valor |
|---|---|
| Versión | 0.3 |
| Fecha | 2026-11-05 |
| Estado | Revisión del propietario |
| Redacción | Claude (roles Analista y Redactor), a petición del alumno |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |

> **v0.2 (2026-11-04).** La tutora ha indicado que el enfoque es la **gestión interna** de las aulas: una herramienta para que el Departamento de Pedagogía y e-learning (DPE) no tenga que entrar y salir de cada aula. El alumnado no es usuario de la plataforma, porque ya entra en su curso con la URL que se le facilita. Informática haría la implementación, y antes hay que estudiar la viabilidad. Toda la Fase 2 se rehace sobre esa base (paquete 0.2). El paquete 0.1, pensado para el alumnado, se conserva en [`historico/`](historico/README.md).

> **v0.3 (2026-11-05).** Grupo ATU responde a las nueve preguntas. Lo esencial: el DPE quiere **ver a los alumnos de todas las aulas, controlar accesos y hacer cambios globales o individuales**, con un **estudio de viabilidad real** («más allá de hipervínculos»). Informática pide un documento **breve, claro y directo**, con un **dosier de respaldo independiente**. La organización resume el encargo como **«los planos de la casa»**. Se actualiza el paquete a la 0.3 conservando los identificadores.

## 1. Objetivo de la fase

Según la ficha, la Fase 2 debe «definir usuarios, escenarios de uso, requisitos funcionales y no funcionales, prioridades y criterios de aceptación». La evidencia de avance es un **documento de requisitos trazable** y el hito es **requisitos aprobados**. El entregable asociado es el **02 — Especificación** (requisitos priorizados, escenarios de uso, criterios de aceptación y trazabilidad).

Como en la Fase 1, esta fase **no** elige tecnología, arquitectura ni diseño visual. Los requisitos dicen *qué* debe cumplir la solución, no *cómo*; el cómo sale de la comparación de alternativas (Fase 3).

## 2. Condiciones de partida

- **Enfoque indicado por la tutora (2026-11-04):** gestión interna de las aulas, orientada al rol de administración y gestión; gestión del entorno por el DPE; implementación por Informática; estudio de viabilidad antes de implementar. Ver el [registro de seguimiento de la Fase 1](../Fase-1/registro-seguimiento.md) y el [alcance preliminar v0.3](../Fase-1/07-alcance-preliminar.md).
- **La interpretación de esa respuesta está pendiente de confirmar** con la tutora: el grado de integración que se espera y la frase sobre el «entorno de pruebas» no son claros (P-T01, P-G04).
- **La organización ha respondido (2026-11-05)** a las nueve preguntas (datos DO-01 a DO-09 del documento [01](01-supuestos-de-partida.md)). Quedan supuestos sobre lo que no se ha contestado: sobre todo, si se pueden habilitar los servicios web (SF-06), que Informática no valorará sin el plano.
- **Forma del entregable (DO-08):** un documento breve para decidir y un dosier de respaldo aparte. **Proceso de decisión (DO-09):** el DPE valora pros y contras; después deciden Informática y Dirección.
- Se mantienen los límites de la ficha: sin credenciales, sin datos personales, sin modificar las aulas en producción, sin pruebas intrusivas y sin presentar como real una integración simulada.

## 3. Alcance de la fase

**Dentro del alcance**

- Datos de partida y supuestos que sustituyen provisionalmente a las respuestas de la organización.
- Usuarios (perfiles de gestión de la Fase 1, v0.4) y escenarios de uso.
- Requisitos funcionales con prioridad y criterios de aceptación.
- Requisitos no funcionales en los grupos que pide la ficha: usabilidad y accesibilidad, seguridad y privacidad, rendimiento y disponibilidad, y mantenimiento.
- Matriz de trazabilidad necesidad → escenario → requisito → caso de prueba.
- Especificación (entregable 02).

**Fuera del alcance**

- Comparar alternativas o elegir tecnología (Fase 3).
- Diseño de pantallas, flujos visuales o arquitectura (Fase 4).
- Estudio de viabilidad (Fase 5). Esta fase sí señala qué requisitos dependen de él. **v0.3:** la organización pide la viabilidad como entregable principal; se propone adelantar un documento ejecutivo de viabilidad (T14).
- Ejecutar las pruebas: aquí solo se definen los casos; se ejecutan en la Fase 7.

## 4. Método

- **Priorización: MoSCoW**, el mismo método de la Fase 1. *Must* = imprescindible para el prototipo; *Should* = conveniente, se planifica (aquí casi todos dependen de la viabilidad de la integración); *Could* = futuro condicionado; *Won't* = descartado de forma expresa, con motivo.
- **Redacción de requisitos.** Una frase con «debe», un solo comportamiento comprobable por requisito, sin nombrar tecnología.
- **Criterios de aceptación** en formato *Dado / Cuando / Entonces* para los funcionales, y con un valor medible y un método de comprobación para los no funcionales.
- **Identificadores.** ES-xx (escenarios), RF-xx (funcionales), RNF-UX / SEG / REN / MAN-xx (no funcionales), CP-xx (casos de prueba), SF-xx (supuestos) y DT-xx (datos de la tutora). **En el paquete 0.2 los identificadores se han vuelto a numerar**: un RF-03 de la v0.2 no es el RF-03 de la v0.1. La correspondencia está en la sección 6 de [03](03-requisitos-funcionales.md).
- **Etiquetas de origen**: las mismas que en la Fase 1 ([H], [O], [D], [S], [R], [P]).

## 5. Tareas

| ID | Tarea | Depende de | Entregable | Estado |
|---|---|---|---|---|
| T1 | Registrar la respuesta de la tutora y la decisión de continuar | — | Registro de seguimiento de la Fase 1 | Hecho |
| T2 | Plan de la fase | T1 | `00-plan-fase-2.md` | Hecho (v0.2) |
| T3 | Supuestos de partida | Fase 1 (registro de preguntas) | `01-supuestos-de-partida.md` | Hecho (v0.2) |
| T4 | Usuarios y escenarios de uso | T3, Fase 1 (perfiles) | `02-usuarios-escenarios.md` | Hecho (v0.2) |
| T5 | Requisitos funcionales | T4 | `03-requisitos-funcionales.md` | Hecho (v0.2) |
| T6 | Requisitos no funcionales | T4 | `04-requisitos-no-funcionales.md` | Hecho (v0.2) |
| T7 | Trazabilidad y casos de prueba | T5, T6 | `05-matriz-trazabilidad.md` | Hecho (v0.2) |
| T8 | Especificación (entregable 02) | T3–T7 | `06-especificacion.md` | Hecho (v0.2) |
| T9 | Revisión del alumno | T8 | Registro de seguimiento | Hecho para la v0.1; **pendiente para la v0.2** |
| T10 | Presentación a la tutora (hito «requisitos aprobados») | T9 | Registro de seguimiento | Pendiente |
| T11 | Reorientar la fase al enfoque de gestión interna | Respuesta de la tutora del 2026-11-04 | Paquete 0.2 completo | Hecho |
| T12 | Confirmar la interpretación con la tutora y aclarar P-T01 | T11 | Registro de seguimiento | Superada en parte: la organización ha confirmado el enfoque y P-T01 queda resuelta en parte (DO-06) |
| T13 | Incorporar las respuestas de Grupo ATU | Respuestas del 2026-11-05 | Paquete 0.3, resumen v3, guía v3 | Hecho |
| T14 | «Los planos»: documento ejecutivo de viabilidad (breve) y dosier de respaldo independiente | T13 | [`planos/`](planos/) | Hecho (v1, 2026-11-05) a petición del alumno |
| T15 | Confirmar con el DPE las interpretaciones SF-16 y SF-17 (P-G07, P-G08) | T13 | Registro de seguimiento | Pendiente |

## 6. Criterios de salida

- Cada necesidad que sigue dentro del enfoque (N-03, N-05 a N-08, N-10 a N-15 y, desde la v0.3, N-16) está cubierta por al menos un requisito, y las que quedan fuera (N-01, N-02, N-04 y N-09) tienen el motivo escrito.
- Cada requisito *Must* y *Should* tiene criterio de aceptación y al menos un caso de prueba.
- Ningún requisito queda sin origen (necesidad, problema, escenario o restricción de la ficha).
- Los grupos de requisitos de la ficha están cubiertos.
- Los supuestos de los que dependen los requisitos están listados, con qué cambiaría si fueran falsos.
- Se indica qué requisitos dependen de la viabilidad (integración con Moodle).

## 7. Riesgos propios de esta fase

| ID | Riesgo | Respuesta |
|---|---|---|
| RP-07 | Requisitos construidos sobre supuestos que la organización desmienta (amplía RP-01) | Supuestos explícitos y enlazados a cada requisito; si uno cae, la matriz indica qué requisitos revisar |
| RP-08 | Avanzar sin el hito de la Fase 1 validado (materializa RP-03) | Decisión registrada. **v0.2: materializado** el 2026-11-04; se ha rehecho la fase conservando la v0.1 |
| RP-09 | Fijar valores numéricos sin datos reales (tiempos, carga, disponibilidad) | Cada valor se marca [S] o [R] con su justificación y se revisará cuando haya datos |
| RP-10 | Interpretar mal el nuevo enfoque (ver el [registro de riesgos](../Fase-1/06-registro-riesgos.md)) | La interpretación está escrita como datos (DT) y supuestos (SF) separados; se pide confirmación a la tutora (T12). **v0.3: reducido** por las respuestas de la organización |
| RP-11 | Que Informática no lea la propuesta por ser larga o técnica (DO-08) | Documento ejecutivo breve, con la decisión y los pros y contras al principio; todo el detalle en un dosier aparte (T14) |
| RP-12 | Que un cambio global erróneo afecte a muchas personas o aulas a la vez | Vista previa, confirmación reforzada, registro y vuelta atrás (RF-21); permisos limitados (RNF-SEG-12); pruebas solo en aulas de prueba |

## 8. Control de versiones

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| 0.1 | 2026-11-03 | Claude (Analista / Redactor) | Primera versión. [Archivada](historico/00-plan-fase-2_v0.1.md) |
| 0.2 | 2026-11-04 | Claude (Analista / Redactor) | Enfoque de gestión interna: condiciones de partida, alcance, nueva numeración, tareas T11 y T12, criterios de salida y RP-10. [Archivada](historico/00-plan-fase-2_v0.2.md) |
| 0.3 | 2026-11-05 | Claude (Analista / Redactor) | Respuestas de Grupo ATU: condiciones de partida, tareas T13 a T15, N-16 en los criterios de salida, riesgos RP-11 y RP-12 |
