# 06 — Especificación (entregable 02)

| Campo | Valor |
|---|---|
| Versión | 0.1 |
| Fecha | 2026-11-03 |
| Estado | Revisión del propietario |
| Redacción | Claude (rol Redactor, con revisión de todos los roles), a petición del alumno |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |
| Entregable de la ficha | 02 — Especificación: requisitos priorizados, escenarios de uso, criterios de aceptación y trazabilidad |

Este documento reúne la Fase 2. El detalle está en los documentos [01](01-supuestos-de-partida.md) a [05](05-matriz-trazabilidad.md).

## 1. Resumen

- La especificación concreta el **alcance preliminar de la Fase 1** sin cambiarlo: una plataforma que permita a cualquier persona **encontrar su campus y llegar a su página de acceso** de forma clara, accesible y segura, sin tocar los campus y sin tratar datos personales ni credenciales.
- Contiene **13 escenarios de uso**, **18 requisitos funcionales** (9 imprescindibles, 5 convenientes, 4 futuros), **5 descartes expresos**, **30 requisitos no funcionales** en los cuatro grupos de la ficha y **33 casos de prueba** definidos.
- Todas las necesidades de la Fase 1 quedan cubiertas, y todos los requisitos imprescindibles y convenientes tienen criterio de aceptación y caso de prueba.
- **Limitación principal:** se ha hecho sin respuesta de la organización. Se apoya en **14 supuestos explícitos** (SF-01 a SF-14). Para cada uno se indica qué requisitos habría que revisar si resulta falso. Los valores numéricos (tiempos, disponibilidad, esfuerzo) son propuestas razonadas, no datos medidos.
- La Fase 1 se entregó a la tutora el 2026-10-30, pero no tiene validación formal. La Fase 2 se inicia por decisión del alumno (registro de seguimiento).

## 2. Alcance que se especifica

| Incluido | Excluido |
|---|---|
| Catálogo público de campus con identificación clara | Cambiar, actualizar o unificar los campus Moodle |
| Búsqueda y, si se confirma, filtros | Contraseñas o cuentas de los campus |
| Paso directo a la página de acceso de cada campus | Matrículas, usuarios o contenidos de los cursos |
| Gestión sencilla del catálogo, con registro y revisión periódica | Inicio de sesión único e integración con Moodle (futuro condicionado) |
| Ayuda y vista para el CAU | Resolver la versión de Moodle sin soporte |

## 3. Usuarios y escenarios

Siete perfiles hipotéticos de la Fase 1 (PU-01 a PU-07): alumnado de uno o varios campus, profesorado, empresas clientes, CAU, persona gestora del catálogo y administradores de los campus. Se tienen en cuenta las necesidades de acceso en todos ellos.

| Grupo | Escenarios |
|---|---|
| Encontrar y entrar | ES-01 conociendo la marca · ES-02 sin conocerla · ES-03 distinguir campus con el mismo título · ES-04 desde el móvil · ES-12 con lector de pantalla o teclado |
| Orientar a otros | ES-05 alumno de varios campus · ES-06 compartir el enlace de un campus · ES-07 empresa cliente · ES-08 atención en el CAU |
| Mantener | ES-09 alta · ES-10 cambio, mantenimiento o retirada · ES-11 enlace roto · ES-13 caída de la plataforma |

## 4. Requisitos priorizados

Método **MoSCoW**, el mismo que en el alcance preliminar.

### Imprescindibles (prototipo)

| ID | Requisito |
|---|---|
| RF-01 | Mostrar el catálogo de campus activos, sin identificarse |
| RF-02 | Identificar cada campus sin ambigüedad (marca, nombre propio, logotipo, dominio, idioma) |
| RF-03 | Buscar por texto, sin distinguir mayúsculas ni tildes |
| RF-04 | Ir a la página de acceso del campus avisando de que se sale y a qué dominio |
| RF-05 | Orientar cuando no hay resultados |
| RF-06 | Dar de alta y modificar campus, solo con dominios permitidos y HTTPS |
| RF-07 | Ocultar o retirar sin borrar |
| RF-08 | Registrar cada cambio y poder deshacerlo |
| RF-09 | Avisar de campus sin revisar en 90 días |
| No funcionales | WCAG 2.2 AA; adaptación desde 320 px; teclado y lector de pantalla; 80 % de usuarios de prueba encuentran su campus sin ayuda en menos de 1 minuto; sin datos personales, credenciales, cookies no técnicas ni rastreadores; solo HTTPS; carga en móvil ≤ 2,5 s; la caída de la plataforma no impide entrar en los campus; recuperación en 1 día laborable; alta de un campus por una persona no técnica en ≤ 15 min; guía de operación; copias y versiones; responsable designado |

### Convenientes (planificados)

Filtros por marca y área (RF-10), comprobación periódica de enlaces no intrusiva (RF-11), página de ayuda (RF-12), vista para el CAU (RF-13), enlace estable por campus (RF-14), lenguaje claro, consistencia, identidad de marca, doble revisión de cambios de dirección, cabeceras de seguridad, prueba de carga, disponibilidad del 99,5 % y esfuerzo de mantenimiento de 2 h/mes o menos.

### Futuros condicionados

«Mis campus» (RF-15), inicio de sesión único (RF-16), datos obtenidos de Moodle (RF-17) y analítica mínima (RF-18). Cada uno tiene su condición previa en el [documento 03](03-requisitos-funcionales.md#rf-15-a-rf-18-futuros-condicionados-c).

### Descartados

Modificar los campus, unificarlos, tratar contraseñas, gestionar matrículas o contenidos y resolver la versión de Moodle (W-01 a W-05).

## 5. Criterios de aceptación

Los funcionales usan el formato *Dado / Cuando / Entonces* ([documento 03](03-requisitos-funcionales.md)). Los no funcionales tienen un valor y un método de comprobación ([documento 04](04-requisitos-no-funcionales.md)). Las comprobaciones siguen las formas que indica la ficha para cada grupo: casos de prueba, revisión heurística y pruebas con tareas, análisis de riesgos y pruebas autorizadas, métricas y procedimiento de operación.

## 6. Trazabilidad

La [matriz](05-matriz-trazabilidad.md) enlaza necesidad → escenario → requisito → caso de prueba, y también problema → requisito y supuesto → requisitos afectados.

| Comprobación | Resultado |
|---|---|
| Necesidades cubiertas | 10 de 10. N-04 (ver todos «sus» campus) solo con requisitos futuros, porque depende de una identidad común que no consta |
| Problemas abordados | 8 de 8. PR-04 y PR-06 solo se señalan; corregirlos está fuera del alcance |
| Requisitos *Must* y *Should* con caso de prueba | 44 de 44 |
| Requisitos sin origen | Ninguno |

## 7. Supuestos principales

Los que más pesan en la especificación (lista completa en el [documento 01](01-supuestos-de-partida.md)):

- **SF-01.** El problema es encontrar el campus, no gestionar contenidos.
- **SF-02.** No hay una identidad común entre campus.
- **SF-03.** El catálogo puede ser público.
- **SF-05.** Alguien de la organización mantendrá el catálogo. Si no hay nadie, ninguna opción es sostenible.
- **SF-10.** La primera versión no se integra con Moodle.

## 8. Preguntas abiertas que más cambiarían la especificación

| Pregunta | Qué cambiaría |
|---|---|
| P-U04 ¿Hay incidencias por no encontrar el campus? | Confirmaría o no el problema y daría la línea base de RNF-UX-03 |
| P-O04 ¿Quién mantendría el catálogo? | Viabilidad de todos los requisitos de mantenimiento |
| P-N01 / P-N02 ¿Solo acceso o también datos e inicio de sesión único? | Prioridad de RF-15 a RF-17 |
| P-O05 ¿Hay marcas que no deban aparecer juntas? | Segmentación del catálogo |
| P-I01 ¿Existe un directorio de usuarios común? | Viabilidad de RF-15 y RF-16 |

## 9. Decisión que se pide a la tutora

1. ¿Considera adecuado avanzar con la especificación sobre supuestos explícitos mientras no haya respuesta de la organización?
2. ¿Están bien elegidos los requisitos imprescindibles para el prototipo (RF-01 a RF-09 y los no funcionales marcados como imprescindibles)?
3. ¿Le parecen razonables los valores propuestos (80 % de éxito sin ayuda en menos de 1 minuto, carga ≤ 2,5 s, recuperación en 1 día, alta en ≤ 15 min)?

## 10. Comprobación de los criterios de salida de la fase

| Criterio (plan de la fase) | Estado |
|---|---|
| Cada necesidad cubierta o descartada con motivo | Cumplido |
| Cada *Must* y *Should* con criterio de aceptación y caso de prueba | Cumplido |
| Ningún requisito sin origen | Cumplido |
| Cinco grupos de requisitos de la ficha cubiertos | Cumplido |
| Supuestos listados con su efecto | Cumplido |
| Requisitos aprobados por la tutora (hito) | **Pendiente** |

## 11. Control de versiones

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| 0.1 | 2026-11-03 | Claude (Redactor) | Primera versión de la especificación |
