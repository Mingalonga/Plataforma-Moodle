# 05 — Matriz de trazabilidad y casos de prueba

| Campo | Valor |
|---|---|
| Versión | 0.2 |
| Fecha | 2026-11-04 |
| Estado | Revisión del propietario |
| Redacción | Claude (roles Analista y QA), a petición del alumno |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |

La ficha valora la «conexión entre necesidades, requisitos y pruebas» (criterio *Requisitos y trazabilidad*, 15 %). Este documento permite seguir cualquier requisito hacia atrás, hasta la necesidad o el problema que lo origina, y hacia delante, hasta la prueba que lo comprobará. Los casos de prueba solo se **definen** aquí; se ejecutan en la Fase 7.

> **v0.2.** Matriz rehecha para el enfoque de gestión interna. Las necesidades y problemas son los de la [Fase 1, v0.3 del documento 05](../Fase-1/05-situacion-actual.md). La v0.1 está en el [histórico](historico/05-matriz-trazabilidad_v0.1.md).

**Regla para todas las pruebas:** nunca se prueba contra las aulas reales salvo para cargar su página pública. Todo lo que exija identificarse en un aula o usar sus servicios web se hace en un **aula de pruebas** sin datos reales (SF-05).

## 1. De las necesidades a las pruebas

| Necesidad (Fase 1) | Escenarios | Requisitos | Casos de prueba |
|---|---|---|---|
| N-11 Gestionar cualquier aula desde un único punto | ES-02, ES-03, ES-05 | RF-04, RF-05, RF-12 · RNF-UX-03, RNF-UX-08, RNF-REN-01, RNF-REN-02 | CP-F-04, CP-F-05, CP-F-12, CP-UX-01, CP-REN-01, CP-REN-02 |
| N-12 Vista de conjunto de las aulas | ES-01, ES-10 | RF-03, RF-05, RF-13 | CP-F-03, CP-F-05, CP-F-13 |
| N-13 Consultar información de varias aulas sin entrar | ES-05, ES-06 | RF-11, RF-12 · RNF-REN-03, RNF-REN-07 (RF-17, RF-18 *Could*) | CP-F-11, CP-F-12, CP-REN-03 |
| N-14 Acceso solo para personal autorizado | ES-11 | RF-01, RF-02, RF-10 · RNF-SEG-01, RNF-SEG-05, RNF-SEG-06, RNF-SEG-08, RNF-SEG-09 | CP-F-01, CP-F-02, CP-F-10, CP-SEG-01, CP-SEG-04, CP-SEG-05, CP-SEG-06 |
| N-15 Reparto claro entre el DPE e Informática | ES-07, ES-11 | RF-02, RF-06 · RNF-MAN-02, RNF-MAN-04 | CP-F-02, CP-F-06, CP-MAN-02 |
| N-03 Distinguir un aula de otra | ES-04 | RF-03, RF-04 · RNF-UX-05, RNF-UX-07 | CP-F-03, CP-F-04, CP-UX-05 |
| N-05 Información fiable para el CAU | ES-05 | RF-02 (rol de consulta), RF-03, RF-05 | CP-F-02, CP-F-03, CP-F-05 |
| N-06 Mantener la información con poco esfuerzo | ES-07, ES-08 | RF-06 a RF-09 · RNF-MAN-01, RNF-MAN-02, RNF-MAN-04, RNF-MAN-06 | CP-F-06 a CP-F-09, CP-MAN-01, CP-MAN-02, CP-MAN-05 |
| N-07 No exponer información innecesaria | — (transversal) | RNF-SEG-02, RNF-SEG-03, RNF-SEG-07, RNF-SEG-11 | CP-F-04, CP-SEG-02, CP-SEG-03 |
| N-08 Distintos dispositivos y capacidades | ES-12 | RNF-UX-01, RNF-UX-02, RNF-UX-04, RNF-UX-06 | CP-UX-02, CP-UX-03, CP-UX-04 |
| N-10 Que el servicio siga y se recupere | ES-08, ES-09, ES-13 | RF-07, RF-14 · RNF-REN-04 a RNF-REN-06, RNF-MAN-03, RNF-MAN-08 | CP-F-07, CP-F-14, CP-REN-04, CP-REN-05, CP-MAN-03, CP-MAN-06 |

**Fuera del enfoque (con motivo):** N-01 (saber qué aula le corresponde), N-02 (llegar sin recordar la URL) y N-04 (ver juntas todas sus aulas) eran necesidades del alumnado, que ya entra con la URL de su curso (DT-03, W-04). N-09 (identidad de las marcas) pierde relevancia porque la herramienta es interna.

**Cobertura:** las once necesidades dentro del enfoque tienen al menos un requisito *Must* o *Should*. N-13 depende de la viabilidad de la integración (requisitos *Should*); si no es viable, quedaría cubierta solo en parte por los accesos directos (RF-04).

## 2. De los problemas a los requisitos

| Problema (Fase 1) | Requisitos que lo atacan | Observación |
|---|---|---|
| PR-09 Gestión dispersa: entrar y salir de cada aula | RF-04, RF-05, RF-11, RF-12 (RF-15, RF-16 *Could*) | Núcleo del enfoque. Los accesos directos lo reducen; la consulta y el acceso único lo reducirían más |
| PR-01 No hay un punto común | RF-03, RF-04 | Ahora, punto común para la gestión |
| PR-03 Cinco aulas con el mismo título | RF-03, RNF-UX-07 | Se resuelve en la plataforma con nombres propios, sin tocar las aulas |
| PR-04 Configuración incoherente entre aulas | RF-03, RF-13 | Solo se señala; corregirla queda fuera (W-01) |
| PR-05 Cuentas separadas por aula | RF-16 (*Could*), RNF-SEG-02 | Sube de importancia; el acceso único depende de la viabilidad |
| PR-06 y PR-10 Moodle posiblemente sin soporte | RF-13, RNF-MAN-08, W-06 | Condiciona RF-11 y RF-12 (SF-07) |
| PR-07 Tamaño del problema sin medir | RNF-UX-03 (con línea base), RNF-UX-08 | La prueba con tareas compara la plataforma con la forma actual |
| PR-02, PR-08 | — | Fuera del enfoque: afectaban a la búsqueda por parte del alumnado |

## 3. De los requisitos a las pruebas

Cada requisito *Must* y *Should* tiene al menos un caso. «Tipo» sigue las pruebas mínimas de la ficha (funcional, usabilidad, accesibilidad, adaptación, seguridad, mantenimiento).

### 3.1 Casos funcionales

| Caso | Requisitos | Qué se comprueba | Datos de prueba |
|---|---|---|---|
| CP-F-01 | RF-01 | Sin identificarse no se ve nada; una cuenta no dada de alta o dada de baja no entra | Tres cuentas de prueba: alta, no dada de alta y dada de baja |
| CP-F-02 | RF-02 | Cada rol solo puede hacer lo suyo (consulta no modifica; gestión no da permisos; técnico sí) | Una cuenta de prueba por rol |
| CP-F-03 | RF-03 | Se ven todas las aulas visibles y ninguna oculta; campos obligatorios presentes; nombres propios únicos | Inventario con las 12 aulas (solo datos públicos) y 1 oculta |
| CP-F-04 | RF-04, RNF-SEG-02 | Cada acceso directo lleva a su página de gestión en una acción; nombra aula, página y dominio; ningún campo de contraseña en la plataforma | Accesos del **aula de pruebas** (en las reales solo se comprueba que el enlace apunta al dominio correcto, sin entrar) |
| CP-F-05 | RF-05 | Búsqueda sin mayúsculas ni tildes, por dominio; filtros por marca, estado y responsable; número de resultados anunciado | «tierra», «ECOLÓGICA», un dominio, filtro «en mantenimiento» |
| CP-F-06 | RF-06, RNF-SEG-04 | Alta válida; alta incompleta; dirección de un dominio no permitido; dirección sin HTTPS | Aula ficticia de prueba |
| CP-F-07 | RF-07 | Ocultar y volver a mostrar sin perder datos ni accesos | Aula ficticia de prueba |
| CP-F-08 | RF-08 | El registro muestra fecha, autor y cambio; se puede volver atrás | Tres cambios sobre el aula de prueba |
| CP-F-09 | RF-09 | Aviso de revisión caducada a los 90 días; actualización de la fecha | Aula de prueba con fecha antigua |
| CP-F-10 | RF-10 | Entradas, intentos fallidos y cambios de rol registrados; solo el rol técnico ve el registro | Cuentas de prueba de los tres roles |
| CP-F-11 | RF-11 | Datos agregados correctos y con su hora; un aula caída no bloquea las demás | **Aula de pruebas** con 3 cursos y 20 matrículas ficticias, y una dirección que no responde |
| CP-F-12 | RF-12 | Búsqueda de un curso existente e inexistente | **Aula de pruebas** |
| CP-F-13 | RF-13 | Señal de versión sin soporte para el rol técnico | Aula de prueba con versión antigua indicada |
| CP-F-14 | RF-14 | Aviso tras dos fallos seguidos; sin aviso si responde | **Dirección de prueba controlada por el proyecto**, nunca un aula real caída a propósito |

### 3.2 Casos de usabilidad, accesibilidad y adaptación

| Caso | Requisitos | Qué se comprueba | Método |
|---|---|---|---|
| CP-UX-01 | RNF-UX-03, RNF-UX-08 · ES-02, ES-03, ES-04 | Acciones y tiempo hasta la página de gestión correcta, con la plataforma y por el camino actual; puntuación SUS | Prueba con tareas con 3 a 5 personas del DPE o, si no es posible, con perfiles equivalentes [R]; sobre aulas de pruebas; con consentimiento y sin datos personales en las evidencias |
| CP-UX-02 | RNF-UX-01, RNF-UX-06 | Criterios WCAG 2.2 AA e idioma declarado | Herramienta automática + lista de comprobación manual |
| CP-UX-03 | RNF-UX-04 · ES-12 | Uso completo con teclado y lector de pantalla | Recorrido de ES-01 y ES-02 con NVDA o VoiceOver |
| CP-UX-04 | RNF-UX-02 | Ordenador, tableta y consulta en móvil; 320 px; ampliación al 200 % | Matriz de dispositivos y tamaños |
| CP-UX-05 | RNF-UX-05, RNF-UX-07 | Vocabulario del personal; siempre visible en qué aula se actúa | Revisión heurística (Nielsen) |

### 3.3 Casos de seguridad y privacidad

Solo sobre la plataforma propia y el aula de pruebas, dentro del alcance autorizado. Nunca sobre las aulas reales.

| Caso | Requisitos | Qué se comprueba |
|---|---|---|
| CP-SEG-01 | RNF-SEG-01, RNF-SEG-09 | Identificación con doble factor; bloqueo tras intentos fallidos; sin acceso ni indexación desde fuera para una cuenta no autorizada |
| CP-SEG-02 | RNF-SEG-02, RNF-SEG-07, RNF-SEG-11 | Ninguna contraseña de las aulas; ningún dato personal del alumnado guardado; solo la cookie de sesión |
| CP-SEG-03 | RNF-SEG-03, RNF-SEG-10 | HTTPS con redirección; cabeceras de seguridad |
| CP-SEG-04 | RNF-SEG-05 | Permisos mínimos por rol y procedimiento de revisión de cuentas |
| CP-SEG-05 | RNF-SEG-06 | Claves de servicio de solo lectura, fuera del repositorio y de la interfaz, y sustituibles |
| CP-SEG-06 | RNF-SEG-08, RF-10 | Registros conservados y visibles solo para el rol técnico |

### 3.4 Casos de rendimiento y disponibilidad

| Caso | Requisitos | Qué se comprueba |
|---|---|---|
| CP-REN-01 | RNF-REN-01 | Tiempo hasta el contenido principal ≤ 2 s en ordenador |
| CP-REN-02 | RNF-REN-02 | Resultados de búsqueda en menos de 1 s |
| CP-REN-03 | RNF-REN-03, RNF-REN-07 | Tiempo de la consulta agregada y número y frecuencia de peticiones, contra el aula de pruebas |
| CP-REN-04 | RNF-REN-04 | Disponibilidad en horario laboral durante la validación |
| CP-REN-05 | RNF-REN-05 | Con la plataforma detenida, las aulas siguen accesibles por su dirección y la guía tiene la lista |

### 3.5 Casos de mantenimiento

| Caso | Requisitos | Qué se comprueba |
|---|---|---|
| CP-MAN-01 | RNF-MAN-01, RNF-MAN-02, RNF-MAN-07 | Prueba de transferencia: una persona ajena da de alta un aula de prueba con la guía en 15 minutos o menos |
| CP-MAN-02 | RNF-MAN-02, RNF-MAN-04 | La guía cubre todas las operaciones y el reparto DPE / Informática, con responsables y calendario |
| CP-MAN-03 | RNF-MAN-03, RNF-REN-06 | Restaurar el servicio y el inventario desde la copia en 1 día laborable o menos |
| CP-MAN-04 | RNF-MAN-05 | Inventario de componentes con licencia y estado de mantenimiento |
| CP-MAN-05 | RNF-MAN-06 | Estimación de esfuerzo mensual (se hace en la Fase 5) |
| CP-MAN-06 | RNF-MAN-08 | Documentación de las funciones de servicios web usadas y repetición de CP-F-11 tras actualizar el aula de pruebas |

## 4. Comprobación de cobertura

| Comprobación | Resultado |
|---|---|
| Necesidades dentro del enfoque con al menos un requisito | 11 de 11 (N-13 depende de la viabilidad) |
| Necesidades fuera del enfoque con motivo escrito | 4 de 4 (N-01, N-02, N-04, N-09) |
| Requisitos *Must* y *Should* con caso de prueba | 14 de 14 funcionales; 34 de 34 no funcionales |
| Requisitos sin origen | Ninguno |
| Grupos de requisitos de la ficha cubiertos | Todos (funcionales y los cuatro no funcionales) |
| Casos de prueba definidos | 36 (14 funcionales, 5 de usabilidad, 6 de seguridad, 5 de rendimiento y 6 de mantenimiento) |

## 5. Si cae un supuesto

| Supuesto | Requisitos a revisar |
|---|---|
| SF-01 (pocas personas usuarias) | RF-02 |
| SF-02 (tareas de gestión habituales) | RF-04, RF-11, RF-12 |
| SF-03 (una cuenta por aula) | RF-04, RF-16 |
| SF-04 (sin directorio común conectado a las aulas) | RF-01, RF-16, RNF-SEG-01 |
| SF-05 (sin tocar las aulas; aula de pruebas) | RF-11 a RF-13, RF-15 y todas las pruebas de integración |
| SF-06 (servicios web habilitables) | RF-11, RF-12, RF-13 |
| SF-07 (Moodle 4.1 sin soporte) | RF-11 a RF-13, RNF-SEG-06, RNF-MAN-08 |
| SF-08 (pocos cambios) | RF-09, RF-14, RNF-MAN-06 |
| SF-09 (uso en ordenador y horario laboral) | RNF-UX-02, RNF-REN-01, RNF-REN-04 |
| SF-10 (español) | RNF-UX-06 |
| SF-11 (WCAG 2.2 AA) | RNF-UX-01 |
| SF-12 (solo datos agregados) | RF-11, RF-17, RNF-SEG-07 |
| SF-13 (reparto DPE / Informática) | RF-02, RF-06 a RF-09, RNF-MAN-04 |
| SF-14 (el proyecto termina en viabilidad y prototipo) | Todos; plan de las fases 5 a 8 |

## 6. Control de versiones

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| 0.1 | 2026-11-03 | Claude (Analista / QA) | Primera versión: trazabilidad de 10 necesidades y 8 problemas, 33 casos de prueba. [Archivada](historico/05-matriz-trazabilidad_v0.1.md) |
| 0.2 | 2026-11-04 | Claude (Analista / QA) | Enfoque de gestión interna: 11 necesidades dentro del enfoque y 4 fuera con motivo, 10 problemas, 36 casos de prueba y regla del aula de pruebas |
