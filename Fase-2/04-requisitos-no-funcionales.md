# 04 — Requisitos no funcionales

| Campo | Valor |
|---|---|
| Versión | 0.1 |
| Fecha | 2026-11-03 |
| Estado | Revisión del propietario |
| Redacción | Claude (roles UX, Seguridad y Arquitecto), a petición del alumno |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |

Cuatro grupos de la ficha, cada uno con su forma de comprobación:

| Grupo | Contenido mínimo (ficha) | Forma de comprobación (ficha) |
|---|---|---|
| Usabilidad y accesibilidad (RNF-UX) | Navegación, comprensión, consistencia, dispositivos y necesidades de acceso | Revisión heurística y pruebas con tareas |
| Seguridad y privacidad (RNF-SEG) | Autorización, protección de datos, registro, secretos y exposición de información | Análisis de riesgos y pruebas autorizadas |
| Rendimiento y disponibilidad (RNF-REN) | Tiempos de respuesta, carga prevista, continuidad y recuperación | Métricas, supuestos y pruebas proporcionadas |
| Mantenimiento (RNF-MAN) | Actualizaciones, altas y bajas, documentación, copias y responsabilidades | Procedimiento de operación y estimación de esfuerzo |

**Sobre los valores numéricos.** No hay datos de uso de la organización. Los valores son **propuestas razonadas [R]** o **supuestos [S]** y se indica en qué se basan. Se revisarán cuando haya datos (RP-09).

## 1. Usabilidad y accesibilidad

| ID | Requisito | Valor / criterio | Prior. | Comprobación | Origen |
|---|---|---|---|---|---|
| RNF-UX-01 | La plataforma debe cumplir las pautas de accesibilidad de referencia | WCAG 2.2 nivel AA, sin incumplimientos en la revisión. No se afirma conformidad hasta probarla | M | Lista de comprobación WCAG 2.2 AA, revisión automática y manual, prueba con lector de pantalla | N-08 · SF-13 · RS-08 |
| RNF-UX-02 | La plataforma debe adaptarse a cualquier tamaño de pantalla | Uso completo desde 320 px de ancho sin desplazamiento horizontal y con texto ampliado al 200 % | M | Matriz de dispositivos (móvil, tableta, ordenador) | N-08 · SF-08 · ES-04 |
| RNF-UX-03 | Un usuario nuevo debe encontrar su campus sin ayuda | Al menos el 80 % de los usuarios de prueba llega a la página de acceso correcta sin ayuda y en menos de 1 minuto [R] | M | Prueba con tareas (ES-01, ES-02, ES-03) con usuarios representativos | N-01 · PR-07 · PG-10 |
| RNF-UX-04 | Todo se debe poder usar solo con teclado y con lector de pantalla | Foco visible, orden lógico, sin trampas de teclado; resultados y mensajes anunciados | M | Prueba manual con teclado y con un lector de pantalla (NVDA o VoiceOver) | N-08 · ES-12 |
| RNF-UX-05 | Los textos deben estar en lenguaje claro | Frases cortas, sin tecnicismos («campus», no «instancia»); la ayuda la entiende una persona sin conocimientos técnicos | S | Revisión heurística y comentarios de la prueba con tareas | N-01 · N-08 |
| RNF-UX-06 | El idioma debe estar declarado y ser coherente | Interfaz en español con el idioma declarado en la página; los campus en otro idioma se señalan (RF-02) | M | Revisión del código de la página y revisión heurística | SF-07 · H-08 |
| RNF-UX-07 | La presentación debe ser consistente | Todos los campus se muestran con la misma estructura de información; los enlaces externos se señalan siempre igual | S | Revisión heurística (heurísticas de Nielsen) | N-03 · RS-05 |
| RNF-UX-08 | La plataforma debe respetar la identidad de las marcas o declarar que no lo hace | Logotipos sin deformar y con permiso; decisión de identidad común registrada | S | Revisión con la organización | N-09 · P-O06 · P-L03 |

## 2. Seguridad y privacidad

| ID | Requisito | Valor / criterio | Prior. | Comprobación | Origen |
|---|---|---|---|---|---|
| RNF-SEG-01 | La parte pública no debe tratar datos personales | Ningún formulario, cuenta ni registro con datos de usuarios finales | M | Revisión del código y de las peticiones de red | N-07 · RS-03 · SF-03 |
| RNF-SEG-02 | La plataforma nunca debe pedir, recibir, guardar ni reenviar credenciales de los campus | Ningún campo de usuario o contraseña de los campus en ninguna página | M | Revisión del código y prueba funcional (CP-F-04) | RS-04 · W-03 |
| RNF-SEG-03 | Todas las comunicaciones deben ir cifradas | Solo HTTPS, con redirección desde HTTP y certificado válido | M | Comprobación de la configuración del servidor | N-07 |
| RNF-SEG-04 | Solo se deben admitir direcciones de campus de dominios autorizados | Lista de dominios permitidos mantenida por la organización; HTTPS obligatorio | M | Prueba funcional con una dirección no permitida (CP-F-06) | RS-02 |
| RNF-SEG-05 | No debe haber cookies ni rastreadores que exijan consentimiento | Sin cookies no técnicas ni recursos de terceros que rastreen (tipografías, analítica, vídeos) | M | Revisión de las peticiones de red y de las cookies | SF-14 · RS-03 |
| RNF-SEG-06 | Solo las personas autorizadas deben poder cambiar el catálogo | Cambios con identificación; los secretos (contraseñas de gestión, claves) nunca en el repositorio | M | Revisión de permisos y búsqueda de secretos en el repositorio | RS-02 · Ficha («secretos») |
| RNF-SEG-07 | Los cambios de dirección de un campus deben revisarse por una segunda persona | Doble revisión antes de publicar un cambio de dirección | S | Revisión del procedimiento de operación | RS-02 |
| RNF-SEG-08 | La plataforma debe mostrar la información legal | Responsable, aviso legal y, si aplica, política de privacidad, coherentes con los de los campus | M | Revisión con la organización | A-09 · P-L01 |
| RNF-SEG-09 | La plataforma debe aplicar las protecciones básicas del navegador | Cabeceras de seguridad (política de contenido, protección frente a incrustación) y enlaces externos sin acceso a la página de origen | S | Comprobación de cabeceras con una herramienta pública | RS-02 |

## 3. Rendimiento y disponibilidad

| ID | Requisito | Valor / criterio | Prior. | Comprobación | Origen |
|---|---|---|---|---|---|
| RNF-REN-01 | La página principal debe cargar rápido en un móvil | Contenido principal visible en 2,5 s o menos con conexión móvil simulada [R] (umbral «bueno» de las métricas web de Google) | M | Medición con una herramienta de rendimiento en modo móvil | SF-08 · ES-04 |
| RNF-REN-02 | La búsqueda debe responder casi al instante | Resultados en menos de 1 s desde que se termina de escribir [R] | M | Medición en la prueba funcional | ES-01 |
| RNF-REN-03 | La plataforma debe soportar la carga prevista | Al menos 10 veces el pico supuesto sin degradarse [S] (SF-09) | S | Prueba de carga proporcionada, solo contra la plataforma propia, nunca contra los campus | SF-09 |
| RNF-REN-04 | La plataforma debe estar disponible casi siempre | 99,5 % mensual [R] (unas 3,6 h de caída al mes como máximo) | S | Supervisión de disponibilidad durante la validación | N-10 |
| RNF-REN-05 | Una caída de la plataforma no debe impedir el acceso a ningún campus | La plataforma no se interpone en el acceso: los campus siguen funcionando con su dirección directa | M | Revisión del diseño (Fase 4) y prueba de caída (CP-REN-05) | N-10 · ES-13 |
| RNF-REN-06 | La plataforma debe poder recuperarse en poco tiempo | Restaurar el servicio en 1 día laborable como máximo, sin perder más que el último cambio no guardado del catálogo [R] | M | Prueba de restauración desde copia (CP-MAN-03) | N-10 · ES-13 |

## 4. Mantenimiento

| ID | Requisito | Valor / criterio | Prior. | Comprobación | Origen |
|---|---|---|---|---|---|
| RNF-MAN-01 | Una persona sin conocimientos de programación debe poder dar de alta un campus | En 15 minutos o menos siguiendo la guía [R] | M | Prueba de transferencia con una persona ajena al proyecto (CP-MAN-01) | N-06 · SF-05 · ES-09 |
| RNF-MAN-02 | Debe existir una guía de operación | Altas, cambios, ocultación, revisión periódica, copia y restauración, a quién avisar | M | Revisión de la guía y prueba de transferencia | N-06 · PG-08 |
| RNF-MAN-03 | El catálogo debe tener copia y versiones | Copia fuera del servidor y posibilidad de volver a cualquier versión anterior | M | Prueba de restauración (CP-MAN-03) | N-10 |
| RNF-MAN-04 | Debe haber un responsable y una revisión periódica | Responsable designado y revisión completa del catálogo cada 90 días [R] | M | Procedimiento de operación aprobado por la organización | RS-01 · RS-09 · SF-05 |
| RNF-MAN-05 | Los componentes de terceros deben estar revisados | Licencia compatible, mantenimiento activo y lista de componentes documentada | M | Inventario de dependencias y licencias | Ficha (límites del encargo) |
| RNF-MAN-06 | El esfuerzo de mantenimiento debe ser bajo y estimable | 2 horas al mes o menos en funcionamiento normal [S], a validar en la Fase 5 | S | Estimación de esfuerzo en el estudio de viabilidad | RS-09 · SF-06 |
| RNF-MAN-07 | Otra persona debe poder entender y continuar el proyecto | Documentación con instrucciones de instalación, ejecución y operación | M | Prueba de transferencia (ficha, prueba de mantenimiento) | Ficha · RP-06 |

## 5. Control de versiones

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| 0.1 | 2026-11-03 | Claude (UX / Seguridad / Arquitecto) | Primera versión: 30 requisitos no funcionales en cuatro grupos |
