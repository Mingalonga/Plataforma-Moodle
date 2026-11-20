# 05 — Matriz de trazabilidad y casos de prueba

| Campo | Valor |
|---|---|
| Versión | 0.1 |
| Fecha | 2026-11-03 |
| Estado | Revisión del propietario |
| Redacción | Claude (roles Analista y QA), a petición del alumno |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |

La ficha valora la «conexión entre necesidades, requisitos y pruebas» (criterio *Requisitos y trazabilidad*, 15 %). Este documento permite seguir cualquier requisito hacia atrás, hasta la necesidad o el problema que lo origina, y hacia delante, hasta la prueba que lo comprobará. Los casos de prueba solo se **definen** aquí; se ejecutan en la Fase 7.

## 1. De las necesidades a las pruebas

| Necesidad (Fase 1) | Escenarios | Requisitos | Casos de prueba |
|---|---|---|---|
| N-01 Saber qué campus le corresponde | ES-01, ES-02, ES-06, ES-07 | RF-01, RF-03, RF-05, RF-10, RF-14 · RNF-UX-03, RNF-UX-05 | CP-F-01, CP-F-03, CP-F-05, CP-F-10, CP-F-14, CP-UX-01 |
| N-02 Llegar a la página de acceso sin recordar la URL | ES-01, ES-04, ES-06 | RF-03, RF-04, RF-14 · RNF-REN-01, RNF-REN-02 | CP-F-03, CP-F-04, CP-F-14, CP-REN-01, CP-REN-02 |
| N-03 Distinguir un campus de otro | ES-03 | RF-02, RF-04 · RNF-UX-07 | CP-F-02, CP-F-04, CP-UX-01, CP-UX-05 |
| N-04 Ver juntos todos los campus en los que participa | ES-05 | RF-15, RF-16 (*Could*) | Sin caso: se cubre parcialmente con RF-01 y RF-03 (buscar cada campus) |
| N-05 Lista fiable para el CAU | ES-08 | RF-05, RF-12, RF-13 | CP-F-05, CP-F-12, CP-F-13 |
| N-06 Mantener la lista con poco esfuerzo | ES-09, ES-10, ES-11 | RF-06 a RF-09, RF-11 · RNF-MAN-01, RNF-MAN-02, RNF-MAN-04, RNF-MAN-06 | CP-F-06 a CP-F-09, CP-F-11, CP-MAN-01, CP-MAN-02, CP-MAN-05 |
| N-07 No exponer información innecesaria | — (transversal) | RNF-SEG-01 a RNF-SEG-06, RNF-SEG-08 | CP-F-04, CP-F-06, CP-SEG-01 a CP-SEG-04 |
| N-08 Móvil y distintas capacidades | ES-04, ES-12 | RNF-UX-01, RNF-UX-02, RNF-UX-04, RNF-UX-06 | CP-UX-02, CP-UX-03, CP-UX-04 |
| N-09 Respetar la identidad de cada marca | ES-03 | RF-02, RF-07 · RNF-UX-08 | CP-F-02, CP-F-07, CP-UX-05 |
| N-10 Que el servicio siga y se recupere | ES-10, ES-11, ES-13 | RF-07, RF-11 · RNF-REN-04 a RNF-REN-06, RNF-MAN-03 | CP-F-07, CP-F-11, CP-REN-04, CP-REN-05, CP-MAN-03 |

**Cobertura:** las diez necesidades tienen al menos un requisito. N-04 solo tiene requisitos *Could*, porque depende de una identidad común que no consta (SF-02); queda planificada y justificada, como pide la ficha.

## 2. De los problemas a los requisitos

| Problema (Fase 1) | Requisitos que lo atacan | Observación |
|---|---|---|
| PR-01 No hay un punto común | RF-01, RF-03, RF-04 | Núcleo del MVP |
| PR-02 Campus no localizables en buscadores | RF-03, RF-14 | La plataforma da un punto que sí se puede encontrar; no cambia el `noindex` de los campus (W-01) |
| PR-03 Cinco campus con el mismo título | RF-02 | Se resuelve en la plataforma, no en los campus |
| PR-04 Configuración incoherente entre campus | RF-02 (idioma del campus), RNF-UX-06 | Solo se señala; corregirla en los campus queda fuera (W-01) |
| PR-05 Cuentas separadas por campus | RF-16 (*Could*) | Sin necesidad demostrada |
| PR-06 Posible versión de Moodle sin soporte | W-05, SF-10 | Fuera del alcance; condiciona RF-17 |
| PR-07 No se sabe cuántos usuarios sufren el problema | RNF-UX-03, RF-18 (*Could*) | La prueba con tareas da una primera medida; la analítica, si se aprueba, daría datos reales |
| PR-08 Áreas de la web y marcas de los campus no coinciden | RF-03 (palabras clave), RF-10 | Depende de P-V09 |

## 3. De los requisitos a las pruebas

Cada requisito *Must* y *Should* tiene al menos un caso. «Tipo» sigue las pruebas mínimas de la ficha (funcional, usabilidad, accesibilidad, adaptación, seguridad, mantenimiento).

### 3.1 Casos funcionales

| Caso | Requisitos | Qué se comprueba | Datos de prueba |
|---|---|---|---|
| CP-F-01 | RF-01 | Se ven todos los campus visibles y ninguno oculto; no se pide identificarse | Catálogo con 12 campus visibles y 1 oculto |
| CP-F-02 | RF-02 | Campos obligatorios presentes; nombres descriptivos únicos; dominio coherente; aviso de idioma en el entorno 4 | Catálogo real de 12 campus (solo datos públicos) |
| CP-F-03 | RF-03 | Búsqueda por parte del nombre, sin mayúsculas ni tildes, por palabra clave y por dominio; los ocultos no salen; número de resultados anunciado | «tierra», «ECOLÓGICA», «centre», una palabra clave, un dominio |
| CP-F-04 | RF-04, RNF-SEG-02 | Una acción para llegar a la página de acceso; aviso de salida y dominio; ninguna credencial en la plataforma | Los 12 enlaces del catálogo (carga de la página pública, sin iniciar sesión) |
| CP-F-05 | RF-05 | Mensaje de «sin resultados» con las tres opciones y el contacto del CAU | «xyz123» |
| CP-F-06 | RF-06, RNF-SEG-04 | Alta válida; alta sin campo obligatorio; dirección de dominio no permitido; dirección sin HTTPS | Campus ficticio de prueba |
| CP-F-07 | RF-07 | Ocultar y volver a mostrar sin perder datos | Campus ficticio de prueba |
| CP-F-08 | RF-08 | El registro muestra fecha, autor y cambio; se puede volver atrás | Tres cambios sobre el campus de prueba |
| CP-F-09 | RF-09 | Aviso de revisión caducada a los 90 días; actualización de la fecha | Campus de prueba con fecha antigua |
| CP-F-10 | RF-10 | Filtro por marca, combinación con búsqueda y quitar el filtro | Catálogo real |
| CP-F-11 | RF-11 | Aviso tras dos fallos seguidos; sin aviso si responde | **Dirección de prueba controlada por el proyecto**, nunca un campus real caído a propósito |
| CP-F-12 | RF-12 | Enlace a la ayuda en todas las páginas; contenido mínimo | — |
| CP-F-13 | RF-13 | El CAU ve estado y escalado; un usuario sin permiso no ve los contactos | Usuario de prueba con y sin permiso |
| CP-F-14 | RF-14 | El enlace propio de un campus sigue funcionando tras cambiar su dirección | Campus de prueba |

### 3.2 Casos de usabilidad, accesibilidad y adaptación

| Caso | Requisitos | Qué se comprueba | Método |
|---|---|---|---|
| CP-UX-01 | RNF-UX-03 · ES-01, ES-02, ES-03 | Porcentaje de usuarios que encuentran su campus sin ayuda y tiempo empleado | Prueba con tareas, 5 a 8 personas de perfiles distintos [R], con consentimiento y sin datos personales en las evidencias |
| CP-UX-02 | RNF-UX-01, RNF-UX-06 | Criterios WCAG 2.2 AA | Herramienta automática + lista de comprobación manual |
| CP-UX-03 | RNF-UX-04 · ES-12 | Uso completo con teclado y lector de pantalla | Recorrido de ES-01 y ES-02 con NVDA o VoiceOver |
| CP-UX-04 | RNF-UX-02 · ES-04 | Uso en móvil, tableta y ordenador; 320 px; ampliación al 200 % | Matriz de dispositivos y tamaños |
| CP-UX-05 | RNF-UX-05, RNF-UX-07, RNF-UX-08 | Claridad, consistencia, identidad de marca | Revisión heurística (Nielsen) |

### 3.3 Casos de seguridad y privacidad

Solo sobre la plataforma propia y dentro del alcance autorizado. Nunca sobre los campus.

| Caso | Requisitos | Qué se comprueba |
|---|---|---|
| CP-SEG-01 | RNF-SEG-01, RNF-SEG-05 | No hay formularios con datos personales, ni cookies no técnicas, ni peticiones a terceros que rastreen |
| CP-SEG-02 | RNF-SEG-03, RNF-SEG-09 | HTTPS con redirección; cabeceras de seguridad |
| CP-SEG-03 | RNF-SEG-06, RNF-SEG-07 | Solo personas autorizadas cambian el catálogo; doble revisión de direcciones; ningún secreto en el repositorio |
| CP-SEG-04 | RNF-SEG-08 | Información legal presente y coherente |

### 3.4 Casos de rendimiento y disponibilidad

| Caso | Requisitos | Qué se comprueba |
|---|---|---|
| CP-REN-01 | RNF-REN-01 | Tiempo hasta el contenido principal en móvil simulado ≤ 2,5 s |
| CP-REN-02 | RNF-REN-02 | Resultados de búsqueda en menos de 1 s |
| CP-REN-03 | RNF-REN-03 | Carga de 10 veces el pico supuesto, solo contra la plataforma propia |
| CP-REN-04 | RNF-REN-04 | Disponibilidad medida durante el periodo de validación |
| CP-REN-05 | RNF-REN-05 | Con la plataforma detenida, los campus siguen accesibles por su dirección directa |

### 3.5 Casos de mantenimiento

| Caso | Requisitos | Qué se comprueba |
|---|---|---|
| CP-MAN-01 | RNF-MAN-01, RNF-MAN-02, RNF-MAN-07 | Prueba de transferencia: una persona ajena da de alta un campus de prueba con la guía en 15 minutos o menos |
| CP-MAN-02 | RNF-MAN-02, RNF-MAN-04 | La guía cubre todas las operaciones y hay responsable y calendario de revisión |
| CP-MAN-03 | RNF-MAN-03, RNF-REN-06 | Restaurar el servicio y el catálogo desde la copia en 1 día laborable o menos |
| CP-MAN-04 | RNF-MAN-05 | Inventario de componentes con licencia y estado de mantenimiento |
| CP-MAN-05 | RNF-MAN-06 | Estimación de esfuerzo mensual (se hace en la Fase 5) |

## 4. Comprobación de cobertura

| Comprobación | Resultado |
|---|---|
| Necesidades N-01 a N-10 con al menos un requisito | 10 de 10 (N-04 solo con *Could*, justificado) |
| Requisitos *Must* y *Should* con caso de prueba | 14 de 14 funcionales; 30 de 30 no funcionales |
| Requisitos sin origen | Ninguno |
| Grupos de requisitos de la ficha cubiertos | 5 de 5 |

## 5. Si cae un supuesto

| Supuesto | Requisitos a revisar |
|---|---|
| SF-01 (el problema es encontrar el campus) | Todos los RF; prioridades de RF-15 a RF-17 |
| SF-02 (sin identidad común) | RF-15, RF-16 |
| SF-03 (catálogo público) | RF-01, RF-13, RNF-SEG-01 |
| SF-04 (todas las marcas juntas) | RF-01, RF-07, RF-10 |
| SF-05 (hay persona gestora) | RF-06 a RF-09, RNF-MAN-01, RNF-MAN-04 |
| SF-06 (pocos cambios) | RF-09, RF-11, RNF-MAN-06 |
| SF-07 (español) | RNF-UX-06 |
| SF-08 (uso desde móvil) | RNF-UX-02, RNF-REN-01 |
| SF-09 (carga baja) | RNF-REN-03 |
| SF-10 (sin integración con Moodle) | RF-17 |
| SF-11 (clasificación por marca y área) | RF-03, RF-10 |
| SF-12 (contacto común del CAU) | RF-05, RF-12 |
| SF-13 (WCAG 2.2 AA) | RNF-UX-01 |
| SF-14 (sin cookies ni analítica) | RNF-SEG-05, RF-18 |

## 6. Control de versiones

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| 0.1 | 2026-11-03 | Claude (Analista / QA) | Primera versión: trazabilidad de 10 necesidades y 8 problemas, 33 casos de prueba |
