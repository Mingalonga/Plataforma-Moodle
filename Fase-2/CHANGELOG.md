# Registro de cambios de la Fase 2

Todas las modificaciones de la documentación de la Fase 2 se anotan aquí, de la más reciente a la más antigua. Las versiones anteriores de cada documento se conservan en [`historico/`](historico/README.md) y en el historial de Git.

## [0.3.1] — 2026-11-05

**Motivo:** el alumno pide «los planos» (T14), tal como los describió Grupo ATU: un documento breve y directo y un dosier de respaldo independiente.

### Añadido
- `planos/Planos_Documento-ejecutivo_Plataforma-Moodle_v1.pdf` (3 páginas): habitaciones, funcionamiento, viabilidad preliminar con cuatro condiciones, opciones por niveles A a D, riesgos, esfuerzo orientativo y decisión que se pide al DPE, a Informática y a Dirección.
- `planos/Planos_Dosier-respaldo_Plataforma-Moodle_v1.pdf` (10 páginas): contexto, alcance, escenarios, requisitos, viabilidad técnica (funciones de Moodle por requisito, configuración por aula, decisión de permisos, versiones, pruebas V-01 a V-08), arquitectura conceptual, seguridad, pruebas, implantación por etapas, riesgos, alternativas y preguntas.
- `planos/Guia-alumno_Planos_Plataforma-Moodle_v1.pdf` (uso interno): explicación completa para el alumno.
- Fuentes Typst con un estilo común (`planos/estilo.typ`).

### Cambiado
- `00-plan-fase-2.md`: T14 hecha (sin cambio de versión).

## [0.3] — 2026-11-05

**Motivo:** respuestas de Grupo ATU (Departamento de Pedagogía y e-learning e Informática) a las nueve preguntas. Lo esencial (pregunta 4): el DPE quiere **ver a los alumnos de forma global y por aula, controlar accesos y hacer cambios globales o individuales**, con un **estudio de viabilidad real**, más allá de los hipervínculos. Informática pide un documento **breve y directo** con un **dosier de respaldo independiente**. Se conservan los identificadores de la v0.2; las versiones 0.2 se archivan en `historico/`.

### Cambiado
- `00-plan-fase-2.md` v0.3: condiciones de partida, tareas T13 a T15 (T14: documento ejecutivo de viabilidad y dosier, propuesto), N-16 en los criterios de salida, riesgos RP-11 y RP-12.
- `01-supuestos-de-partida.md` v0.3: datos DO-01 a DO-09; supuestos confirmados o corregidos; SF-12 descartado; nuevos SF-15 a SF-18.
- `02-usuarios-escenarios.md` v0.3: ES-03 cambia; nuevos ES-14 a ES-18 (vista global de alumnos, control de accesos, cambios individuales y globales, cuenta corporativa).
- `03-requisitos-funcionales.md` v0.3: RF-15 y RF-17 suben a *Must*, RF-16 a *Should*; nuevos RF-19 (control de accesos), RF-20 (cambios globales), RF-21 (vista previa, confirmación, registro y vuelta atrás) y RF-22 (*Could*); W-07; cuatro bloques de viabilidad y funciones de Moodle candidatas. 22 requisitos (15 *Must*, 5 *Should*, 2 *Could*).
- `04-requisitos-no-funcionales.md` v0.3: 39 requisitos; revisados SEG-06, SEG-07, SEG-08, REN-07, MAN-06 y MAN-08; nuevos UX-09, SEG-12 (nunca más permisos que en el aula), SEG-13 (normas internas), REN-08 y MAN-09 (versiones distintas de Moodle).
- `05-matriz-trazabilidad.md` v0.3: necesidad N-16; 47 casos de prueba.
- `06-especificacion.md` v0.3.
- `entregas/`: resumen para la tutora v3 y guía del alumno v3. Los v2 se archivan.
- Fase 1: `01-registro-preguntas-supuestos.md` v0.10 con las respuestas.

## [0.2.1] — 2026-11-04

### Cambiado
- `entregas/Preguntas_Grupo-ATU_Plataforma-Moodle_v3.pdf`: a petición del alumno, solo aparecen las preguntas agrupadas por departamento. Se quitan la introducción, la nota de cada pregunta y el párrafo final. Las preguntas no cambian. La v2 se archiva.

## [0.2] — 2026-11-04

**Motivo:** respuesta de la tutora. El proyecto se orienta a la **gestión interna** de las aulas: una herramienta para que el Departamento de Pedagogía y e-learning (DPE) gestione las doce aulas desde un único punto, sin entrar y salir de cada una. El alumnado ya entra en su curso con una URL. Implementa Informática; antes, estudio de viabilidad. Toda la fase se rehace; las versiones 0.1 se archivan en `historico/`.

### Cambiado
- `00-plan-fase-2.md` v0.2: condiciones de partida, nueva numeración, tareas T11 y T12, criterios de salida y RP-10.
- `01-supuestos-de-partida.md` v0.2: 6 datos de la tutora (DT-01 a DT-06) y 14 supuestos nuevos.
- `02-usuarios-escenarios.md` v0.2: perfiles de gestión (PU-08, PU-09, PU-10 y PU-05) y 13 escenarios nuevos; 4 descartados.
- `03-requisitos-funcionales.md` v0.2: 18 requisitos (10 *Must*, 4 *Should*, 4 *Could*), 6 descartes, dependencia de la viabilidad y correspondencia con la v0.1.
- `04-requisitos-no-funcionales.md` v0.2: 34 requisitos; la seguridad pasa a centrarse en autenticación, permisos y claves de servicio.
- `05-matriz-trazabilidad.md` v0.2: 11 necesidades dentro del enfoque y 4 fuera con motivo; 36 casos de prueba; regla del aula de pruebas.
- `06-especificacion.md` v0.2: especificación rehecha.
- `entregas/`: resumen para la tutora v2 (4 páginas), guía del alumno v2 (con qué ha cambiado y por qué) y preguntas para Grupo ATU v2 (de 16 a 9). Los PDF y fuentes v1 se archivan.

## [0.1.2] — 2026-11-03

### Añadido
- `entregas/Preguntas_Grupo-ATU_Plataforma-Moodle_v1.pdf` y su fuente Typst: 16 preguntas para la organización, seleccionadas del registro de la Fase 1 (P-O03 a P-O07, P-U02 a P-U06, P-N01 a P-N03, P-C01 a P-C07, P-I01, P-R01 a P-R03, P-L02 a P-L04) por ser las que más condicionan los supuestos de la Fase 2 y las fases 3 a 5. Cada una indica para qué sirve.

## [0.1.1] — 2026-11-03

### Añadido
- `entregas/Resumen_Fase-2_Plataforma-Moodle_v1.pdf` y su fuente Typst: resumen de 3 páginas más portada para la tutora, con la misma maquetación que el de la Fase 1.
- `entregas/Guia-alumno_Fase-2_Plataforma-Moodle_v1.pdf` y su fuente Typst: explicación detallada para el alumno (conceptos, supuestos, escenarios, requisitos, origen de cada valor, decisiones tomadas y preguntas previsibles).

### Corregido
- `04-requisitos-no-funcionales.md`: el 99,5 % mensual equivale a unas 3,6 h de caída, no 3,5 h (sin cambio de versión).

### Cómo regenerar los PDF
`pip install typst` y, desde `Fase-2/entregas/`, `python3 -c "import typst; typst.compile('resumen-fase-2-tutora.typ', output='Resumen_Fase-2_Plataforma-Moodle_v1.pdf')"` (igual con la guía). Usa la fuente Carlito.

## [0.1] — 2026-11-03

**Estado:** primer borrador completo de la Fase 2.

### Añadido
- `00-plan-fase-2.md`: objetivo, condiciones de partida, método (MoSCoW, *Dado / Cuando / Entonces*), tareas, criterios de salida y riesgos RP-07 a RP-09.
- `01-supuestos-de-partida.md`: 14 supuestos (SF-01 a SF-14) que sustituyen provisionalmente a las respuestas de la organización, con su efecto si resultan falsos.
- `02-usuarios-escenarios.md`: 7 perfiles de la Fase 1, 13 escenarios de uso y 3 escenarios descartados.
- `03-requisitos-funcionales.md`: 18 requisitos (9 *Must*, 5 *Should*, 4 *Could*) con criterios de aceptación y 5 descartes (W-01 a W-05).
- `04-requisitos-no-funcionales.md`: 30 requisitos en los grupos de la ficha (usabilidad y accesibilidad, seguridad y privacidad, rendimiento y disponibilidad, mantenimiento).
- `05-matriz-trazabilidad.md`: trazabilidad necesidad → escenario → requisito → prueba, problema → requisito, supuesto → requisitos, y 33 casos de prueba.
- `06-especificacion.md`: entregable 02.
- `README.md`, `registro-seguimiento.md`, `historico/README.md`.
