# Registro de cambios de la Fase 2

Todas las modificaciones de la documentación de la Fase 2 se anotan aquí, de la más reciente a la más antigua. Las versiones anteriores de cada documento se conservan en [`historico/`](historico/README.md) y en el historial de Git.

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
