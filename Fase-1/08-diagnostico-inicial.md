# Entregable 01 — Diagnóstico inicial

| Campo | Valor |
|---|---|
| Proyecto | Plataforma centralizada para los entornos Moodle (Ficha 01) |
| Fase | 1 — Descubrimiento |
| Hito | Alcance preliminar validado |
| Versión | 0.5 |
| Fecha | 2026-11-04 |
| Estado | Revisión del propietario (entregado a la tutora en su v0.4; reorientado tras su respuesta) |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |
| Redacción | Claude (rol Redactor), a petición del alumno |

Contenido mínimo según la ficha (página 6): situación actual, inventario, perfiles, necesidades, problemas y alcance preliminar. Este documento resume y enlaza; el detalle está en los documentos 00 a 07.

Etiquetas: **[H]** hecho comprobado · **[O]** observado en web pública · **[D]** dato de la organización o del alumno · **[S]** supuesto · **[R]** recomendación · **[P]** pendiente de autorización.

> **v0.5 (2026-11-04). Cambio de enfoque.** La tutora ha respondido que el enfoque es la **gestión interna** de las aulas: que el personal no tenga que entrar y salir de cada una. El alumnado ya entra en su curso con la URL que se le facilita. El entorno lo gestionaría el Departamento de Pedagogía y e-learning (DPE) y la implementación la haría Informática, y antes hay que estudiar la viabilidad. El diagnóstico de las aulas (inventario y hallazgos) sigue siendo válido; cambian los usuarios, las necesidades principales y el alcance.

---

## 1. Resumen ejecutivo

- La organización tiene al menos **doce entornos Moodle** en once dominios **[D]**. Se observaron los doce (once de forma automatizada y uno manualmente); todos muestran el soporte común de Grupo ATU, once confirman Moodle y el restante tiene un formulario típico de Moodle **[O]**.
- Se han observado **señales concretas del problema** que plantea la ficha: no hay un punto público que reúna los campus (**ni siquiera la web corporativa enlaza a ellos**), las páginas no se indexan en buscadores y cinco campus de marcas distintas tienen el mismo título **[O]**.
- **No está demostrado cuántos usuarios sufren el problema.** No hay datos de soporte ni de usuarios porque la fase se ha hecho solo con información pública, por decisión del alumno **[D]**. Es la principal limitación del diagnóstico.
- Hay **indicios de que los campus usan Moodle 4.1**, sin soporte de seguridad desde el 08-12-2025 **[S]**. Condiciona cualquier integración futura y conviene comunicarlo a la organización.
- ~~**Recomendación de alcance [R]:** un MVP mínimo de catálogo, búsqueda y acceso directo, sin datos personales ni cambios en los campus, dejando inicio de sesión único e integraciones como evolución futura condicionada.~~ *(sustituida en la v0.5)*
- **v0.5. Problema reorientado [D]:** según la tutora, lo que hay que resolver es la **gestión dispersa** de las doce aulas por parte del DPE (PR-09), no la localización por el alumnado. Las señales observadas en la Fase 1 (doce direcciones, sin acceso común, títulos repetidos, configuración distinta) **también afectan a quien gestiona**.
- **v0.5. Recomendación de alcance [R]:** un MVP de herramienta interna con acceso restringido, inventario de gestión de las aulas y accesos directos a sus áreas de gestión, sin guardar contraseñas ni modificar las aulas. La consulta de información de varias aulas a la vez (servicios web) queda como conveniente, condicionada a la viabilidad, y el inicio de sesión único y las acciones desde la plataforma, como futuro. Ver el [alcance v0.3](07-alcance-preliminar.md).

## 2. Situación actual

Ver [05 — Situación actual](05-situacion-actual.md#1-situación-actual-lo-que-se-puede-describir-hoy). En síntesis: cada campus tiene su propia página de acceso con usuario y contraseña, sin acceso común visible **[O]**; la ayuda está centralizada en un CAU común **[O]**; la configuración no es homogénea (un campus en inglés, otro con tema distinto) **[O]**.

## 3. Inventario

Ver [03 — Inventario de los doce entornos](03-inventario-campus.md). Resultado de la observación del 2026-10-30:

| Resultado | Entornos |
|---|---|
| Observado, Moodle, tema «enlight», soporte Grupo ATU | 2, 3, 5, 6, 8, 9, 10, 11, 12 |
| Observado con diferencias notables | 1 (otro tema y siete idiomas), 4 (inglés, sin ayuda, registro abierto), 7 (bloquea la lectura automatizada; diseño parecido al 1 con un bloque comercial; observado manualmente) |

Hallazgos principales: H-01 títulos repetidos, H-02 entorno 4 sin completar, H-04 indicio de versión sin soporte, H-06 sin acceso común.

## 4. Actores y perfiles

Ver [04 — Mapa de actores y perfiles](04-mapa-actores-perfiles.md). Doce actores identificados y siete perfiles hipotéticos: alumnado de uno o varios campus, profesorado, empresas clientes, CAU, gestor/a del catálogo y administradores. **Ninguno validado con la organización [S].**

**v0.5:** se añaden el **Departamento de Pedagogía y e-learning** (A-13, usuario principal) e **Informática** (A-14, implementación), y tres perfiles nuevos: gestor/a de e-learning (PU-08), técnico/a de Informática (PU-09) y responsable del DPE (PU-10). El alumnado, el profesorado y las empresas pasan a ser afectados indirectos.

## 5. Necesidades y problemas

Ver [05 — Situación actual](05-situacion-actual.md#2-necesidades-detectadas): diez necesidades (N-01 a N-10) y ocho problemas (PR-01 a PR-08), cada uno con su evidencia y su nivel de confianza.

**v0.5:** cinco necesidades nuevas de gestión (N-11 a N-15) y dos problemas nuevos (PR-09, gestión dispersa, y PR-10, versión de Moodle que limita la integración). N-01, N-02, N-04 y N-09, y los problemas PR-02 y PR-08, pierden relevancia porque se referían al alumnado.

## 6. Respuesta a las preguntas guía de la ficha

Respuestas provisionales; el detalle y su origen están en el [registro de preguntas](01-registro-preguntas-supuestos.md#2-preguntas-guía-de-la-ficha-página-4-con-respuesta-provisional).

| Pregunta de la ficha | Respuesta breve | Estado |
|---|---|---|
| ¿Qué problema concreto se pretende resolver? | v0.5: la gestión dispersa de las doce aulas (entrar y salir de cada una), según la tutora. Falta medir su tamaño | Provisional (reorientada) |
| ¿Qué entornos existen, quién los gestiona y en qué se diferencian? | 12 listados y 12 observados; todos de Grupo ATU (confirmado por el alumno); responsables de cada aula sin confirmar | Provisional |
| ¿Qué perfiles intervienen? | v0.5: personal del DPE (principal), Informática y, como consulta, el CAU | Provisional (reorientada) |
| ¿Qué información puede ser pública, restringida o personalizada? | v0.5: nada público; todo restringido al personal autorizado, con datos personales mínimos | Provisional (reorientada) |
| ¿Solo centralizar el acceso o también consultar o administrar? | v0.5: centralizar la gestión. Accesos directos como mínimo; consulta y acciones según la viabilidad | Resuelta en parte |
| ¿Qué requisitos de accesibilidad, móvil, rendimiento y disponibilidad? | WCAG 2.2 AA como referencia; resto sin datos | Provisional |
| ¿Qué dependencias o limitaciones condicionan el proyecto? | Tutor, administradores, identidad común, responsable del catálogo, versión de Moodle | Provisional |
| ¿Cómo se actualizará la información? | v0.5: la mantendría el DPE; la parte técnica, Informática | Resuelta en parte |
| ¿Qué riesgos deben controlarse? | v0.5: 8 del proyecto y 12 de la plataforma ([06](06-registro-riesgos.md)); suben los de seguridad y privacidad | Provisional |
| ¿Cómo se comprobará objetivamente? | v0.5: tiempo y pasos hasta una tarea de gestión, inicios de sesión necesarios, valoración del personal, accesibilidad y seguridad | Provisional (reorientada) |

## 7. Alcance preliminar

Ver [07 — Alcance preliminar](07-alcance-preliminar.md). ~~MVP hipotético: catálogo, búsqueda, acceso directo con aviso de salida, diseño accesible y adaptable, procedimiento de mantenimiento y ningún dato personal. SSO, personalización e integración con la API de Moodle quedan como futuro condicionado.~~ *(v0.4)*

**v0.5:** MVP hipotético de herramienta interna: acceso restringido por roles, inventario de gestión de las aulas, accesos directos a sus áreas de gestión, búsqueda y filtros, mantenimiento por el DPE, reparto de responsabilidades con Informática, accesibilidad y ninguna contraseña guardada. La consulta de datos de varias aulas a la vez es conveniente, condicionada a la viabilidad; el inicio de sesión único y las acciones desde la plataforma quedan como futuro. El portal para el alumnado queda fuera.

## 8. Limitaciones del diagnóstico

1. Solo información pública: ningún dato de la organización, del CAU ni de usuarios.
2. El entorno 7 y la web corporativa solo se pudieron observar manualmente, a partir de capturas del alumno.
3. La versión de Moodle es un indicio a partir de un parámetro técnico.
4. Los perfiles y necesidades son hipótesis razonadas, no validadas.
5. v0.5: el enfoque de gestión procede de una respuesta breve de la tutora. El grado de integración esperado y la referencia al «entorno de pruebas» están por aclarar (P-T01, P-G04).

## 9. Próximos pasos propuestos

1. ~~Presentar este diagnóstico y el alcance preliminar al tutor (T10) y anotar sus acuerdos en el [registro de seguimiento](registro-seguimiento.md).~~ Hecho: entregado el 2026-10-30; respuesta de la tutora el 2026-11-03 y el 2026-11-04.
2. v0.5: confirmar con la tutora la interpretación del nuevo enfoque y aclarar P-T01.
3. v0.5: pedir una conversación breve con el DPE y con Informática (P-G01 a P-G06).
4. Rehacer la Fase 2 con el nuevo enfoque (paquete 0.2).

## 10. Comprobación de los criterios de salida de la fase

| Criterio (plan, sección 7) | Estado |
|---|---|
| Doce entornos con ficha de observación | Hecho (el 7, con observación manual) |
| Mapa de actores | Hecho (hipotético) |
| Situación actual y problemas separando hechos de supuestos | Hecho |
| Diez preguntas guía con respuesta provisional y origen | Hecho |
| Registro de preguntas con estado y destinatario | Hecho |
| Registro de riesgos inicial | Hecho |
| Alcance preliminar sin elegir solución técnica | Hecho |
| Diagnóstico que lo reúne todo | Este documento |
| Sin credenciales, datos personales ni secretos en el repositorio | Hecho: solo canales de contacto corporativos publicados |
| Registro de seguimiento y changelog al día | Hecho |

## 11. Control de versiones

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| 0.1 | 2026-10-30 | Claude (Redactor) | Primera versión del diagnóstico inicial. [Archivada](historico/08-diagnostico-inicial_v0.1.md) |
| 0.2 | 2026-10-30 | Claude (Redactor) | Entorno 7 observado. [Archivada](historico/08-diagnostico-inicial_v0.2.md) |
| 0.3 | 2026-10-30 | Claude (Redactor) | Web corporativa revisada: no enlaza a los campus. [Archivada](historico/08-diagnostico-inicial_v0.3.md) |
| 0.4 | 2026-10-30 | Claude (Redactor) | Pertenencia a Grupo ATU confirmada. [Archivada](historico/08-diagnostico-inicial_v0.4.md) |
| 0.5 | 2026-11-04 | Claude (Redactor) | Respuesta de la tutora: enfoque de gestión interna. Resumen, perfiles, necesidades, preguntas guía, alcance, limitaciones y próximos pasos actualizados |
