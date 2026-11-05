# 06 — Especificación (entregable 02)

| Campo | Valor |
|---|---|
| Versión | 0.4 |
| Fecha | 2026-11-05 |
| Estado | Revisión del propietario |
| Redacción | Claude (rol Redactor, con revisión de todos los roles), a petición del alumno |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |
| Entregable de la ficha | 02 — Especificación: requisitos priorizados, escenarios de uso, criterios de aceptación y trazabilidad |

Este documento reúne la Fase 2. El detalle está en los documentos [01](01-supuestos-de-partida.md) a [05](05-matriz-trazabilidad.md).

> **v0.4 (2026-11-05).** Se incorporan la Política de Seguridad y las Normas de uso de Grupo ATU (DO-10): RNF-SEG-13 se concreta, P-G09 queda resuelta y P-L01 se reduce a si Grupo ATU admite la consulta global. La v0.3 está en el [histórico](historico/06-especificacion_v0.3.md).

> **v0.3 (2026-11-05).** Grupo ATU ha respondido a las preguntas. El Departamento de Pedagogía y e-learning quiere **ver a los alumnos de todas las aulas, controlar accesos y hacer cambios globales o individuales** desde un único sitio, y pide un **estudio de viabilidad real**: «si solo fuera consultarlo con un hipervínculo sería suficiente, pero queremos ir más allá». La especificación se actualiza en consecuencia. La v0.2 está en el [histórico](historico/06-especificacion_v0.2.md).

## 1. Resumen

- La especificación describe una **herramienta interna** para que el **Departamento de Pedagogía y e-learning (DPE)**, entre 20 y 30 personas, gestione las doce aulas Moodle **desde un único punto**. Informática la implementaría si se aprueba. El alumnado y el profesorado no la usan, pero **sus datos y accesos sí se gestionan desde ella**.
- Contiene **18 escenarios de uso**, **22 requisitos funcionales** (15 imprescindibles, 5 convenientes y 2 futuros), **7 descartes expresos**, **39 requisitos no funcionales** y **47 casos de prueba**.
- Los requisitos se organizan en cuatro bloques según lo que necesitan de Moodle: **base** (acceso, inventario y accesos directos; siempre viable pero insuficiente para la organización), **consulta** (vista global de alumnos, control de accesos, cursos y estado técnico; servicios web de lectura), **cambios** (individuales y globales, con vista previa, confirmación, registro y vuelta atrás; servicios web con escritura limitada) y **acceso único** con Microsoft 365.
- **Datos de partida:** 6 de la tutora (DT-01 a DT-06) y 9 de la organización (DO-01 a DO-09). **Supuestos:** 17 vigentes, cada uno con su efecto si es falso. La pregunta clave sin respuesta es si Informática puede habilitar los servicios web (SF-06): es lo que debe contestar la viabilidad.

## 2. Alcance que se especifica

| Incluido | Excluido |
|---|---|
| Acceso solo para personal autorizado, con roles de gestión, técnico y consulta, y nunca con más permisos de los que cada persona tiene en cada aula | Portal o acceso para el alumnado o el profesorado |
| Inventario de las aulas con identificación inequívoca, estado y accesos directos a su gestión | Modificar las aulas en producción durante el proyecto |
| **Vista de los alumnos por aula y global**, sin guardar copia permanente | Guardar o reenviar contraseñas personales de las aulas |
| **Control de accesos**: cuentas inactivas, sin entrar y suspendidas | Reproducir toda la administración de Moodle |
| **Cambios individuales y globales** sobre usuarios y matrículas, con vista previa, confirmación, registro y vuelta atrás | Diseño y programación de las aulas (otro departamento) |
| Consulta agregada, búsqueda de cursos, estado técnico y acceso con la cuenta corporativa | Unificar las aulas; resolver la versión de Moodle |
| Cambios de ajustes en varias aulas (futuro condicionado) | — |

## 3. Usuarios y escenarios

Perfiles: **gestor/a de e-learning** del DPE (PU-08, principal), **técnico/a de Informática** (PU-09), **responsable del DPE** (PU-10) y, solo para consultar, el **CAU** (PU-05).

| Grupo | Escenarios |
|---|---|
| Gestionar el alumnado (nuevo) | ES-14 en qué aulas está una alumna · ES-15 cuentas sin acceso · ES-16 reactivar a un alumno · ES-17 el mismo cambio en varias aulas · ES-03 matricular a un grupo |
| Trabajar con las aulas | ES-01 vista de conjunto · ES-02 ir a la gestión de cursos de un aula · ES-04 no confundir aulas · ES-12 con lector de pantalla o teclado · ES-18 entrar con la cuenta corporativa |
| Consultar varias aulas | ES-05 en qué aula está un curso · ES-06 resumen de varias aulas |
| Mantener y administrar | ES-07 alta de un aula · ES-08 cambio o retirada · ES-09 aula que no responde · ES-10 estado técnico · ES-11 altas y bajas de personal · ES-13 caída de la plataforma |

## 4. Requisitos priorizados

Método **MoSCoW**. *Must* incluye ahora lo que la organización pide expresamente; lo que necesita conectarse con Moodle se demuestra en aulas de prueba y su paso a las aulas reales depende de la viabilidad.

### Imprescindibles

| Bloque | ID | Requisito |
|---|---|---|
| Base | RF-01 a RF-10 | Acceso restringido, roles, inventario, accesos directos, búsqueda, altas y cambios, ocultar sin borrar, registros y revisión periódica |
| Consulta | **RF-17** | Ver a los alumnos de cada aula y de todas a la vez |
| Consulta | **RF-19** | Control de accesos: inactivas, sin entrar y suspendidas |
| Cambios | **RF-15** | Cambios individuales: suspender o reactivar, matricular o desmatricular, cambiar el rol |
| Cambios | **RF-20** | Cambios globales: la misma operación en varias personas o aulas en una sola orden |
| Cambios | **RF-21** | Vista previa, confirmación reforzada, registro y vuelta atrás |
| No funcionales | — | WCAG 2.2 AA; teclado y lector de pantalla; el 90 % de las tareas llega a la gestión en 3 acciones y 20 s; **un cambio en 5 aulas en menos del 25 % del tiempo actual**; identificación robusta; ninguna contraseña de las aulas; **datos del alumnado sin copia permanente**; **claves por aula con lectura y escritura separadas**; **nunca más permisos que en el aula**; **normas internas de Grupo ATU**; **registro de consultas y cambios**; sin exposición pública; la caída no impide gestionar; recuperación en 1 día; **funciona con versiones distintas de Moodle** y tras actualizarlas; guía de operación y responsables |

### Convenientes

Consulta agregada (RF-11), búsqueda de cursos (RF-12), estado técnico con las funciones disponibles en cada aula (RF-13), comprobación de que las aulas responden (RF-14) y **entrada con la cuenta de Microsoft 365** (RF-16). Entre los no funcionales: valoración SUS de 70, consulta en 10 s, cambio global en las doce aulas en 2 minutos, disponibilidad del 99 % en horario laboral y mantenimiento de 8 h/mes o menos.

### Futuros condicionados

Indicadores para la responsable del DPE (RF-18) y cambios de ajustes en varias aulas (RF-22).

### Descartados

W-01 a W-07: modificar las aulas en producción durante el proyecto, unificarlas, tratar contraseñas, portal para alumnado o profesorado, reproducir toda la administración de Moodle, resolver su versión, y diseño y programación de las aulas.

## 5. Bloques y viabilidad

| Bloque | Requisitos | Qué necesita de Moodle | Para la organización |
|---|---|---|---|
| Base | RF-01 a RF-10 | Nada | Insuficiente por sí solo |
| Consulta | RF-11 a RF-13, RF-17, RF-19 | Servicios web de lectura | Parte de lo que pide |
| Cambios | RF-15, RF-20, RF-21 (RF-22) | Servicios web con escritura limitada | Lo central de lo que pide |
| Acceso único | RF-16 | Microsoft 365 activado en cada aula | Conveniente |

El estudio de viabilidad debe decir, **aula por aula**, hasta qué bloque se llega. Las funciones de Moodle candidatas están en la sección 5 del [documento 03](03-requisitos-funcionales.md#5-bloques-y-dependencia-de-la-viabilidad).

## 6. Criterios de aceptación

Los funcionales usan el formato *Dado / Cuando / Entonces* ([documento 03](03-requisitos-funcionales.md)). Los no funcionales tienen un valor y un método de comprobación ([documento 04](04-requisitos-no-funcionales.md)). **Todo lo que lea o cambie datos de un aula se prueba en aulas de prueba sin datos reales**, nunca en las reales; para los cambios globales y las versiones distintas hacen falta al menos dos.

## 7. Trazabilidad

| Comprobación | Resultado |
|---|---|
| Necesidades dentro del enfoque cubiertas | 12 de 12, incluida la nueva N-16 (gestionar alumnado y accesos con cambios globales o individuales). N-13 y N-16 dependen de la viabilidad |
| Necesidades fuera del enfoque | 4, con motivo |
| Problemas abordados | PR-09 (gestión dispersa) es el núcleo; PR-05 (cuentas por aula) y PR-10 (versiones) confirmados por la organización |
| Requisitos *Must* y *Should* con caso de prueba | 59 de 59 (20 funcionales y 39 no funcionales) |
| Requisitos sin origen | Ninguno |

## 8. Datos y supuestos principales

- **DO-04.** El DPE quiere vista global de alumnos, control de accesos y cambios globales o individuales, con viabilidad real.
- **DO-03.** Cada aula se gestiona por separado y cada persona tiene roles distintos: la plataforma no puede dar más permisos que el aula.
- **DO-05.** Moodle 4.1.18 la más actualizada; versiones distintas y cambiantes.
- **DO-06.** Perfil de prueba posible, pero solo después del plano.
- **DO-07.** Microsoft 365 y normas internas de seguridad.
- **DO-10.** Política de Seguridad (ENS) y Normas de uso: aprobación del Responsable del Sistema, análisis de riesgos, acceso personal e intransferible, mínimos datos; Grupo ATU es responsable del tratamiento y tiene DPD.
- **DO-08 y DO-09.** Documento breve y directo con dosier aparte; decide Informática con Dirección, tras la valoración del DPE.
- **SF-06.** Informática puede habilitar los servicios web. **Es la incógnita principal.**
- **SF-15.** Los datos del alumnado se consultan con la finalidad con la que ya se gestionan, sin copia permanente.
- **SF-16 y SF-17.** Interpretación de «controles de accesos» y «cambios globales», pendiente de confirmar con el DPE.

## 9. Preguntas abiertas que más cambiarían la especificación

| Pregunta | Qué cambiaría |
|---|---|
| P-C04 ¿Se pueden habilitar los servicios web, de lectura y de escritura limitada? | Si se llega a los bloques de consulta y cambios |
| P-G07 ¿Qué es exactamente «controles de accesos»? | El contenido de RF-19 |
| P-G08 ¿Qué cambios globales son los más útiles? | Las operaciones priorizadas en RF-15 y RF-20 |
| P-I01 ¿Están las aulas conectadas a Microsoft 365? | Lo fácil que es RF-16 |
| P-L01 ¿Admite Grupo ATU, como responsable del tratamiento y con su DPD, la consulta global de alumnos? | RF-17 y RNF-SEG-07 |

## 10. Decisión que se pide

1. A la tutora: ¿se valida que el núcleo pase a ser la vista de alumnos, el control de accesos y los cambios desde la plataforma, todo demostrado en aulas de prueba?
2. Al DPE: ¿son correctas las interpretaciones de «controles de accesos» y «cambios globales» (SF-16, SF-17)?
3. A Informática, con el documento ejecutivo de viabilidad (T14): ¿se podrían habilitar los servicios web y un perfil de prueba?

## 11. Comprobación de los criterios de salida de la fase

| Criterio (plan de la fase) | Estado |
|---|---|
| Cada necesidad cubierta o descartada con motivo | Cumplido |
| Cada *Must* y *Should* con criterio de aceptación y caso de prueba | Cumplido |
| Ningún requisito sin origen | Cumplido |
| Grupos de requisitos de la ficha cubiertos | Cumplido |
| Supuestos listados con su efecto | Cumplido |
| Requisitos que dependen de la viabilidad identificados | Cumplido (sección 5) |
| Requisitos aprobados por la tutora (hito) | **Pendiente** |

## 12. Control de versiones

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| 0.1 | 2026-11-03 | Claude (Redactor) | Primera versión de la especificación. [Archivada](historico/06-especificacion_v0.1.md) |
| 0.2 | 2026-11-04 | Claude (Redactor) | Especificación rehecha para el enfoque de gestión interna indicado por la tutora. [Archivada](historico/06-especificacion_v0.2.md) |
| 0.3 | 2026-11-05 | Claude (Redactor) | Respuestas de Grupo ATU: núcleo de vista de alumnos, control de accesos y cambios; cuatro bloques de viabilidad; 22 requisitos funcionales, 39 no funcionales y 47 casos de prueba. [Archivada](historico/06-especificacion_v0.3.md) |
| 0.4 | 2026-11-05 | Claude (Redactor) | Normas de seguridad de Grupo ATU (DO-10): RNF-SEG-13 concretado; P-G09 resuelta; P-L01 acotada |
