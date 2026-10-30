# 06 — Registro de riesgos inicial

| Campo | Valor |
|---|---|
| Versión | 0.1 |
| Fecha | 2026-10-30 |
| Estado | Revisión del propietario |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |
| Redacción | Claude (roles Seguridad y Project Manager), a petición del alumno |

Registro inicial de la Fase 1. Se ampliará en la Fase 5 (viabilidad), donde la ficha pide un plan de riesgos completo.

**Escala.** Probabilidad (P) e impacto (I) de 1 (bajo) a 3 (alto). Nivel = P × I: 1–2 bajo, 3–4 medio, 6–9 alto. Las valoraciones son estimaciones del equipo **[S]**, no mediciones.

## 1. Riesgos del proyecto (afectan al expediente y a su evaluación)

| ID | Riesgo | Causa | Consecuencia | P | I | Nivel | Respuesta propuesta | Dueño |
|---|---|---|---|---|---|---|---|---|
| RP-01 | Diagnosticar un problema que no está demostrado | Solo información pública; sin datos del CAU ni usuarios (PR-07) | La recomendación final se apoya en supuestos; penaliza «Comprensión y alcance» | 3 | 3 | **Alto** | Declarar la laguna en el diagnóstico; pedir al tutor al menos datos agregados del CAU; prever una prueba con usuarios en la Fase 7 | Alumno |
| RP-02 | Presentar indicios como hechos | Muchos datos se deducen (versión, operador común) | «Causa de revisión» según la ficha | 2 | 3 | Alto | Etiquetado [H]/[O]/[S] en todos los documentos; revisión de calidad antes del hito (T10) | Redactor |
| RP-03 | Avanzar sin validación del tutor | Tutor sin identificar | Retrabajo si el tutor cambia el enfoque | 2 | 2 | Medio | No pasar de la Fase 1 sin visto bueno (ya acordado) | Alumno |
| RP-04 | Inventario incompleto | Entorno 7 no observado; posibles campus fuera de la lista (P-O07) | Catálogo y alcance mal dimensionados | 2 | 2 | Medio | Observación manual (P-V05); pregunta a la organización | Alumno |
| RP-05 | Ampliar el alcance hacia SSO o integraciones antes de tiempo | Atractivo técnico; expectativa no confirmada (P-N02) | Más coste y riesgo sin necesidad probada | 2 | 3 | Alto | Alcance preliminar mínimo; cualquier ampliación pasa por el registro de cambios de alcance | Coordinador |
| RP-06 | Dependencia de una sola persona | Proyecto individual | La ficha valora que otro pueda continuar el trabajo | 2 | 2 | Medio | Documentación en el repositorio, índice, changelog e histórico | Alumno |

## 2. Riesgos de la futura plataforma (a tener en cuenta desde ya)

| ID | Riesgo | Causa | Consecuencia | P | I | Nivel | Respuesta propuesta |
|---|---|---|---|---|---|---|---|
| RS-01 | Catálogo desactualizado | No hay responsable ni procedimiento (PG-08) | Enlaces rotos; los usuarios dejan de confiar | 3 | 2 | **Alto** | Responsable designado, fecha de última revisión visible y comprobación periódica de enlaces |
| RS-02 | Enlaces manipulados o maliciosos | Alta de URL sin control | Envío a páginas de suplantación (*phishing*) que imitan un campus | 1 | 3 | Medio | Lista de dominios permitidos, revisión de cambios por una segunda persona |
| RS-03 | Tratar datos personales sin necesidad | Añadir cuentas, analítica o personalización | Obligaciones RGPD/LOPDGDD y riesgo de brecha | 2 | 3 | Alto | Minimización: primera versión sin datos personales si es posible |
| RS-04 | Recoger o reenviar credenciales de los campus | Diseño de «acceso único» mal planteado | Riesgo grave de seguridad | 1 | 3 | Medio | Prohibido por diseño: la plataforma nunca pide contraseñas de los campus |
| RS-05 | Dar sensación de sesión compartida cuando no la hay | Diseño de interfaz | Confusión y desconfianza | 2 | 2 | Medio | Indicar claramente que se sale a otro sitio (prompt inicial, sección 11) |
| RS-06 | Integrar con un Moodle sin soporte de seguridad | Indicio de Moodle 4.1 (H-04) | Funciones de API limitadas; heredar riesgos de una plataforma desactualizada | 2 | 3 | Alto | Confirmar versión (P-C01); evitar dependencias de API en la primera versión; trasladar el indicio a la organización con discreción |
| RS-07 | Exponer juntas marcas que no deben aparecer juntas | Relación entre marcas desconocida (P-O05) | Conflicto comercial o de imagen | 2 | 2 | Medio | Confirmar antes del diseño; prever catálogo segmentado |
| RS-08 | Incumplir requisitos de accesibilidad | Normativa aplicable sin confirmar (P-L04) | Exclusión de usuarios; posible incumplimiento | 2 | 2 | Medio | WCAG 2.2 AA como referencia; revisión en la Fase 7 |
| RS-09 | Nadie mantiene la plataforma tras el proyecto | Sin responsable ni presupuesto conocidos | Abandono y obsolescencia | 2 | 3 | Alto | Elegir en la Fase 3 la opción de menor mantenimiento que cumpla los requisitos |

## 3. Observaciones de seguridad en los campus (fuera del alcance)

Estas observaciones no son riesgos del proyecto, pero conviene comunicarlas a la organización por el canal adecuado y con discreción. **No se ha hecho ninguna prueba**; solo se ha leído la página pública.

| ID | Observación | Base | Recomendación |
|---|---|---|---|
| OS-01 | Indicio de Moodle 4.1, sin soporte de seguridad desde el 08-12-2025 | H-04, F-15 | Que el administrador confirme la versión y valore actualizar |
| OS-02 | Registro abierto en el entorno 4 | H-02 | Confirmar si es intencionado |

## 4. Control de versiones

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| 0.1 | 2026-10-30 | Claude (Seguridad / Project Manager) | Primera versión: 6 riesgos del proyecto, 9 de la futura plataforma y 2 observaciones sobre los campus |
