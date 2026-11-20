# 06 — Registro de riesgos inicial

| Campo | Valor |
|---|---|
| Versión | 0.2 |
| Fecha | 2026-11-04 |
| Estado | Revisión del propietario |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |
| Redacción | Claude (roles Seguridad y Project Manager), a petición del alumno |

Registro inicial de la Fase 1. Se ampliará en la Fase 5 (viabilidad), donde la ficha pide un plan de riesgos completo.

> **v0.2 (2026-11-04).** La tutora orienta la plataforma a la **gestión interna** de las aulas por parte del Departamento de Pedagogía y e-learning, con implementación de Informática. Una herramienta que da acceso a la gestión de doce aulas concentra permisos elevados y datos personales, así que **los riesgos de seguridad y privacidad suben**. Se añaden RP-10, RP-11, RS-10, RS-11 y RS-12, y se anota el cambio en los riesgos existentes. Los riesgos RP-07 a RP-09 están en el [plan de la Fase 2](../Fase-2/00-plan-fase-2.md#7-riesgos-propios-de-esta-fase).

**Escala.** Probabilidad (P) e impacto (I) de 1 (bajo) a 3 (alto). Nivel = P × I: 1–2 bajo, 3–4 medio, 6–9 alto. Las valoraciones son estimaciones del equipo **[S]**, no mediciones.

## 1. Riesgos del proyecto (afectan al expediente y a su evaluación)

| ID | Riesgo | Causa | Consecuencia | P | I | Nivel | Respuesta propuesta | Dueño |
|---|---|---|---|---|---|---|---|---|
| RP-01 | Diagnosticar un problema que no está demostrado | Solo información pública; sin datos del CAU ni usuarios (PR-07) | La recomendación final se apoya en supuestos; penaliza «Comprensión y alcance» | 3 | 3 | **Alto** | Declarar la laguna en el diagnóstico; pedir al tutor al menos datos agregados del CAU; prever una prueba con usuarios en la Fase 7 | Alumno |
| RP-02 | Presentar indicios como hechos | Muchos datos se deducen (versión, operador común) | «Causa de revisión» según la ficha | 2 | 3 | Alto | Etiquetado [H]/[O]/[S] en todos los documentos; revisión de calidad antes del hito (T10) | Redactor |
| RP-03 | Avanzar sin validación del tutor | Tutor sin identificar | Retrabajo si el tutor cambia el enfoque | 2 | 2 | Medio | No pasar de la Fase 1 sin visto bueno (ya acordado). **v0.2: materializado** (2026-11-04): la tutora reorienta el enfoque después de iniciada la Fase 2. Respuesta: nueva versión de los documentos afectados, conservando las anteriores (RP-10) | Alumno |
| RP-04 | Inventario incompleto | Entorno 7 no observado; posibles campus fuera de la lista (P-O07) | Catálogo y alcance mal dimensionados | 2 | 2 | Medio | Observación manual (P-V05); pregunta a la organización | Alumno |
| RP-05 | Ampliar el alcance hacia SSO o integraciones antes de tiempo | Atractivo técnico; expectativa no confirmada (P-N02) | Más coste y riesgo sin necesidad probada | 2 | 3 | Alto | Alcance preliminar mínimo; cualquier ampliación pasa por el registro de cambios de alcance. **v0.2:** la integración entra en el enfoque, pero condicionada: primero accesos directos, después consulta de datos y, al final, acciones; cada paso, solo si la viabilidad lo permite | Coordinador |
| RP-06 | Dependencia de una sola persona | Proyecto individual | La ficha valora que otro pueda continuar el trabajo | 2 | 2 | Medio | Documentación en el repositorio, índice, changelog e histórico | Alumno |
| RP-10 | Interpretar mal un enfoque indicado de forma general | La respuesta de la tutora es breve y deja puntos abiertos (grado de integración, entorno de pruebas) | Requisitos que no responden a lo que se espera | 2 | 3 | **Alto** | Escribir la interpretación como supuesto, enseñarla a la tutora y preguntar lo que no está claro (P-T01, P-G04) | Alumno |
| RP-11 | Que el estudio de viabilidad concluya que no es viable | Versión de Moodle sin soporte, falta de servicios web o de recursos de Informática | El prototipo no se puede conectar con aulas reales | 2 | 2 | Medio | Es un resultado válido según la ficha. Prever un prototipo sobre un aula de pruebas propia y una alternativa sin integración | Alumno |

## 2. Riesgos de la futura plataforma (a tener en cuenta desde ya)

| ID | Riesgo | Causa | Consecuencia | P | I | Nivel | Respuesta propuesta |
|---|---|---|---|---|---|---|---|
| RS-01 | Catálogo desactualizado | No hay responsable ni procedimiento (PG-08) | Enlaces rotos; los usuarios dejan de confiar | 3 | 2 | **Alto** | Responsable designado, fecha de última revisión visible y comprobación periódica de enlaces |
| RS-02 | Enlaces manipulados o maliciosos | Alta de URL sin control | Envío a páginas de suplantación (*phishing*) que imitan un campus | 1 | 3 | Medio | Lista de dominios permitidos, revisión de cambios por una segunda persona |
| RS-03 | Tratar datos personales sin necesidad | Añadir cuentas, analítica o personalización. **v0.2:** consultar matrículas o usuarios del alumnado desde la plataforma | Obligaciones RGPD/LOPDGDD y riesgo de brecha | 3 | 3 | **Alto** | Minimización: mostrar datos agregados por defecto; datos de personas concretas solo si el DPE lo justifica y con permiso; registro de accesos |
| RS-04 | Recoger o reenviar credenciales de los campus | Diseño de «acceso único» mal planteado. **v0.2:** la tentación de guardar las contraseñas de administración de cada aula para «entrar directamente» | Riesgo grave de seguridad | 2 | 3 | **Alto** | Prohibido por diseño: la plataforma nunca guarda contraseñas personales de las aulas. Si hay integración, se usan claves de servicio custodiadas por Informática (RS-10) |
| RS-05 | Dar sensación de sesión compartida cuando no la hay | Diseño de interfaz | Confusión y desconfianza | 2 | 2 | Medio | Indicar claramente que se sale a otro sitio (prompt inicial, sección 11). v0.2: se mantiene para el personal (debe saber en qué aula está actuando) |
| RS-06 | Integrar con un Moodle sin soporte de seguridad | Indicio de Moodle 4.1 (H-04) | Funciones de API limitadas; heredar riesgos de una plataforma desactualizada. **v0.2:** con el enfoque de gestión, la integración es más probable y el riesgo sube | 3 | 3 | **Alto** | Confirmar versión (P-C01); evitar dependencias de API en la primera versión; trasladar el indicio a la organización con discreción |
| RS-07 | Exponer juntas marcas que no deben aparecer juntas | Relación entre marcas desconocida (P-O05) | Conflicto comercial o de imagen | 1 | 2 | Bajo | v0.2: **pierde relevancia**, porque la herramienta es interna |
| RS-08 | Incumplir requisitos de accesibilidad | Normativa aplicable sin confirmar (P-L04) | Exclusión de usuarios; posible incumplimiento | 2 | 2 | Medio | WCAG 2.2 AA como referencia; revisión en la Fase 7 |
| RS-09 | Nadie mantiene la plataforma tras el proyecto | Sin responsable ni presupuesto conocidos | Abandono y obsolescencia | 2 | 3 | Alto | Elegir en la Fase 3 la opción de menor mantenimiento que cumpla los requisitos. v0.2: el DPE gestionaría y Informática implementaría **[D]**; falta confirmar su dedicación (P-G02, P-G06) |
| RS-10 | Concentrar en un único sitio el acceso a la gestión de las doce aulas | La plataforma reúne enlaces de administración y, si se integra, claves de servicio con permisos sobre las aulas | Si alguien entra en la plataforma, puede llegar a las doce aulas a la vez | 2 | 3 | **Alto** | Acceso solo para personal autorizado, con autenticación reforzada; permisos mínimos por rol; claves de servicio de solo lectura siempre que sea posible, custodiadas por Informática y fuera del repositorio; registro de accesos |
| RS-11 | Acciones de gestión erróneas en el aula equivocada | Doce aulas parecidas, cinco con el mismo título (H-01) | Cambios en cursos o matrículas de otra aula | 2 | 2 | Medio | Mostrar siempre en qué aula se actúa; las acciones desde la plataforma, si llegan, con confirmación y registro |
| RS-12 | Falta de coordinación entre el DPE e Informática | Dos departamentos con papeles distintos en el mismo proyecto | Requisitos que uno pide y el otro no puede asumir; retrasos | 2 | 2 | Medio | Reparto de responsabilidades escrito en la Fase 2 y validado con ambos (N-15) |

## 3. Observaciones de seguridad en los campus (fuera del alcance)

Estas observaciones no son riesgos del proyecto, pero conviene comunicarlas a la organización por el canal adecuado y con discreción. **No se ha hecho ninguna prueba**; solo se ha leído la página pública.

| ID | Observación | Base | Recomendación |
|---|---|---|---|
| OS-01 | Indicio de Moodle 4.1, sin soporte de seguridad desde el 08-12-2025 | H-04, F-15 | Que el administrador confirme la versión y valore actualizar |
| OS-02 | Registro abierto en el entorno 4 | H-02 | Confirmar si es intencionado |

## 4. Control de versiones

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| 0.1 | 2026-10-30 | Claude (Seguridad / Project Manager) | Primera versión: 6 riesgos del proyecto, 9 de la futura plataforma y 2 observaciones sobre los campus. [Archivada](historico/06-registro-riesgos_v0.1.md) |
| 0.2 | 2026-11-04 | Claude (Seguridad / Project Manager) | Enfoque de gestión interna: RP-03 materializado; RP-05, RS-03, RS-04, RS-05, RS-06, RS-07 y RS-09 revisados; nuevos RP-10, RP-11, RS-10, RS-11 y RS-12 |
