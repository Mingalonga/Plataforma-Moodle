# Fase 2 — Requisitos

| Campo | Valor |
|---|---|
| Proyecto | Plataforma centralizada para los entornos Moodle (Ficha 01) |
| Fase | 2 — Requisitos |
| Trabajo principal (según la ficha) | Definir usuarios, escenarios de uso, requisitos funcionales y no funcionales, prioridades y criterios de aceptación |
| Evidencia de avance (según la ficha) | Documento de requisitos trazable |
| Hito | Requisitos aprobados |
| Entregable asociado | 02 — Especificación (requisitos priorizados, escenarios de uso, criterios de aceptación y trazabilidad) |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |
| Versión del paquete | 0.4 (respuestas y normas de seguridad de Grupo ATU incorporadas) |
| Estado | En curso. Iniciada el 2026-11-03 por decisión del alumno. El 2026-11-04 la tutora orienta el proyecto a la **gestión interna** de las aulas (Departamento de Pedagogía y e-learning, con implementación de Informática) y la fase se rehace. El 2026-11-05 **Grupo ATU responde**: el DPE quiere ver a los alumnos de todas las aulas, controlar accesos y hacer cambios globales o individuales, con un estudio de viabilidad real (paquete 0.3) |

## Índice de documentos

| N.º | Documento | Versión | Estado | Última actualización |
|---|---|---|---|---|
| 00 | [Plan de la Fase 2](00-plan-fase-2.md) | 0.3 | Revisión del propietario | 2026-11-05 |
| 01 | [Supuestos de partida](01-supuestos-de-partida.md) | 0.4 | Revisión del propietario | 2026-11-05 |
| 02 | [Usuarios y escenarios de uso](02-usuarios-escenarios.md) | 0.3 | Revisión del propietario | 2026-11-05 |
| 03 | [Requisitos funcionales](03-requisitos-funcionales.md) | 0.3 | Revisión del propietario | 2026-11-05 |
| 04 | [Requisitos no funcionales](04-requisitos-no-funcionales.md) | 0.4 | Revisión del propietario | 2026-11-05 |
| 05 | [Matriz de trazabilidad y casos de prueba](05-matriz-trazabilidad.md) | 0.3 | Revisión del propietario | 2026-11-05 |
| 06 | [**Especificación (entregable 02)**](06-especificacion.md) | 0.4 | Revisión del propietario | 2026-11-05 |
| — | [Registro de seguimiento](registro-seguimiento.md) | — | Vivo | 2026-11-05 |
| — | [Registro de cambios](CHANGELOG.md) | — | Vivo | 2026-11-05 |
| — | [Histórico de versiones](historico/README.md) | — | Vivo | 2026-11-05 |
| — | [**Resumen para la tutora (PDF)**](entregas/Resumen_Fase-2_Plataforma-Moodle_v3.pdf). Fuente Typst: [`entregas/resumen-fase-2-tutora.typ`](entregas/resumen-fase-2-tutora.typ) | v3 (basado en el paquete 0.3) | Para enviar | 2026-11-05 |
| — | [Guía de la Fase 2 para el alumno (PDF)](entregas/Guia-alumno_Fase-2_Plataforma-Moodle_v3.pdf), explicación detallada para uso interno, con qué ha cambiado y por qué. Fuente: [`entregas/guia-fase-2-alumno.typ`](entregas/guia-fase-2-alumno.typ) | v3 | Uso del alumno | 2026-11-05 |
| — | [**Propuesta y viabilidad (PDF)**](propuesta/Propuesta-viabilidad_Plataforma-Moodle_v3.pdf), 3 páginas para el DPE, Informática y Dirección | v3 | Para enviar a la organización | 2026-11-05 |
| — | [**Dosier de respaldo (PDF)**](propuesta/Dosier-respaldo_Plataforma-Moodle_v4.pdf), independiente, con el detalle técnico y la lista de normas de Grupo ATU | v4 | Para enviar a la organización | 2026-11-05 |
| — | [Guía del alumno para la propuesta (PDF)](propuesta/Guia-alumno_Propuesta_Plataforma-Moodle_v5.pdf): leyenda de siglas, origen de cada dato, conceptos técnicos, qué es seguro y qué no, tablero de control. Fuentes Typst en [`propuesta/`](propuesta/); versiones anteriores en [`propuesta/historico/`](propuesta/historico/) | v5 | Uso del alumno | 2026-11-05 |
| — | [**Preguntas sobre la propuesta (PDF)**](propuesta/Preguntas-propuesta_Grupo-ATU_Plataforma-Moodle_v3.pdf): 8 preguntas de la propuesta y del dosier, sin repetir, por departamento y sin comentarios. Fuente: [`propuesta/preguntas-propuesta.typ`](propuesta/preguntas-propuesta.typ) | v3 | Para enviar a la organización | 2026-11-05 |
| — | [Preguntas para Grupo ATU (PDF)](entregas/Preguntas_Grupo-ATU_Plataforma-Moodle_v3.pdf): 9 preguntas para el Departamento de Pedagogía y e-learning, Informática y quien decida la viabilidad, solo con las preguntas. Fuente: [`entregas/preguntas-grupo-atu.typ`](entregas/preguntas-grupo-atu.typ) | v3 | Enviadas y respondidas el 2026-11-05 | 2026-11-04 |

## Identificadores

| Prefijo | Qué es | Dónde |
|---|---|---|
| DT-xx | Dato indicado por la tutora (2026-11-04) | 01 |
| DO-xx | Dato de la organización: respuestas de Grupo ATU (2026-11-05) | 01 |
| SF-xx | Supuesto de la Fase 2 | 01 |
| PU-xx | Perfil de usuario (de la Fase 1, v0.4: PU-05, PU-08, PU-09, PU-10) | 02 |
| ES-xx | Escenario de uso | 02 |
| RF-xx | Requisito funcional | 03 |
| W-xx | Descartado expresamente (*Won't*) | 03 |
| RNF-UX / SEG / REN / MAN-xx | Requisito no funcional por grupo | 04 |
| CP-F / UX / SEG / REN / MAN-xx | Caso de prueba | 05 |
| N-xx, PR-xx, AL-xx, RS-xx, P-xx | Necesidades, problemas, alcance, riesgos y preguntas de la Fase 1 | [Fase 1](../Fase-1/README.md) |

> **Nota sobre identificadores.** En el paquete 0.2 los escenarios, requisitos y casos de prueba se han vuelto a numerar. La correspondencia de los requisitos funcionales con la v0.1 está en la sección 6 del [documento 03](03-requisitos-funcionales.md#6-correspondencia-con-la-v01).

## Convenciones

Las mismas que en la Fase 1: versiones 0.x como borrador y 1.0 al aprobarlas la tutora; versiones anteriores en `historico/`; cambios en el `CHANGELOG.md`; revisiones en el `registro-seguimiento.md`; etiquetas de origen [H], [O], [D], [S], [R] y [P] ([detalle](../Fase-1/README.md#clasificación-de-la-información)).
