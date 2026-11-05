# 05 — Matriz de trazabilidad y casos de prueba

| Campo | Valor |
|---|---|
| Versión | 0.3 |
| Fecha | 2026-11-05 |
| Estado | Revisión del propietario |
| Redacción | Claude (roles Analista y QA), a petición del alumno |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |

La ficha valora la «conexión entre necesidades, requisitos y pruebas» (criterio *Requisitos y trazabilidad*, 15 %). Este documento permite seguir cualquier requisito hacia atrás, hasta la necesidad o el problema que lo origina, y hacia delante, hasta la prueba que lo comprobará. Los casos de prueba solo se **definen** aquí; se ejecutan en la Fase 7.

> **v0.2.** Matriz rehecha para el enfoque de gestión interna. Las necesidades y problemas son los de la [Fase 1, v0.3 del documento 05](../Fase-1/05-situacion-actual.md). La v0.1 está en el [histórico](historico/05-matriz-trazabilidad_v0.1.md).

> **v0.3 (2026-11-05).** Se añade la necesidad **N-16**, expresada por Grupo ATU (DO-04), y se trazan los requisitos nuevos o que suben de prioridad (RF-15, RF-16, RF-17, RF-19 a RF-21 y los no funcionales nuevos). 47 casos de prueba. La v0.2 está en el [histórico](historico/05-matriz-trazabilidad_v0.2.md).

**Regla para todas las pruebas:** nunca se prueba contra las aulas reales salvo para cargar su página pública. Todo lo que exija identificarse en un aula o usar sus servicios web, **y en especial cualquier cambio**, se hace en un **aula o perfil de prueba** sin datos reales (SF-05). Para las pruebas con versiones distintas y con cambios globales hacen falta **al menos dos aulas de prueba**.

**Necesidad nueva (v0.3).** N-16 *Gestionar el alumnado y sus accesos en todas las aulas, con cambios globales o individuales, desde un único punto.* Origen: respuesta de Grupo ATU a la pregunta 4 (DO-04). Se define aquí y se llevará al documento 05 de la Fase 1 en su próxima revisión.

## 1. De las necesidades a las pruebas

| Necesidad (Fase 1) | Escenarios | Requisitos | Casos de prueba |
|---|---|---|---|
| **N-16 Gestionar el alumnado y sus accesos en todas las aulas, con cambios globales o individuales** | ES-03, ES-14, ES-15, ES-16, ES-17 | RF-15, RF-17, RF-19, RF-20, RF-21 (RF-22 *Could*) · RNF-UX-09, RNF-SEG-07, RNF-SEG-08, RNF-SEG-12, RNF-REN-07, RNF-REN-08, RNF-MAN-08, RNF-MAN-09 | CP-F-15 a CP-F-19, CP-UX-06, CP-SEG-02, CP-SEG-06, CP-SEG-07, CP-REN-03, CP-REN-06, CP-MAN-06, CP-MAN-07 |
| N-11 Gestionar cualquier aula desde un único punto | ES-02, ES-03, ES-05, ES-18 | RF-04, RF-05, RF-12, RF-16 · RNF-UX-03, RNF-UX-08, RNF-REN-01, RNF-REN-02 | CP-F-04, CP-F-05, CP-F-12, CP-F-20, CP-UX-01, CP-REN-01, CP-REN-02 |
| N-12 Vista de conjunto de las aulas | ES-01, ES-10 | RF-03, RF-05, RF-13 | CP-F-03, CP-F-05, CP-F-13 |
| N-13 Consultar información de varias aulas sin entrar | ES-05, ES-06, ES-14 | RF-11, RF-12, RF-17 · RNF-REN-03, RNF-REN-07 (RF-18 *Could*) | CP-F-11, CP-F-12, CP-F-16, CP-REN-03 |
| N-14 Acceso solo para personal autorizado | ES-11, ES-18 | RF-01, RF-02, RF-10, RF-16, RF-21 · RNF-SEG-01, RNF-SEG-05, RNF-SEG-06, RNF-SEG-08, RNF-SEG-09, RNF-SEG-12, RNF-SEG-13 | CP-F-01, CP-F-02, CP-F-10, CP-F-19, CP-F-20, CP-SEG-01, CP-SEG-04 a CP-SEG-08 |
| N-15 Reparto claro entre el DPE e Informática | ES-07, ES-11 | RF-02, RF-06 · RNF-MAN-02, RNF-MAN-04 | CP-F-02, CP-F-06, CP-MAN-02 |
| N-03 Distinguir un aula de otra | ES-04 | RF-03, RF-04 · RNF-UX-05, RNF-UX-07 | CP-F-03, CP-F-04, CP-UX-05 |
| N-05 Información fiable para el CAU | ES-05 | RF-02 (rol de consulta), RF-03, RF-05 | CP-F-02, CP-F-03, CP-F-05 |
| N-06 Mantener la información con poco esfuerzo | ES-07, ES-08 | RF-06 a RF-09 · RNF-MAN-01, RNF-MAN-02, RNF-MAN-04, RNF-MAN-06 | CP-F-06 a CP-F-09, CP-MAN-01, CP-MAN-02, CP-MAN-05 |
| N-07 No exponer información innecesaria | — (transversal) | RNF-SEG-02, RNF-SEG-03, RNF-SEG-07, RNF-SEG-11 | CP-F-04, CP-SEG-02, CP-SEG-03 |
| N-08 Distintos dispositivos y capacidades | ES-12 | RNF-UX-01, RNF-UX-02, RNF-UX-04, RNF-UX-06 | CP-UX-02, CP-UX-03, CP-UX-04 |
| N-10 Que el servicio siga y se recupere | ES-08, ES-09, ES-13 | RF-07, RF-13, RF-14 · RNF-REN-04 a RNF-REN-06, RNF-MAN-03, RNF-MAN-08, RNF-MAN-09 | CP-F-07, CP-F-13, CP-F-14, CP-REN-04, CP-REN-05, CP-MAN-03, CP-MAN-06, CP-MAN-07 |

**Fuera del enfoque (con motivo):** N-01 (saber qué aula le corresponde), N-02 (llegar sin recordar la URL) y N-04 (ver juntas todas sus aulas) eran necesidades del alumnado, que ya entra con la URL de su curso (DT-03, W-04). N-09 (identidad de las marcas) pierde relevancia porque la herramienta es interna.

**Cobertura:** las doce necesidades dentro del enfoque tienen al menos un requisito *Must* o *Should*. **N-16 y N-13 dependen de la viabilidad** de la integración; si no es viable, solo quedarían cubiertas en parte por los accesos directos (RF-04), lo que la organización considera insuficiente (DO-04).

## 2. De los problemas a los requisitos

| Problema (Fase 1) | Requisitos que lo atacan | Observación |
|---|---|---|
| PR-09 Gestión dispersa: entrar y salir de cada aula | RF-04, RF-05, RF-11, RF-12, RF-15, RF-16, RF-17, RF-19, RF-20 | Núcleo del enfoque. Los accesos directos lo reducen poco; la consulta y los cambios desde la plataforma son lo que pide la organización (DO-04) |
| PR-01 No hay un punto común | RF-03, RF-04 | Ahora, punto común para la gestión |
| PR-03 Cinco aulas con el mismo título | RF-03, RNF-UX-07 | Se resuelve en la plataforma con nombres propios, sin tocar las aulas |
| PR-04 Configuración incoherente entre aulas | RF-03, RF-13 | Solo se señala; corregirla queda fuera (W-01) |
| PR-05 Cuentas separadas por aula | RF-16 (*Should*), RNF-SEG-02, RNF-SEG-12 | Confirmado (DO-03). Microsoft 365 existe (DO-07); activarlo en cada aula es decisión de Informática |
| PR-06 y PR-10 Moodle sin soporte y versiones distintas | RF-13, RNF-MAN-08, RNF-MAN-09, W-06 | La más actualizada es 4.1.18 y varían entre aulas (DO-05). Condiciona la consulta y los cambios (SF-07) |
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
| CP-F-15 | RF-15, RF-21 | Suspender, reactivar, matricular, desmatricular y cambiar el rol de una persona; el aula refleja el cambio; un rechazo del aula se muestra y no se da por hecho | **Aula de pruebas** con personas y cursos ficticios |
| CP-F-16 | RF-17, RNF-SEG-07 | Alumnado de un aula con cursos, estado y último acceso; búsqueda de una persona en dos aulas; aula caída; persona sin permiso en un aula no ve sus datos; nada guardado de forma permanente | **Dos aulas de pruebas** con una persona ficticia en ambas |
| CP-F-17 | RF-19 | Cuentas sin acceso en más de 90 días, que nunca han entrado y suspendidas; filtros; paso a la vista previa | **Aula de pruebas** con 3 inactivas, 2 sin entrar y 1 suspendida |
| CP-F-18 | RF-20, RNF-REN-08 | Suspender a una persona en todas sus aulas; resultado por aula; un aula caída no detiene las demás y se puede reintentar solo esa | **Dos aulas de pruebas** y una dirección que no responde |
| CP-F-19 | RF-21 | Nada se aplica sin confirmar; confirmación reforzada con más de una aula o más de 10 personas; registro completo; deshacer una suspensión | **Aula de pruebas** |
| CP-F-20 | RF-16 | Entrada en la plataforma con una cuenta corporativa de prueba; entrada en un aula de prueba con la identificación corporativa habilitada | Cuenta de prueba de Microsoft 365 y **aula de pruebas** (con autorización de Informática) |

### 3.2 Casos de usabilidad, accesibilidad y adaptación

| Caso | Requisitos | Qué se comprueba | Método |
|---|---|---|---|
| CP-UX-01 | RNF-UX-03, RNF-UX-08 · ES-02, ES-03, ES-04 | Acciones y tiempo hasta la página de gestión correcta, con la plataforma y por el camino actual; puntuación SUS | Prueba con tareas con 3 a 5 personas del DPE o, si no es posible, con perfiles equivalentes [R]; sobre aulas de pruebas; con consentimiento y sin datos personales en las evidencias |
| CP-UX-02 | RNF-UX-01, RNF-UX-06 | Criterios WCAG 2.2 AA e idioma declarado | Herramienta automática + lista de comprobación manual |
| CP-UX-03 | RNF-UX-04 · ES-12 | Uso completo con teclado y lector de pantalla | Recorrido de ES-01 y ES-02 con NVDA o VoiceOver |
| CP-UX-04 | RNF-UX-02 | Ordenador, tableta y consulta en móvil; 320 px; ampliación al 200 % | Matriz de dispositivos y tamaños |
| CP-UX-05 | RNF-UX-05, RNF-UX-07 | Vocabulario del personal; siempre visible en qué aula se actúa | Revisión heurística (Nielsen) |
| CP-UX-06 | RNF-UX-09 · ES-17 | Tiempo y pasos de un cambio en 5 aulas con la plataforma frente al camino actual | Prueba con tareas sobre aulas de pruebas, con las mismas personas que CP-UX-01 |

### 3.3 Casos de seguridad y privacidad

Solo sobre la plataforma propia y el aula de pruebas, dentro del alcance autorizado. Nunca sobre las aulas reales.

| Caso | Requisitos | Qué se comprueba |
|---|---|---|
| CP-SEG-01 | RNF-SEG-01, RNF-SEG-09 | Identificación con doble factor; bloqueo tras intentos fallidos; sin acceso ni indexación desde fuera para una cuenta no autorizada |
| CP-SEG-02 | RNF-SEG-02, RNF-SEG-07, RNF-SEG-11 | Ninguna contraseña de las aulas; datos del alumnado solo en la consulta, sin copia permanente (copia temporal borrada en 24 h como máximo); solo la cookie de sesión |
| CP-SEG-03 | RNF-SEG-03, RNF-SEG-10 | HTTPS con redirección; cabeceras de seguridad |
| CP-SEG-04 | RNF-SEG-05 | Permisos mínimos por rol y procedimiento de revisión de cuentas |
| CP-SEG-05 | RNF-SEG-06 | Claves por aula con solo las funciones necesarias; lectura y escritura separadas; fuera del repositorio y de la interfaz; revocables |
| CP-SEG-06 | RNF-SEG-08, RF-10, RF-21 | Registros de entradas, permisos, consultas de datos del alumnado y cambios en las aulas, conservados y no modificables |
| CP-SEG-07 | RNF-SEG-12, RF-02 | Una cuenta de gestión sin permiso de matricular en un aula de prueba no puede hacerlo desde la plataforma |
| CP-SEG-08 | RNF-SEG-13 | Lista de comprobación de las normas internas de Grupo ATU revisada con Informática |

### 3.4 Casos de rendimiento y disponibilidad

| Caso | Requisitos | Qué se comprueba |
|---|---|---|
| CP-REN-01 | RNF-REN-01 | Tiempo hasta el contenido principal ≤ 2 s en ordenador |
| CP-REN-02 | RNF-REN-02 | Resultados de búsqueda en menos de 1 s |
| CP-REN-03 | RNF-REN-03, RNF-REN-07 | Tiempo de la consulta agregada y número y frecuencia de peticiones, contra el aula de pruebas |
| CP-REN-04 | RNF-REN-04 | Disponibilidad en horario laboral durante la validación |
| CP-REN-05 | RNF-REN-05 | Con la plataforma detenida, las aulas siguen accesibles por su dirección y la guía tiene la lista |
| CP-REN-06 | RNF-REN-08 | Duración de un cambio global y resultado por aula, contra dos o más aulas de prueba |

### 3.5 Casos de mantenimiento

| Caso | Requisitos | Qué se comprueba |
|---|---|---|
| CP-MAN-01 | RNF-MAN-01, RNF-MAN-02, RNF-MAN-07 | Prueba de transferencia: una persona ajena da de alta un aula de prueba con la guía en 15 minutos o menos |
| CP-MAN-02 | RNF-MAN-02, RNF-MAN-04 | La guía cubre todas las operaciones y el reparto DPE / Informática, con responsables y calendario |
| CP-MAN-03 | RNF-MAN-03, RNF-REN-06 | Restaurar el servicio y el inventario desde la copia en 1 día laborable o menos |
| CP-MAN-04 | RNF-MAN-05 | Inventario de componentes con licencia y estado de mantenimiento |
| CP-MAN-05 | RNF-MAN-06 | Estimación de esfuerzo mensual (se hace en la Fase 5) |
| CP-MAN-06 | RNF-MAN-08 | Documentación de las funciones de servicios web usadas y repetición de CP-F-11, CP-F-15 y CP-F-16 tras actualizar el aula de pruebas |
| CP-MAN-07 | RNF-MAN-09, RF-13 | Con dos aulas de prueba de versiones distintas, la plataforma detecta la versión y las funciones de cada una y desactiva lo no disponible sin fallar |

## 4. Comprobación de cobertura

| Comprobación | Resultado |
|---|---|
| Necesidades dentro del enfoque con al menos un requisito | 12 de 12 (N-13 y N-16 dependen de la viabilidad) |
| Necesidades fuera del enfoque con motivo escrito | 4 de 4 (N-01, N-02, N-04, N-09) |
| Requisitos *Must* y *Should* con caso de prueba | 20 de 20 funcionales; 39 de 39 no funcionales |
| Requisitos sin origen | Ninguno |
| Grupos de requisitos de la ficha cubiertos | Todos (funcionales y los cuatro no funcionales) |
| Casos de prueba definidos | 47 (20 funcionales, 6 de usabilidad, 8 de seguridad, 6 de rendimiento y 7 de mantenimiento) |

## 5. Si cae un supuesto

| Supuesto | Requisitos a revisar |
|---|---|
| SF-01 (20 a 30 personas; confirmado en parte) | RF-02, RNF-SEG-05 |
| SF-02 (todas las tareas de gestión; confirmado) | RF-04, RF-11, RF-15 |
| SF-03 (una cuenta y roles distintos por aula; confirmado) | RF-04, RF-16, RNF-SEG-12 |
| SF-04 (Microsoft 365, sin constar su conexión a las aulas) | RF-01, RF-16, RNF-SEG-01 |
| SF-05 (sin tocar las aulas; perfil de prueba tras el plano) | RF-11 a RF-22 y todas las pruebas de integración |
| SF-06 (servicios web habilitables) | RF-11 a RF-15, RF-17, RF-19 a RF-22 |
| SF-07 (Moodle 4.1 o anterior, versiones distintas) | RF-13, RNF-SEG-06, RNF-MAN-08, RNF-MAN-09 |
| SF-08 (pocos cambios) | RF-09, RF-14, RNF-MAN-06 |
| SF-09 (uso en ordenador y horario laboral) | RNF-UX-02, RNF-REN-01, RNF-REN-04 |
| SF-10 (español) | RNF-UX-06 |
| SF-11 (WCAG 2.2 AA) | RNF-UX-01 |
| SF-13 (reparto DPE / Informática) | RF-02, RF-06 a RF-09, RNF-MAN-04 |
| SF-14 (el proyecto entrega «los planos»: documento breve + dosier) | Todos; plan de las fases 3 a 8 |
| SF-15 (datos del alumnado con la finalidad actual, sin copia permanente) | RF-17, RF-19, RNF-SEG-07, RNF-SEG-08 |
| SF-16 (qué significa «controles de accesos») | RF-19, RF-15 |
| SF-17 (qué significa «cambios globales») | RF-20, RF-22 |
| SF-18 (claves de servicio limitadas, lectura y escritura separadas) | RF-15, RF-20, RNF-SEG-06 |

## 6. Control de versiones

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| 0.1 | 2026-11-03 | Claude (Analista / QA) | Primera versión: trazabilidad de 10 necesidades y 8 problemas, 33 casos de prueba. [Archivada](historico/05-matriz-trazabilidad_v0.1.md) |
| 0.2 | 2026-11-04 | Claude (Analista / QA) | Enfoque de gestión interna: 11 necesidades dentro del enfoque y 4 fuera con motivo, 10 problemas, 36 casos de prueba y regla del aula de pruebas. [Archivada](historico/05-matriz-trazabilidad_v0.2.md) |
| 0.3 | 2026-11-05 | Claude (Analista / QA) | Respuestas de Grupo ATU: nueva necesidad N-16; 47 casos de prueba (nuevos CP-F-15 a CP-F-20, CP-UX-06, CP-SEG-07, CP-SEG-08, CP-REN-06 y CP-MAN-07); supuestos actualizados |
