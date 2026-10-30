# Registro de cambios de la Fase 1

Todas las modificaciones de la documentación de la Fase 1 se anotan aquí, de la más reciente a la más antigua. Las versiones anteriores de cada documento se conservan en [`historico/`](historico/README.md) y en el historial de Git.

Formato de cada entrada: fecha, versión del paquete de la fase, documentos afectados, qué cambia y por qué.

## [0.7.2] — 2026-10-30

### Cambiado
- Resumen para la tutora v4 → v5: nuevo apartado 10, «Antes de iniciar la Fase 2», con la información de la organización que reforzaría los requisitos (contacto y datos agregados del servicio de atención). El glosario pasa a ser el último apartado. Sigue en 4 páginas más portada. El v4 se archiva.

## [0.7.1] — 2026-10-30

### Cambiado
- Resumen para la tutora v3 → v4: mismo contenido, maquetado con Typst (herramienta de composición tipográfica) para un resultado más sobrio y legible, sin espacios ni saltos de página irregulares. Pasa de 6 a 4 páginas más portada. La fuente editable es ahora `entregas/resumen-fase-1-tutora.typ`; el v3 (PDF y HTML) se archiva.

### Cómo regenerar el PDF
`pip install typst` y después `python3 -c "import typst; typst.compile('resumen-fase-1-tutora.typ', output='Resumen_Fase-1_Plataforma-Moodle_v4.pdf')"` desde `Fase-1/entregas/`, o `typst compile resumen-fase-1-tutora.typ` si está instalada la herramienta de línea de comandos. Usa la fuente Carlito.

## [0.7] — 2026-10-30

**Estado:** borrador completo de la Fase 1 y resumen v3 para la tutora.

### Añadido
- `evidencias/E-06` a `E-10`: logotipos de los entornos 8, 10, 11, 12 y 4, capturados por el alumno. Se recortaron las pestañas y la barra del navegador para no guardar información privada.
- Hallazgo H-08 (páginas de acceso con inglés y español mezclados) y pregunta P-V11.

### Cambiado
- `03-inventario-campus.md` v0.3 → v0.4: marcas verificadas. Correcciones: el entorno 12 es «Estudi@ Formación Profesional» (antes «Studia»); el 10 se presenta como sociedad cooperativa; en el 4, «Index Business Intelligent» aparece en el logotipo como submarca de ATU.
- `01-registro-preguntas-supuestos.md` v0.6 → v0.7, `02-fuentes-y-metodologia.md` v0.4 → v0.5 y `04-mapa-actores-perfiles.md` v0.2 → v0.3.
- Resumen para la tutora v2 → v3 con las marcas verificadas; v2 archivado.

## [0.6.1] — 2026-10-30

**Estado:** resumen para la tutora revisado por el alumno; corrección en el inventario.

### Cambiado
- Resumen para la tutora v1 → v2 (`entregas/Resumen_Fase-1_Plataforma-Moodle_v2.pdf`, 6 páginas): tono más sobrio, se eliminan la sección sobre las ocho fases y las explicaciones pensadas para el alumno, se añade «marca» al glosario y una nota sobre el aula 4. El v1 se archiva en `historico/`.
- `03-inventario-campus.md` v0.2 → v0.3: se aclara de dónde sale la «marca aparente» de cada aula y se corrige el entorno 4: «Index» es una deducción a partir de la dirección y del nombre del archivo del logotipo, no un nombre de marca observado.
- `01-registro-preguntas-supuestos.md` v0.5 → v0.6 y `04-mapa-actores-perfiles.md` v0.1 → v0.2: «Index» retirado de la lista de marcas.

### Motivo
Revisión del alumno: el resumen debe dirigirse solo a la tutora, y el alumno preguntó de dónde salía «aula Index».

## [0.6] — 2026-10-30

**Estado:** documentación de la Fase 1 sin cambios de contenido; se añade el resumen para la tutora.

### Añadido
- `entregas/Resumen_Fase-1_Plataforma-Moodle_v1.pdf`: resumen de 8 páginas en lenguaje no técnico, basado en el paquete 0.5, con los pasos dados en la fase y una explicación de por qué existe el repositorio.
- `entregas/resumen-fase-1-tutora.html`: fuente editable del PDF.

### Motivo
La tutora es pedagoga. El alumno prefiere entregarle un PDF breve en lugar de la carpeta de documentos técnicos, que siguen siendo la referencia completa.

## [0.5] — 2026-10-30

**Estado:** borrador completo de la Fase 1, pendiente de revisión del alumno y del tutor. Todas las observaciones públicas previstas están hechas.

### Añadido
- `evidencias/E-02` a `E-05`: capturas de la web corporativa tomadas por el alumno (área 01, formulario y pie, menú de áreas formativas, menú de formación para trabajadores).
- Versiones archivadas: registro v0.4, metodología v0.3, situación actual v0.1, alcance v0.1 y diagnóstico v0.2.

### Cambiado
- `05-situacion-actual.md` v0.1 → v0.2: la web corporativa no enlaza a los campus; PR-01 pasa a observado y se añade PR-08 (áreas temáticas frente a campus por marcas).
- `01-registro-preguntas-supuestos.md` v0.4 → v0.5: P-V07 resuelta en parte; nuevas P-V09 y P-V10.
- `02-fuentes-y-metodologia.md` v0.3 → v0.4: fuente F-18.
- `07-alcance-preliminar.md` v0.1 → v0.2 y `08-diagnostico-inicial.md` v0.2 → v0.3.

### Incidencias
- Un navegador sin interfaz lanzado desde el entorno de trabajo tampoco pudo abrir la web corporativa (bloqueo de la política de red).

## [0.4] — 2026-10-30

**Estado:** borrador completo de la Fase 1, pendiente de revisión del alumno y del tutor.

### Añadido
- `evidencias/E-01_campus07_pagina-acceso_2026-10-30.png`: captura de la página de acceso del entorno 7, tomada por el alumno.
- Versiones archivadas: plan v0.3, registro v0.3, inventario v0.1 y diagnóstico v0.1.

### Cambiado
- `03-inventario-campus.md` v0.1 → v0.2: ficha del entorno 7 y hallazgo H-05 reescrito.
- `01-registro-preguntas-supuestos.md` v0.3 → v0.4: P-V05 resuelta; S-03 actualizado.
- `02-fuentes-y-metodologia.md` v0.2 → v0.3: fuente F-17 y observación manual como método.
- `00-plan-fase-1.md` v0.3 → v0.4 y `08-diagnostico-inicial.md` v0.1 → v0.2.

### Motivo
El alumno observó el entorno 7 en su navegador y aportó la captura.

## [0.3] — 2026-10-30

**Estado:** borrador completo de la Fase 1, pendiente de revisión del alumno y del tutor.

### Añadido
- `04-mapa-actores-perfiles.md` v0.1: 12 actores, matriz de influencia e interés y 7 perfiles hipotéticos.
- `05-situacion-actual.md` v0.1: situación actual, 10 necesidades (N-01 a N-10), 7 problemas (PR-01 a PR-07) y guion de entrevista.
- `06-registro-riesgos.md` v0.1: 6 riesgos del proyecto, 9 de la futura plataforma y 2 observaciones de seguridad sobre los campus.
- `07-alcance-preliminar.md` v0.1: problema, objetivo, alcance MoSCoW (AL-01 a AL-14), alternativas para la Fase 3 y preguntas al tutor.
- `08-diagnostico-inicial.md` v0.1: entregable 01, con respuesta a las diez preguntas guía y comprobación de criterios de salida.
- Versiones archivadas: plan v0.2, registro v0.2 y metodología v0.1.

### Cambiado
- `00-plan-fase-1.md` v0.2 → v0.3: tareas T5 a T9 hechas.
- `01-registro-preguntas-supuestos.md` v0.2 → v0.3: P-V07 (web corporativa) y P-V08 (`noindex`).
- `02-fuentes-y-metodologia.md` v0.1 → v0.2: fuente F-16.

### Incidencias
- La web corporativa se genera con JavaScript y no se pudo leer completa; queda para revisión manual (P-V07).

## [0.2] — 2026-10-30

**Estado:** borrador para revisión del alumno.

### Añadido
- `02-fuentes-y-metodologia.md` v0.1: autorización, qué se hizo y qué no, herramientas, criterio de clasificación, esquema de ficha de observación y registro de fuentes.
- `03-inventario-campus.md` v0.1: matriz de los doce entornos, rasgos comunes, siete hallazgos (H-01 a H-07) y once fichas individuales más la del entorno 7 pendiente.
- `historico/00-plan-fase-1_v0.1.md` y `historico/01-registro-preguntas-supuestos_v0.1.md`.

### Cambiado
- `00-plan-fase-1.md` v0.1 → v0.2: nombre del alumno, P-A01, P-A04 y P-A05 resueltas, T3 y T4 hechas.
- `01-registro-preguntas-supuestos.md` v0.1 → v0.2: respuestas del alumno, PG-02 actualizada con la observación, seis preguntas nuevas (P-V01 a P-V06), supuestos actualizados y dos nuevos (S-08, S-09).
- `README.md` de la fase, `registro-seguimiento.md` e `historico/README.md`.

### Motivo
El alumno indicó su nombre, dejó el tutor en blanco, decidió trabajar solo con información pública y autorizó la observación pasiva.

### Incidencias
- `curl` desde el entorno de trabajo quedó bloqueado por la política de red; se usó la herramienta de lectura web.
- El entorno 7 rechaza la lectura automatizada (`robots.txt`); queda pendiente de observación manual.

## [0.1] — 2026-10-30

**Estado:** borrador para revisión del propietario del proyecto (todavía no presentado al tutor).

### Añadido
- `README.md` (raíz del repositorio): descripción del proyecto y estado de las fases.
- `Fase-1/README.md`: índice de la fase, estado de cada entregable y convención de versiones.
- `Fase-1/00-plan-fase-1.md` v0.1: objetivo, alcance, tareas, roles, dependencias, entregables y criterios de salida de la fase.
- `Fase-1/01-registro-preguntas-supuestos.md` v0.1: las diez preguntas guía de la ficha con respuesta provisional, preguntas adicionales, supuestos y dependencias.
- `Fase-1/registro-seguimiento.md`: tabla de seguimiento de hitos con el formato de la ficha.
- `Fase-1/historico/`: carpeta para conservar versiones superadas.

### Motivo
Arranque de la Fase 1. Se presenta primero el plan y las preguntas abiertas para acordar el método antes de redactar el resto de documentos.
