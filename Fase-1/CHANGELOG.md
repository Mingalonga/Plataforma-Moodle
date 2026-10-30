# Registro de cambios de la Fase 1

Todas las modificaciones de la documentación de la Fase 1 se anotan aquí, de la más reciente a la más antigua. Las versiones anteriores de cada documento se conservan en [`historico/`](historico/README.md) y en el historial de Git.

Formato de cada entrada: fecha, versión del paquete de la fase, documentos afectados, qué cambia y por qué.

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
