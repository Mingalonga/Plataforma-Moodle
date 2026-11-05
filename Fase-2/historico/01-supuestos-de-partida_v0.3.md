# 01 — Supuestos de partida

| Campo | Valor |
|---|---|
| Versión | 0.3 |
| Fecha | 2026-11-05 |
| Estado | Revisión del propietario |
| Redacción | Claude (rol Analista), a petición del alumno |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |

Este documento separa **lo que ha dicho la tutora** (DT), **lo que ha respondido la organización** (DO) y **lo que se da por supuesto** para poder escribir requisitos (SF). Para cada supuesto se indica en qué se basa, qué requisitos dependen de él y qué cambiaría si resultara falso. Cuando llega una respuesta, se actualiza aquí y en la [matriz de trazabilidad](05-matriz-trazabilidad.md).

> **v0.3 (2026-11-05).** Grupo ATU ha respondido a las nueve preguntas (Departamento de Pedagogía y e-learning e Informática). Se añaden los datos DO-01 a DO-09, se actualizan los supuestos que confirman o corrigen, **SF-12 cae** (el DPE quiere ver a los alumnos, no solo cifras) y se añaden SF-15 a SF-18. La v0.2 está en el [histórico](historico/01-supuestos-de-partida_v0.2.md).

## 1. Datos de partida

### 1.1 Respuesta de la tutora (2026-11-04)

| ID | Dato | Cita o base | Efecto en la especificación |
|---|---|---|---|
| DT-01 | El enfoque es la **gestión interna** de las aulas, para «no andar saliendo y entrando» de una a otra | «la idea es el enfoque desde la gestión de las plataformas a nivel interno» | Los usuarios son el personal de gestión, no el alumnado |
| DT-02 | La plataforma se orienta al **rol de administración y gestión** de las aulas | «una operabilidad más enfocada al rol administrador/gestión» | Acceso restringido y requisitos de seguridad reforzados |
| DT-03 | El alumnado **ya entra en su curso con una URL** que se le facilita | «lo hacen mediante una URL que se les facilita» | El portal o catálogo para el alumnado queda descartado (W-04) |
| DT-04 | La gestión del entorno la llevaría el **Departamento de Pedagogía y e-learning** (DPE) | «lo llevaría el Departamento de Pedagogía y e-learning» | El DPE es el usuario principal y mantiene la información |
| DT-05 | La implementación la ejecutaría **Informática** | «la parte de implementación […] la ejecutaría informática» | Informática es el perfil técnico (instalación, permisos, claves) |
| DT-06 | **Antes de nada, hay que ver si es viable** | «antes de todo esto habría que ver cómo se gestiona si es viable» | Lo que depende de la integración queda condicionado a la viabilidad |

### 1.2 Respuestas de Grupo ATU (2026-11-05)

Texto literal en el [registro de seguimiento](registro-seguimiento.md). Los números son los de las preguntas enviadas.

| ID | Pregunta | Dato | Efecto en la especificación |
|---|---|---|---|
| DO-01 | 1 · Tareas | El DPE hace **toda la gestión** de Moodle (y crea contenido); el diseño y la programación los lleva otro departamento | Confirma SF-02. Diseño y programación de las aulas, fuera (W-07) |
| DO-02 | 2 · Personas | **Entre 20 y 30 personas**, según los planes en curso. Sin dato de tiempo | Corrige SF-01. Más cuentas y roles que gestionar en la plataforma |
| DO-03 | 3 · Cuentas | Cada aula se gestiona **por separado, en su URL**; cada persona tiene **roles y permisos distintos**, por seguridad | Confirma SF-03. La plataforma **no puede dar más permisos de los que cada persona tiene en cada aula** (RNF-SEG-12) |
| DO-04 | 4 · Qué quieren | Ver a los **alumnos de forma global y por aula**, hacer **controles de accesos** y gestionar **cambios globales o individuales**. Un hipervínculo no basta: quieren **ir más allá**, con un **estudio de viabilidad real**. Alumnado y profesorado no son usuarios. «Esta sí es la parte en la que queremos que trabajes» | **Cambio principal.** Los cambios desde la plataforma y la vista de alumnos pasan de futuro a núcleo (RF-15, RF-17, RF-19 a RF-21). SF-12 cae |
| DO-05 | 5 · Versión | La más actualizada es **Moodle 4.1.18**; puede no ser la misma en todas y las versiones cambian con el tiempo | Confirma SF-07 en parte. La plataforma debe funcionar con **versiones distintas a la vez** (RNF-MAN-09) |
| DO-06 | 6 · Pruebas | Informática podría crear un **perfil de prueba**, pero **solo cuando haya un plano de trazabilidad** que diga qué hacer y cómo | Resuelve en parte P-T01. Primero el plano; después, la prueba (SF-05) |
| DO-07 | 7 · Directorio y normas | La herramienta corporativa es **Microsoft 365**. Hay **normas de seguridad** y protocolos (consultar en la sede) | Corrige SF-04. RF-16 (acceso con la cuenta corporativa) sube a *Should*. Nuevo RNF-SEG-13 |
| DO-08 | 8 · Informática | Si lo ve viable, Informática **puede asumirlo todo o delegar** partes. Si no, tiene **muy poco tiempo**: el proyecto debe ser **claro y directo** («no van a leer 20 páginas»), con un **dosier de respaldo independiente** | Forma del entregable: documento breve + dosier (plan, T14) |
| DO-09 | 9 · Decisión | Primero el **DPE** valora pros y contras; después se expone a **Informática y Dirección**, que deciden si se pone en marcha. Sin presupuesto orientativo | El documento de viabilidad debe servir a ese recorrido (SF-14) |

**Resumen de la petición, en palabras de la organización:** «te estamos pidiendo que nos hagas los planos de una casa en la que queremos meter ciertas habitaciones […] para poder gestionarlo todo desde un mismo espacio».

## 2. Supuestos

| ID | Supuesto | Base | Pregunta abierta | Requisitos afectados | Si resulta falso |
|---|---|---|---|---|---|
| SF-01 | Usarán la plataforma **entre 20 y 30 personas** del DPE, más Informática y, solo para consultar, el CAU | **Confirmado en parte** por DO-02 **[D]** | — | RF-02, RNF-SEG-05 | Con muchas más personas, harían falta más roles y una prueba de carga |
| SF-02 | El DPE realiza **todas las tareas de gestión** de Moodle: cursos, matriculaciones, usuarios, informes, copias | **Confirmado** por DO-01 **[D]** | — | RF-04, RF-11, RF-15 | — |
| SF-03 | Cada persona del DPE tiene **una cuenta en cada aula, con roles distintos**, y debe iniciar sesión en cada una por separado | **Confirmado** por DO-03 **[D]** | — | RF-04, RF-16, RNF-SEG-12 | — |
| SF-04 | Existe **Microsoft 365** como directorio corporativo, pero **no consta que las aulas estén conectadas a él** | DO-07 **[D]**; conexión a las aulas **[S]** | P-I01 | RF-01, RF-16, RNF-SEG-01 | Si ya están conectadas, el acceso único (RF-16) es casi inmediato |
| SF-05 | El proyecto **no modifica las aulas en producción**. Toda integración se demuestra en un **aula o perfil de prueba**, que Informática daría **después de tener el plano** | Límites de la ficha **[D]**; DO-06 **[D]** | P-C05 | RF-11 a RF-22 | Si no llega el perfil de prueba, se monta un aula propia, local y sin datos reales **[R]** |
| SF-06 | Informática **puede habilitar los servicios web** de Moodle en cada aula, para leer y, si se aprueba, para escribir | Moodle los incluye de serie **[S]**. Sin respuesta directa (DO-06) | P-C04 | RF-11 a RF-15, RF-17, RF-19 a RF-22 | La consulta y los cambios no serían viables; la plataforma se quedaría en la base (inventario y accesos directos), que la organización considera insuficiente |
| SF-07 | Las aulas usan **Moodle 4.1 (la más actualizada, 4.1.18) o anterior**, rama sin soporte de seguridad desde el 08-12-2025, y **no todas tienen la misma versión** | DO-05 **[D]**; fin de soporte (Fase 1, H-04) **[H]** | P-C01 | RF-13, RNF-SEG-06, RNF-MAN-08, RNF-MAN-09 | Si se actualizan, la integración es menos arriesgada, pero hay que volver a probarla (RNF-MAN-08) |
| SF-08 | Las aulas **cambian pocas veces** (pocas altas, bajas o cambios de dirección al año) | Doce aulas estables en la observación **[O]** | P-C06 | RF-09, RF-14, RNF-MAN-06 | Con cambios frecuentes, el mantenimiento del inventario debe ser más ágil |
| SF-09 | El personal trabaja sobre todo **desde ordenador, en horario laboral** | Trabajo de gestión en oficina **[S]** | — | RNF-UX-02, RNF-REN-01, RNF-REN-04 | Si se usa mucho desde el móvil, se refuerzan las pruebas en móvil |
| SF-10 | El idioma es el **español** | Personal de la organización **[S]** | — | RNF-UX-06 | Se añade un requisito de interfaz multilingüe |
| SF-11 | **WCAG 2.2 AA** es la referencia de accesibilidad, también para una herramienta interna | Ficha, «Experiencia de uso» **[D]** | P-L04 | RNF-UX-01 | Se ajusta a la norma o política que indique la organización |
| ~~SF-12~~ | ~~La plataforma puede funcionar solo con datos agregados~~ | **Descartado** por DO-04: el DPE quiere ver a los alumnos | — | — | Sustituido por SF-15 |
| SF-13 | **Reparto de tareas:** el DPE mantiene el inventario y opera; Informática instala, gestiona permisos y custodia las claves. Informática puede asumirlo todo o delegar partes | DT-04, DT-05, DO-08 **[D]**; detalle **[S]** | — | RF-02, RF-06 a RF-09, RNF-MAN-04 | Se reasignan responsabilidades en la guía de operación |
| SF-14 | El proyecto entrega **«los planos»**: especificación, estudio de viabilidad y diseño, con un documento breve para decidir y un dosier de respaldo; si se aprueba, la implantación la haría Informática | DT-05, DT-06, DO-08, DO-09 **[D]** | — | Todos | Si se espera implantar durante el proyecto, cambian el plan y los riesgos |
| SF-15 | Los datos del alumnado se pueden consultar en la plataforma **con la misma finalidad con la que el DPE ya los gestiona** en cada aula (gestión de la formación), **sin guardar copia permanente** | DO-04 **[D]**; base legal **[S]** | P-L01 | RF-17, RF-19, RNF-SEG-07, RNF-SEG-08 | Si el responsable del tratamiento no lo admite, la vista global se limita a cifras (como en la v0.2) |
| SF-16 | «**Controles de accesos**» significa ver y gestionar quién entra en las aulas: último acceso, cuentas sin acceso, cuentas suspendidas, y suspender o reactivar | Interpretación de DO-04 **[S]** | P-G07 | RF-19, RF-15 | Si se refiere a otra cosa (por ejemplo, a quién del personal entra en cada aula), se rehace RF-19 |
| SF-17 | «**Cambios globales**» significa aplicar una misma operación a varias personas o a varias aulas en una sola orden. Primero, operaciones sobre usuarios y matrículas; los cambios de configuración, después | Interpretación de DO-04 **[S]**; menor riesgo **[R]** | P-G08 | RF-20, RF-22 | Cambian las operaciones priorizadas |
| SF-18 | Cada aula admite una **clave de servicio** con solo las funciones necesarias, de lectura y, por separado, de escritura | Funcionamiento estándar de los servicios web de Moodle **[S]** | P-C04 | RF-15, RF-20, RNF-SEG-06 | Si una clave da acceso a todo, el riesgo sube y se limita la escritura |

## 3. Qué no se supone

Para no ocultar supuestos (indicador de la ficha: «necesidades verificadas y no suposiciones ocultas»):

- Que la gestión dispersa cueste mucho tiempo. La organización no lo ha medido (DO-02 no da tiempos). La prueba con tareas (CP-UX-01 y CP-UX-06) dará una primera medida.
- Que todas las aulas tengan la misma versión, configuración o servicios web (DO-05 lo confirma).
- Que todas las aulas permitan las mismas operaciones: el estudio de viabilidad lo comprobará aula por aula.
- Que Informática apruebe claves de escritura: es la decisión central de la viabilidad.

## 4. Control de versiones

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| 0.1 | 2026-11-03 | Claude (Analista) | Primera versión: 14 supuestos de partida. [Archivada](historico/01-supuestos-de-partida_v0.1.md) |
| 0.2 | 2026-11-04 | Claude (Analista) | Enfoque de gestión interna: 6 datos de la tutora (DT-01 a DT-06) y 14 supuestos nuevos (SF-01 a SF-14). [Archivada](historico/01-supuestos-de-partida_v0.2.md) |
| 0.3 | 2026-11-05 | Claude (Analista) | Respuestas de Grupo ATU: datos DO-01 a DO-09; SF-01 a SF-05, SF-07, SF-13 y SF-14 actualizados; SF-12 descartado; nuevos SF-15 a SF-18 |
