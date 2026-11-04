# 01 — Supuestos de partida

| Campo | Valor |
|---|---|
| Versión | 0.2 |
| Fecha | 2026-11-04 |
| Estado | Revisión del propietario |
| Redacción | Claude (rol Analista), a petición del alumno |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |

La organización no ha respondido a las preguntas. La tutora sí ha indicado el enfoque (2026-11-04). Este documento separa **lo que ha dicho la tutora** (datos, DT) de **lo que se da por supuesto** para poder escribir requisitos (SF). Para cada supuesto se indica en qué se basa, qué requisitos dependen de él y qué cambiaría si resultara falso. Cuando llegue una respuesta, se actualiza aquí y en la [matriz de trazabilidad](05-matriz-trazabilidad.md).

> **v0.2.** Los 14 supuestos de la v0.1 estaban pensados para un catálogo de aulas dirigido al alumnado. Se sustituyen por los de esta versión. La v0.1 está en el [histórico](historico/01-supuestos-de-partida_v0.1.md).

## 1. Datos de partida (respuesta de la tutora, 2026-11-04)

| ID | Dato | Cita o base | Efecto en la especificación |
|---|---|---|---|
| DT-01 | El enfoque es la **gestión interna** de las aulas, para «no andar saliendo y entrando» de una a otra | «la idea es el enfoque desde la gestión de las plataformas a nivel interno» | Los usuarios son el personal de gestión, no el alumnado |
| DT-02 | La plataforma se orienta al **rol de administración y gestión** de las aulas | «una operabilidad más enfocada al rol administrador/gestión» | Acceso restringido y requisitos de seguridad reforzados |
| DT-03 | El alumnado **ya entra en su curso con una URL** que se le facilita | «lo hacen mediante una URL que se les facilita» | El portal o catálogo para el alumnado queda descartado (W-04) |
| DT-04 | La gestión del entorno la llevaría el **Departamento de Pedagogía y e-learning** (DPE) | «lo llevaría el Departamento de Pedagogía y e-learning» | El DPE es el usuario principal y mantiene la información |
| DT-05 | La implementación la ejecutaría **Informática** | «la parte de implementación […] la ejecutaría informática» | Informática es el perfil técnico (instalación, permisos, claves) |
| DT-06 | **Antes de nada, hay que ver si es viable** | «antes de todo esto habría que ver cómo se gestiona si es viable» | Los requisitos que dependen de la integración quedan condicionados a la viabilidad (Fase 5) |

**Punto sin aclarar:** «y ya estaría, por así decirlo, lo del tema de entorno de pruebas» (P-T01). Se interpreta provisionalmente que el acceso del alumnado no requiere nada más. El proyecto sigue necesitando un aula de pruebas para demostrar cualquier integración (SF-05).

## 2. Supuestos

| ID | Supuesto | Base | Pregunta abierta | Requisitos afectados | Si resulta falso |
|---|---|---|---|---|---|
| SF-01 | Usarán la plataforma **pocas personas**: el personal del DPE, Informática y, solo para consultar, el CAU (del orden de 5 a 20 personas) | DT-04, DT-05 **[D]**; tamaño **[S]** | P-G02 | RF-02 | Con más personas o perfiles, harían falta más roles y una prueba de carga |
| SF-02 | Las tareas de gestión más frecuentes son las habituales en Moodle: **cursos y categorías, matriculaciones, usuarios, informes y copias de cursos** | Funciones estándar de administración de Moodle **[S]** | P-G01 | RF-04, RF-11, RF-12 | Cambian los accesos directos que se ofrecen y la información que se consulta |
| SF-03 | Cada persona del DPE tiene **una cuenta en cada aula** y debe iniciar sesión en cada una por separado | Sin acceso común visible (H-06) **[O]**; S-11 de la Fase 1 **[S]** | P-G03 | RF-04, RF-16 | Si ya hubiera un acceso común, el valor del panel se centraría en el inventario y la consulta |
| SF-04 | **No hay un directorio común** conectado a las aulas, aunque el personal podría tener cuentas de Microsoft 365 | S-05 y S-09 de la Fase 1 **[S]** | P-I01 | RF-01, RF-16, RNF-SEG-01 | Si existe, la identificación en el panel podría usarlo y el inicio de sesión único (RF-16) sería más fácil |
| SF-05 | El proyecto **no modifica las aulas en producción**. Cualquier integración se demuestra en un **aula de pruebas** | Límites de la ficha **[D]**; P-C05; P-T01 | P-C05, P-T01 | RF-11, RF-12, RF-13, RF-15 | Si no hay aula de pruebas de la organización, se monta una propia, local y sin datos reales **[R]** |
| SF-06 | Informática **puede habilitar los servicios web** de Moodle, al menos en modo solo lectura | Moodle los incluye de serie **[S]** | P-C04, P-G06 | RF-11, RF-12, RF-13 | La consulta de datos de varias aulas no sería viable; el panel se quedaría en inventario y accesos directos |
| SF-07 | Las aulas usan **Moodle 4.1**, sin soporte de seguridad desde el 08-12-2025 | H-04 **[S]** | P-C01 | RF-11 a RF-13, RNF-SEG-06, RNF-MAN-08 | Si están actualizadas, la integración es menos arriesgada |
| SF-08 | Las aulas **cambian pocas veces** (pocas altas, bajas o cambios de dirección al año) | Doce aulas estables en la observación **[O]** | P-C06 | RF-09, RF-14, RNF-MAN-06 | Con cambios frecuentes, el mantenimiento del inventario debe ser más ágil |
| SF-09 | El personal trabaja sobre todo **desde ordenador, en horario laboral** | Trabajo de gestión en oficina **[S]** | P-G02 | RNF-UX-02, RNF-REN-01, RNF-REN-04 | Si se usa mucho desde el móvil, se refuerzan las pruebas en móvil |
| SF-10 | El idioma es el **español** | Personal de la organización **[S]** | — | RNF-UX-06 | Se añade un requisito de interfaz multilingüe |
| SF-11 | **WCAG 2.2 AA** es la referencia de accesibilidad, también para una herramienta interna | Ficha, «Experiencia de uso» **[D]**; prompt inicial **[D]** | P-L04 | RNF-UX-01 | Se ajusta a la norma o política que indique la organización |
| SF-12 | La plataforma puede funcionar mostrando **datos agregados** de las aulas, sin guardar datos personales del alumnado | Minimización (RS-03) **[R]** | P-G04 | RF-11, RF-17, RNF-SEG-07 | Si el DPE necesita datos de personas concretas, aplica RF-17 con su base legal |
| SF-13 | **Reparto de tareas:** el DPE mantiene el inventario y los accesos; Informática instala, gestiona los permisos y custodia las claves | DT-04, DT-05 **[D]**; detalle **[S]** | P-G06 | RF-02, RF-06 a RF-09, RNF-MAN-04 | Se reasignan responsabilidades en la guía de operación |
| SF-14 | El proyecto termina con un **estudio de viabilidad, un prototipo y una recomendación**; la implantación real la haría Informática después, si se aprueba | DT-05, DT-06 **[D]**; fases de la ficha **[D]** | P-G05 | Todos | Si se espera implantar durante el proyecto, cambian el plan y los riesgos |

## 3. Qué no se supone

Para no ocultar supuestos (indicador de la ficha: «necesidades verificadas y no suposiciones ocultas»):

- Que la gestión dispersa cueste mucho tiempo. La tutora lo plantea, pero no está medido (PR-07). La prueba con tareas (CP-UX-01) dará una primera medida.
- Que todas las aulas tengan la misma versión, configuración o servicios web (límite de la ficha).
- Que el DPE quiera hacer cambios desde la plataforma y no solo consultar (P-G04).
- Que el inicio de sesión único sea necesario o viable.

## 4. Control de versiones

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| 0.1 | 2026-11-03 | Claude (Analista) | Primera versión: 14 supuestos de partida. [Archivada](historico/01-supuestos-de-partida_v0.1.md) |
| 0.2 | 2026-11-04 | Claude (Analista) | Enfoque de gestión interna: 6 datos de la tutora (DT-01 a DT-06) y 14 supuestos nuevos (SF-01 a SF-14) |
