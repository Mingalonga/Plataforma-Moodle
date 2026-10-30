# Entregable 01 — Diagnóstico inicial

| Campo | Valor |
|---|---|
| Proyecto | Plataforma centralizada para los entornos Moodle (Ficha 01) |
| Fase | 1 — Descubrimiento |
| Hito | Alcance preliminar validado |
| Versión | 0.2 |
| Fecha | 2026-10-30 |
| Estado | Revisión del propietario (pendiente de presentar al tutor) |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |
| Redacción | Claude (rol Redactor), a petición del alumno |

Contenido mínimo según la ficha (página 6): situación actual, inventario, perfiles, necesidades, problemas y alcance preliminar. Este documento resume y enlaza; el detalle está en los documentos 00 a 07.

Etiquetas: **[H]** hecho comprobado · **[O]** observado en web pública · **[D]** dato de la organización o del alumno · **[S]** supuesto · **[R]** recomendación · **[P]** pendiente de autorización.

---

## 1. Resumen ejecutivo

- La organización tiene al menos **doce entornos Moodle** en once dominios **[D]**. Se observaron los doce (once de forma automatizada y uno manualmente); todos muestran el soporte común de Grupo ATU, once confirman Moodle y el restante tiene un formulario típico de Moodle **[O]**.
- Se han observado **señales concretas del problema** que plantea la ficha: no hay un punto público que reúna los campus, las páginas no se indexan en buscadores y cinco campus de marcas distintas tienen el mismo título **[O]**.
- **No está demostrado cuántos usuarios sufren el problema.** No hay datos de soporte ni de usuarios porque la fase se ha hecho solo con información pública, por decisión del alumno **[D]**. Es la principal limitación del diagnóstico.
- Hay **indicios de que los campus usan Moodle 4.1**, sin soporte de seguridad desde el 08-12-2025 **[S]**. Condiciona cualquier integración futura y conviene comunicarlo a la organización.
- **Recomendación de alcance [R]:** un MVP mínimo de catálogo, búsqueda y acceso directo, sin datos personales ni cambios en los campus, dejando inicio de sesión único e integraciones como evolución futura condicionada.

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

## 5. Necesidades y problemas

Ver [05 — Situación actual](05-situacion-actual.md#2-necesidades-detectadas): diez necesidades (N-01 a N-10) y siete problemas (PR-01 a PR-07), cada uno con su evidencia y su nivel de confianza.

## 6. Respuesta a las preguntas guía de la ficha

Respuestas provisionales; el detalle y su origen están en el [registro de preguntas](01-registro-preguntas-supuestos.md#2-preguntas-guía-de-la-ficha-página-4-con-respuesta-provisional).

| Pregunta de la ficha | Respuesta breve | Estado |
|---|---|---|
| ¿Qué problema concreto se pretende resolver? | Localizar el campus correcto y llegar a él. Hay señales observadas; falta medir su tamaño | Provisional |
| ¿Qué entornos existen, quién los gestiona y en qué se diferencian? | 12 listados y 12 observados; operador común probable; responsables sin confirmar | Provisional |
| ¿Qué perfiles intervienen? | 7 perfiles hipotéticos | Provisional |
| ¿Qué información puede ser pública, restringida o personalizada? | Catálogo público con lo que ya es público; personalización solo con identidad común | Provisional |
| ¿Solo centralizar el acceso o también consultar o administrar? | Recomendado: empezar solo por el acceso | Abierta, pendiente de la organización |
| ¿Qué requisitos de accesibilidad, móvil, rendimiento y disponibilidad? | WCAG 2.2 AA como referencia; resto sin datos | Provisional |
| ¿Qué dependencias o limitaciones condicionan el proyecto? | Tutor, administradores, identidad común, responsable del catálogo, versión de Moodle | Provisional |
| ¿Cómo se actualizará la información? | Sin procedimiento actual; se propone responsable y revisión periódica | Abierta |
| ¿Qué riesgos deben controlarse? | 6 del proyecto y 9 de la plataforma ([06](06-registro-riesgos.md)) | Provisional |
| ¿Cómo se comprobará objetivamente? | Indicadores propuestos (encontrar el campus sin ayuda, tiempo, errores, enlaces válidos, accesibilidad) | Provisional |

## 7. Alcance preliminar

Ver [07 — Alcance preliminar](07-alcance-preliminar.md). MVP hipotético: catálogo, búsqueda, acceso directo con aviso de salida, diseño accesible y adaptable, procedimiento de mantenimiento y ningún dato personal. SSO, personalización e integración con la API de Moodle quedan como futuro condicionado.

## 8. Limitaciones del diagnóstico

1. Solo información pública: ningún dato de la organización, del CAU ni de usuarios.
2. El entorno 7 solo se pudo observar manualmente, a partir de una captura; la web corporativa sigue pendiente (P-V07).
3. La versión de Moodle es un indicio a partir de un parámetro técnico.
4. Los perfiles y necesidades son hipótesis razonadas, no validadas.

## 9. Próximos pasos propuestos

1. El alumno revisa en su navegador la web corporativa (P-V07).
2. Presentar este diagnóstico y el alcance preliminar al tutor (T10) y anotar sus acuerdos en el [registro de seguimiento](registro-seguimiento.md).
3. Pedir al tutor datos agregados del CAU o un contacto en la organización (RP-01).
4. Solo tras el visto bueno: iniciar la Fase 2 (requisitos).

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
| 0.2 | 2026-10-30 | Claude (Redactor) | Entorno 7 observado |
