# 04 — Requisitos no funcionales

| Campo | Valor |
|---|---|
| Versión | 0.4 |
| Fecha | 2026-11-05 |
| Estado | Revisión del propietario |
| Redacción | Claude (roles UX, Seguridad y Arquitecto), a petición del alumno |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |

> **v0.2.** Requisitos rehechos para una **herramienta interna de gestión**. Cambios principales respecto a la v0.1: la plataforma deja de ser pública, así que la seguridad pasa a centrarse en la autenticación, los permisos y la custodia de claves; la eficiencia se mide en el trabajo del personal y no en que el alumnado encuentre su aula; el ordenador pasa a ser el dispositivo principal. La v0.1 está en el [histórico](historico/04-requisitos-no-funcionales_v0.1.md).

> **v0.4 (2026-11-05).** Con la Política de Seguridad y las Normas de uso de Grupo ATU (DO-10), RNF-SEG-13 pasa de «normas por localizar» a una lista de comprobación concreta. La v0.3 está en el [histórico](historico/04-requisitos-no-funcionales_v0.3.md).

> **v0.3 (2026-11-05).** Con las respuestas de Grupo ATU, la plataforma va a **leer datos del alumnado y hacer cambios en las aulas** (DO-04), las aulas tienen **versiones distintas** (DO-05) y la organización tiene **normas de seguridad** propias (DO-07). Se revisan RNF-SEG-06, RNF-SEG-07, RNF-SEG-08, RNF-REN-07 y RNF-MAN-06, y se añaden RNF-UX-09, RNF-SEG-12, RNF-SEG-13, RNF-REN-08 y RNF-MAN-09. La v0.2 está en el [histórico](historico/04-requisitos-no-funcionales_v0.2.md).

Cuatro grupos de la ficha, cada uno con su forma de comprobación:

| Grupo | Contenido mínimo (ficha) | Forma de comprobación (ficha) |
|---|---|---|
| Usabilidad y accesibilidad (RNF-UX) | Navegación, comprensión, consistencia, dispositivos y necesidades de acceso | Revisión heurística y pruebas con tareas |
| Seguridad y privacidad (RNF-SEG) | Autorización, protección de datos, registro, secretos y exposición de información | Análisis de riesgos y pruebas autorizadas |
| Rendimiento y disponibilidad (RNF-REN) | Tiempos de respuesta, carga prevista, continuidad y recuperación | Métricas, supuestos y pruebas proporcionadas |
| Mantenimiento (RNF-MAN) | Actualizaciones, altas y bajas, documentación, copias y responsabilidades | Procedimiento de operación y estimación de esfuerzo |

**Sobre los valores numéricos.** No hay datos de la organización. Los valores son **propuestas razonadas [R]** o **supuestos [S]** y se revisarán cuando haya datos (RP-09).

## 1. Usabilidad y accesibilidad

| ID | Requisito | Valor / criterio | Prior. | Comprobación | Origen |
|---|---|---|---|---|---|
| RNF-UX-01 | La plataforma debe cumplir las pautas de accesibilidad de referencia | WCAG 2.2 nivel AA, sin incumplimientos en la revisión. No se afirma conformidad hasta probarla | M | Lista de comprobación WCAG 2.2 AA, revisión automática y manual, prueba con lector de pantalla | N-08 · SF-11 · RS-08 |
| RNF-UX-02 | La plataforma debe funcionar en los dispositivos del personal | Uso completo en ordenador (desde 1280 px) y tableta; consulta del inventario en móvil desde 320 px sin desplazamiento horizontal; texto ampliado al 200 % | M | Matriz de dispositivos | N-08 · SF-09 |
| RNF-UX-03 | Llegar a una tarea de gestión debe ser más rápido que hoy | Desde la plataforma, el 90 % de las tareas de prueba llega a la página de gestión correcta en 3 acciones o menos y en 20 s o menos [R], y en menos tiempo que por el camino actual (línea base medida en la misma prueba) | M | Prueba con tareas (ES-02, ES-03, ES-04) con personal del DPE o perfiles equivalentes | N-11 · PR-09 · PR-07 |
| RNF-UX-04 | Todo se debe poder usar solo con teclado y con lector de pantalla | Foco visible, orden lógico, sin trampas de teclado; resultados y mensajes anunciados | M | Prueba manual con teclado y con un lector de pantalla (NVDA o VoiceOver) | N-08 · ES-12 |
| RNF-UX-05 | Los textos deben usar el vocabulario del personal | Términos de Moodle que el DPE ya conoce (curso, categoría, matriculación, informe) y nombres propios de aula únicos | S | Revisión heurística y comentarios de la prueba con tareas | N-03 · SF-02 |
| RNF-UX-06 | El idioma debe estar declarado y ser coherente | Interfaz en español con el idioma declarado en la página | M | Revisión del código de la página | SF-10 |
| RNF-UX-07 | Debe quedar siempre claro en qué aula se va a actuar | Todas las aulas con la misma estructura; cada acceso directo muestra el nombre propio del aula y su dominio | M | Revisión heurística (heurísticas de Nielsen) | N-03 · RS-11 · PR-03 |
| RNF-UX-08 | El personal debe valorar bien la herramienta | Puntuación SUS (cuestionario estándar de usabilidad) de 70 o más [R] | S | Cuestionario SUS al final de la prueba con tareas | N-11 · PG-10 |
| RNF-UX-09 | Un cambio global debe ahorrar trabajo frente a hacerlo aula por aula | Una sola orden para N aulas; para un cambio en 5 aulas, tiempo total inferior al 25 % del camino actual [R], vista previa incluida | M | Prueba con tareas (ES-17) comparando con el camino actual en aulas de prueba | N-16 · DO-04 · PR-09 |

## 2. Seguridad y privacidad

| ID | Requisito | Valor / criterio | Prior. | Comprobación | Origen |
|---|---|---|---|---|---|
| RNF-SEG-01 | La identificación del personal debe ser robusta | Preferiblemente con la cuenta corporativa (SF-04) y con doble factor; si no, contraseña propia robusta con doble factor. Bloqueo temporal tras intentos fallidos | M | Revisión de la configuración y prueba con una cuenta de prueba | N-14 · RS-10 · DT-02 |
| RNF-SEG-02 | La plataforma nunca debe pedir, recibir, guardar ni reenviar contraseñas personales de las aulas | Ningún campo de usuario o contraseña de las aulas en ninguna página ni en ningún almacenamiento | M | Revisión del código y prueba funcional (CP-F-04) | RS-04 · W-03 |
| RNF-SEG-03 | Todas las comunicaciones deben ir cifradas | Solo HTTPS, con redirección desde HTTP y certificado válido | M | Comprobación de la configuración | N-07 |
| RNF-SEG-04 | Solo se deben admitir direcciones de aulas de dominios autorizados | Lista de dominios permitidos mantenida por Informática; HTTPS obligatorio | M | Prueba funcional con una dirección no permitida (CP-F-06) | RS-02 |
| RNF-SEG-05 | Cada rol debe tener solo los permisos que necesita | Tres roles (RF-02); revisión de las cuentas activas cada 90 días [R] | M | Prueba de permisos por rol y revisión del procedimiento | N-14 · N-15 |
| RNF-SEG-06 | Las claves de servicio deben estar protegidas y limitadas | Una clave por aula, con **solo las funciones necesarias**; **lectura y escritura separadas**, y la de escritura solo con aprobación expresa de Informática; custodiadas por Informática, nunca en el repositorio ni visibles en la interfaz; se pueden cambiar o revocar sin rehacer la plataforma | M | Búsqueda de secretos en el repositorio, revisión de la configuración y de las funciones habilitadas por clave | RS-10 · SF-06 · SF-18 · Ficha («secretos») |
| RNF-SEG-07 | La plataforma debe tratar los mínimos datos personales | Del personal: solo los necesarios para identificarse y registrar. Del alumnado: **se leen de las aulas al consultarlos y no se guarda copia permanente** (como mucho, una copia temporal borrada en 24 h [R]); solo los campos necesarios (nombre, correo, aulas, cursos, estado, último acceso); finalidad: la gestión de la formación que el DPE ya hace (SF-15), a confirmar con el responsable del tratamiento | M | Revisión de lo que se guarda y de las peticiones de red | N-07 · RS-03 · A-09 · DO-04 |
| RNF-SEG-08 | Los registros deben conservarse y protegerse | Registro de entradas, permisos, cambios del inventario (RF-08, RF-10), **consultas de datos del alumnado** y **cambios en las aulas** (RF-21), conservado 12 meses [R]; no se puede modificar desde la plataforma | **M** (antes S) | Revisión de la configuración y del procedimiento | RS-10 · RS-02 · DO-04 |
| RNF-SEG-09 | La plataforma no debe estar expuesta al público | No indexada por buscadores y, si Informática lo decide, accesible solo desde la red corporativa o una conexión segura | M | Comprobación desde fuera con una cuenta no autorizada | DT-02 · RS-10 |
| RNF-SEG-10 | La plataforma debe aplicar las protecciones básicas del navegador | Cabeceras de seguridad (política de contenido, protección frente a incrustación) | S | Comprobación de cabeceras con una herramienta pública | RS-10 |
| RNF-SEG-11 | No debe haber cookies ni rastreadores innecesarios | Solo la cookie técnica de sesión; sin recursos de terceros que rastreen | M | Revisión de cookies y peticiones de red | N-07 |
| RNF-SEG-12 | La plataforma no debe permitir a nadie hacer en un aula lo que no podría hacer entrando en ella con su propia cuenta | Para cada persona y aula, los permisos de la plataforma son iguales o menores que los que tiene en esa aula; se revisan cuando cambian en el aula | M | Prueba con una cuenta de gestión sin permiso en un aula de prueba (CP-SEG-07) | DO-03 · RS-10 · RS-11 |
| RNF-SEG-13 | La plataforma debe cumplir las normas de seguridad y los protocolos internos de Grupo ATU | Lista de comprobación de la Política de Seguridad (ENS: aprobación del Responsable del Sistema y análisis de riesgos) y de las Normas de uso 4.2.2, 4.3.4, 4.3.10, 4.4.2, 4.4.6, 4.4.9 y 4.5.3 (dosier de respaldo, 8.1), revisada con Informática antes de la viabilidad | M | Revisión con Informática (CP-SEG-08) | DO-07 · DO-10 |

## 3. Rendimiento y disponibilidad

| ID | Requisito | Valor / criterio | Prior. | Comprobación | Origen |
|---|---|---|---|---|---|
| RNF-REN-01 | El inventario debe cargar rápido | Contenido principal visible en 2 s o menos en un ordenador con la conexión de la oficina [R] | M | Medición con una herramienta de rendimiento | SF-09 · ES-01 |
| RNF-REN-02 | La búsqueda en el inventario debe responder casi al instante | Resultados en menos de 1 s [R] | M | Medición en la prueba funcional | ES-02 |
| RNF-REN-03 | La consulta de varias aulas debe responder en un tiempo razonable | Datos de las doce aulas en 10 s o menos, o mostrados desde la última consulta guardada indicando su hora [R] | S | Medición contra el aula de pruebas | RF-11 · ES-06 |
| RNF-REN-04 | La plataforma debe estar disponible en horario laboral | 99 % en horario laboral [R] | S | Supervisión durante la validación | N-10 · SF-09 |
| RNF-REN-05 | Una caída de la plataforma no debe impedir gestionar las aulas | Las aulas siguen funcionando con su dirección directa; la guía incluye la lista de direcciones | M | Prueba de caída (CP-REN-05) | N-10 · ES-13 |
| RNF-REN-06 | La plataforma debe poder recuperarse en poco tiempo | Restaurar el servicio en 1 día laborable como máximo, sin perder más que el último cambio no guardado [R] | M | Prueba de restauración (CP-MAN-03) | N-10 |
| RNF-REN-07 | La consulta y los cambios no deben afectar al rendimiento de las aulas | Consultas automáticas espaciadas (como referencia, una actualización por aula cada hora como máximo); consultas y cambios pedidos por el personal en lotes, nunca más de una petición simultánea por aula [R] | S | Revisión de la configuración y medición contra el aula de pruebas | SF-05 · Ficha (pruebas no intrusivas) |
| RNF-REN-08 | Un cambio global debe terminar en un tiempo razonable y con resultado claro | Un cambio sobre una persona en las doce aulas termina en 2 minutos o menos [R], con resultado por aula; un aula que falla no detiene las demás | S | Medición contra dos o más aulas de prueba (CP-REN-06) | RF-20 · DO-04 |

## 4. Mantenimiento

| ID | Requisito | Valor / criterio | Prior. | Comprobación | Origen |
|---|---|---|---|---|---|
| RNF-MAN-01 | Una persona del DPE, sin conocimientos de programación, debe poder dar de alta un aula | En 15 minutos o menos siguiendo la guía [R] | M | Prueba de transferencia (CP-MAN-01) | N-06 · SF-13 · ES-07 |
| RNF-MAN-02 | Debe existir una guía de operación | Altas, cambios, ocultación, revisión periódica, permisos, copia y restauración, qué hace el DPE y qué hace Informática | M | Revisión de la guía y prueba de transferencia | N-06 · N-15 |
| RNF-MAN-03 | El inventario debe tener copia y versiones | Copia fuera del servidor y posibilidad de volver a cualquier versión anterior | M | Prueba de restauración (CP-MAN-03) | N-10 |
| RNF-MAN-04 | Debe haber responsables designados y revisión periódica | DPE para el contenido del inventario; Informática para la parte técnica y los permisos; revisión completa cada 90 días [R] | M | Procedimiento aprobado por la organización | RS-01 · RS-09 · RS-12 · SF-13 |
| RNF-MAN-05 | Los componentes de terceros deben estar revisados | Licencia compatible, mantenimiento activo y lista documentada | M | Inventario de dependencias y licencias | Ficha (límites del encargo) |
| RNF-MAN-06 | El esfuerzo de mantenimiento debe ser bajo y estimable | 8 horas al mes o menos entre el DPE e Informática en funcionamiento normal [S] (antes 4: ahora hay lectura y escritura en las aulas), a validar en el estudio de viabilidad | S | Estimación de esfuerzo en el estudio de viabilidad | RS-09 · SF-08 |
| RNF-MAN-07 | Otra persona debe poder entender y continuar el proyecto | Documentación con instrucciones de instalación, ejecución y operación | M | Prueba de transferencia | Ficha · RP-06 |
| RNF-MAN-08 | La integración debe sobrevivir a las actualizaciones de Moodle | Lista documentada de las funciones de servicios web usadas y prueba de la consulta y de los cambios tras actualizar un aula | **M** (antes S) | Revisión de la documentación y prueba en el aula de pruebas | SF-07 · RS-06 · DO-05 |
| RNF-MAN-09 | La plataforma debe funcionar con aulas en **versiones distintas** de Moodle a la vez | Detecta la versión y las funciones disponibles en cada aula (RF-13) y desactiva en esa aula lo que no esté disponible, en lugar de fallar; se prueba al menos con dos versiones (por ejemplo, 4.1.18 y una anterior) | M | Prueba con dos aulas de prueba de versiones distintas (CP-MAN-07) | DO-05 · SF-07 |

## 5. Control de versiones

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| 0.1 | 2026-11-03 | Claude (UX / Seguridad / Arquitecto) | Primera versión: 30 requisitos no funcionales en cuatro grupos. [Archivada](historico/04-requisitos-no-funcionales_v0.1.md) |
| 0.2 | 2026-11-04 | Claude (UX / Seguridad / Arquitecto) | Enfoque de gestión interna: 34 requisitos (8 de usabilidad y accesibilidad, 11 de seguridad, 7 de rendimiento y 8 de mantenimiento). [Archivada](historico/04-requisitos-no-funcionales_v0.2.md) |
| 0.3 | 2026-11-05 | Claude (UX / Seguridad / Arquitecto) | Respuestas de Grupo ATU: 39 requisitos (9 de usabilidad, 13 de seguridad, 8 de rendimiento y 9 de mantenimiento). Revisados SEG-06, SEG-07, SEG-08 (sube a M), REN-07, MAN-06 y MAN-08 (sube a M); nuevos UX-09, SEG-12, SEG-13, REN-08 y MAN-09. [Archivada](historico/04-requisitos-no-funcionales_v0.3.md) |
| 0.4 | 2026-11-05 | Claude (Seguridad) | RNF-SEG-13 concretado con las normas recibidas (DO-10); sigue habiendo 39 requisitos |
