# 03 — Requisitos funcionales

| Campo | Valor |
|---|---|
| Versión | 0.3 |
| Fecha | 2026-11-05 |
| Estado | Revisión del propietario |
| Redacción | Claude (roles Analista y Arquitecto), a petición del alumno |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |

Funciones y acciones que necesitan los distintos perfiles (ficha, grupo «Funcionales»). Se comprueban con **criterios de aceptación** y **casos de prueba** (ver [05](05-matriz-trazabilidad.md)).

> **v0.3 (2026-11-05).** Grupo ATU ha dicho qué quiere (DO-04): ver a los alumnos de forma global y por aula, controlar accesos y hacer cambios globales o individuales; los enlaces no bastan. Por eso **los cambios desde la plataforma y la vista de alumnos pasan de futuro a imprescindibles**, el acceso con la cuenta corporativa sube a conveniente y se añaden RF-19 a RF-22. **Se mantienen los identificadores de la v0.2**; los nuevos continúan la numeración. La v0.2 está en el [histórico](historico/03-requisitos-funcionales_v0.2.md).

**Prioridad (MoSCoW):** **M** imprescindible: forma parte de lo que la organización pide y del prototipo · **S** conveniente, se planifica · **C** futuro condicionado · **W** descartado en este proyecto.

**Importante:** los requisitos que necesitan conectarse con Moodle (bloques de consulta y de cambios, sección 5) **se especifican y se demuestran en un aula o perfil de prueba**. Llevarlos a las aulas reales depende del estudio de viabilidad y de la aprobación de Informática y Dirección (DO-09). Presentarlos como funcionando en las aulas reales sin haberlo hecho incumpliría la ficha.

**Palabras usadas:** *aula* es cada uno de los doce entornos Moodle; *acceso directo* es un enlace a una página concreta de gestión de un aula; *inventario* es la lista de aulas que mantiene el DPE en la plataforma; *cambio individual* es una operación sobre una persona en un aula; *cambio global* es la misma operación sobre varias personas o varias aulas en una sola orden.

## 1. Resumen

| ID | Requisito | Prior. | Perfil | Origen |
|---|---|---|---|---|
| RF-01 | Permitir la entrada solo al personal autorizado | M | Todos | AL-15 · N-14 · DT-02 |
| RF-02 | Aplicar permisos según el rol | M | PU-09 (asigna); todos | AL-15 · N-14, N-15 · DO-03 |
| RF-03 | Mostrar el inventario de aulas identificando cada una sin ambigüedad | M | PU-08, PU-09, PU-10, PU-05 | AL-16 · N-12, N-03 · PR-03 |
| RF-04 | Ofrecer accesos directos a las áreas de gestión de cada aula | M | PU-08, PU-09 | AL-17 · N-11 · PR-09 |
| RF-05 | Buscar y filtrar aulas y accesos | M | PU-08, PU-09, PU-05 | AL-18 · N-11, N-12 |
| RF-06 | Dar de alta y modificar aulas y accesos | M | PU-08 | AL-19 · N-06 |
| RF-07 | Ocultar o retirar un aula sin borrarla | M | PU-08 | AL-19 · N-06, N-10 |
| RF-08 | Registrar cada cambio del inventario | M | PU-08, PU-09 | AL-19 · N-06 · RS-02 |
| RF-09 | Controlar la fecha de última revisión de cada aula | M | PU-08 | AL-19 · N-06 · RS-01 |
| RF-10 | Registrar las entradas en la plataforma y los cambios de permisos | M | PU-09 | AL-15 · N-14 · RS-10 |
| RF-11 | Consultar datos agregados de gestión de varias aulas a la vez | S | PU-08, PU-10 | AL-21 · N-13 · PR-09 |
| RF-12 | Buscar un curso en todas las aulas | S | PU-08, PU-05 | AL-22 · N-13, N-11 |
| RF-13 | Mostrar el estado técnico de cada aula | S | PU-09 | AL-23 · N-12 · PR-10 · DO-05 |
| RF-14 | Comprobar periódicamente que cada aula responde | S | PU-09 | AL-08 · N-10 · RS-01 |
| RF-15 | **Hacer cambios individuales en un aula desde la plataforma** | **M** (antes C) | PU-08 | AL-25 · N-16 · **DO-04** |
| RF-16 | Entrar en la plataforma y en las aulas con la cuenta corporativa | **S** (antes C) | PU-08, PU-09 | AL-24 · N-11 · PR-05 · **DO-07** |
| RF-17 | **Ver a los alumnos de cada aula y de todas a la vez** | **M** (antes C) | PU-08, PU-05 (consulta) | AL-26 · N-16, N-13 · **DO-04** |
| RF-18 | Indicadores agregados para la responsable del DPE | C | PU-10 | AL-27 · N-13 |
| RF-19 | **Controlar los accesos de los usuarios a las aulas** | **M** (nuevo) | PU-08 | N-16 · **DO-04** · SF-16 |
| RF-20 | **Hacer cambios globales en varias aulas o personas a la vez** | **M** (nuevo) | PU-08 | N-16 · **DO-04** · SF-17 |
| RF-21 | **Vista previa, confirmación, registro y vuelta atrás de los cambios en las aulas** | **M** (nuevo) | PU-08, PU-09 | N-16, N-14 · RS-10, RS-11 |
| RF-22 | Cambiar ajustes de cursos o de las aulas en varias aulas a la vez | C (nuevo) | PU-08, PU-09 | N-16 · DO-04 · SF-17 |

Totales: **15 *Must***, **5 *Should***, **2 *Could*** y **7 *Won't*** (sección 4).

## 2. Imprescindibles (Must)

### 2.1 Base: acceso, inventario y accesos directos

RF-01 a RF-10 **no cambian** respecto a la v0.2, salvo la nota de RF-04. Son la base sobre la que se construye lo demás y lo único que funciona aunque no haya conexión con Moodle.

#### RF-01. Permitir la entrada solo al personal autorizado

- **Descripción:** la plataforma debe exigir que la persona se identifique antes de mostrar cualquier contenido, y solo debe dejar entrar a las personas dadas de alta por Informática.
- **Justificación:** la plataforma reúne el acceso a la gestión de doce aulas y, ahora, a datos del alumnado (DT-02, DO-04, RS-10).
- **Depende de:** SF-04 (cuenta corporativa de Microsoft 365).
- **Criterios de aceptación:**
  1. *Dado* una persona sin identificar, *cuando* abre cualquier página de la plataforma, *entonces* solo ve la pantalla de identificación.
  2. *Dado* una persona identificada que no está dada de alta, *cuando* intenta entrar, *entonces* se le deniega el acceso con un mensaje claro.
  3. *Dado* una persona dada de baja, *cuando* intenta entrar, *entonces* se le deniega el acceso.

#### RF-02. Aplicar permisos según el rol

- **Descripción:** la plataforma debe distinguir al menos tres roles: **gestión** (DPE: consulta, mantiene el inventario y hace cambios en las aulas en las que tenga permiso), **técnico** (Informática: además, da y quita permisos y ve el estado técnico) y **consulta** (CAU: solo ve y busca, sin hacer cambios). Además, **por cada persona y aula**, la plataforma debe aplicar como máximo los permisos que esa persona tiene en esa aula (RNF-SEG-12).
- **Justificación:** reparto de tareas (DT-04, DT-05, N-15), roles distintos por persona y aula (DO-03) y mínimo privilegio.
- **Depende de:** SF-01, SF-03, SF-13.
- **Criterios de aceptación:**
  1. *Dado* una persona con rol de consulta, *cuando* intenta modificar el inventario o hacer un cambio en un aula, *entonces* no puede.
  2. *Dado* una persona con rol de gestión, *cuando* intenta dar permisos a otra persona, *entonces* no puede.
  3. *Dado* una persona con rol técnico, *cuando* cambia el rol de otra, *entonces* el cambio se aplica en su siguiente acción y queda registrado (RF-10).
  4. *Dado* una persona de gestión sin permiso para matricular en el aula A, *cuando* intenta matricular en el aula A desde la plataforma, *entonces* no puede.

#### RF-03 a RF-10

Sin cambios respecto a la [v0.2](historico/03-requisitos-funcionales_v0.2.md#rf-03-mostrar-el-inventario-de-aulas-identificando-cada-una-sin-ambigüedad):

| ID | Requisito | Criterio principal |
|---|---|---|
| RF-03 | Inventario de aulas con marca, nombre propio, dominio, estado, responsable en el DPE, contacto técnico y fecha de última revisión | Se ven todas las aulas visibles y ninguna oculta; no hay dos nombres propios iguales |
| RF-04 | Accesos directos a las páginas de gestión de cada aula, indicando aula y dominio | Una sola acción hasta la página de gestión; sin contraseñas de las aulas. **v0.3:** deja de ser el núcleo; queda como **mínimo garantizado** y como salida para lo que la plataforma no haga |
| RF-05 | Buscar aulas por marca, nombre propio o dominio y filtrar por marca, estado o responsable | Sin distinguir mayúsculas ni tildes; número de resultados anunciado |
| RF-06 | Altas y cambios de aulas sin programar, solo con dominios permitidos y HTTPS | Alta incompleta o con dominio no permitido, rechazada |
| RF-07 | Ocultar o retirar un aula sin borrarla | Se conservan sus datos y se puede volver a mostrar |
| RF-08 | Registro de cambios del inventario con fecha, autor, valores anterior y nuevo | Se puede volver al valor anterior |
| RF-09 | Aviso de aulas sin revisar en 90 días [R] | El aula aparece señalada |
| RF-10 | Registro de entradas, intentos fallidos y cambios de permisos, solo visible para el rol técnico | Todo queda con fecha, hora y persona |

### 2.2 Núcleo pedido por la organización (DO-04)

Estos cinco requisitos son la respuesta a «es eso en lo que necesitamos que investigues». Todos necesitan los servicios web de Moodle (SF-06, SF-18) y se demuestran en un aula o perfil de prueba (SF-05).

#### RF-17. Ver a los alumnos de cada aula y de todas a la vez

- **Descripción:** la plataforma debe permitir (a) ver el alumnado de un aula concreta, con sus cursos, su estado (activa o suspendida) y su último acceso, y (b) buscar a una persona por nombre, correo o identificador y ver **en qué aulas y cursos** está, en una sola vista.
- **Justificación:** «ver los alumnos de manera global e independiente» (DO-04).
- **Límites:** los datos se leen de las aulas cuando se consultan; no se guarda una copia permanente (RNF-SEG-07). Solo los ven los roles con permiso en cada aula (RNF-SEG-12). Cada consulta de datos personales queda registrada (RNF-SEG-08).
- **Depende de:** SF-06, SF-15.
- **Criterios de aceptación:**
  1. *Dado* un aula de prueba con 20 alumnos ficticios, *cuando* se consulta, *entonces* aparecen los 20 con cursos, estado y último acceso, e indicando la hora de la consulta.
  2. *Dado* una persona ficticia matriculada en dos aulas de prueba, *cuando* se busca por su correo, *entonces* aparecen las dos aulas y sus cursos en una sola vista.
  3. *Dado* un aula que no responde, *cuando* se hace una búsqueda global, *entonces* se indica que esa aula no está disponible, sin bloquear el resto.
  4. *Dado* una persona sin permiso en el aula B, *cuando* busca, *entonces* no ve los datos del aula B.

#### RF-19. Controlar los accesos de los usuarios a las aulas

- **Descripción:** la plataforma debe mostrar, por aula y en conjunto, las cuentas **sin acceso desde hace más de N días** (valor propuesto 90 días [R]), las que **nunca han entrado** y las **suspendidas**, y permitir filtrarlas por aula y curso. Desde esa lista se debe poder iniciar un cambio (suspender o reactivar) con RF-15 o RF-20.
- **Justificación:** «hacer controles de accesos» (DO-04), según la interpretación SF-16, pendiente de confirmar (P-G07).
- **Criterios de aceptación:**
  1. *Dado* un aula de prueba con 3 cuentas sin acceso en 120 días, 2 que nunca han entrado y 1 suspendida, *cuando* se consulta el control de accesos, *entonces* aparecen en sus grupos con esas cifras.
  2. *Dado* un filtro por curso, *entonces* solo aparecen las cuentas de ese curso.
  3. *Dado* la lista, *cuando* se eligen varias cuentas, *entonces* se puede pasar a la vista previa de un cambio (RF-21).

#### RF-15. Hacer cambios individuales en un aula desde la plataforma

- **Descripción:** la plataforma debe permitir hacer, sobre **una persona en un aula** y sin entrar en ella, al menos estas operaciones (SF-17): **suspender o reactivar** una cuenta, **matricular o desmatricular** en un curso y **cambiar el rol** en un curso.
- **Justificación:** «gestionar cambios […] individuales» (DO-04).
- **Límites:** solo con los permisos que la persona tiene en esa aula (RNF-SEG-12); siempre con RF-21.
- **Depende de:** SF-06, SF-18.
- **Criterios de aceptación:**
  1. *Dado* una cuenta activa en el aula de prueba, *cuando* se suspende desde la plataforma y se confirma, *entonces* la cuenta aparece suspendida en el aula y el cambio queda registrado.
  2. *Dado* una persona y un curso del aula de prueba, *cuando* se matricula desde la plataforma, *entonces* aparece matriculada en el aula con el rol elegido.
  3. *Dado* que el aula rechaza la operación, *entonces* la plataforma muestra el motivo y no da el cambio por hecho.

#### RF-20. Hacer cambios globales en varias aulas o personas a la vez

- **Descripción:** la plataforma debe permitir aplicar una de las operaciones de RF-15 a **varias personas** de un aula o a **la misma persona o grupo en varias aulas**, en una sola orden. Por ejemplo: suspender a una persona en todas las aulas en las que está; matricular a un grupo en el mismo curso de tres aulas.
- **Justificación:** «gestionar cambios globales» (DO-04).
- **Límites:** solo en las aulas en las que la persona tenga permiso (RNF-SEG-12); siempre con vista previa (RF-21); un fallo en un aula no detiene las demás.
- **Criterios de aceptación:**
  1. *Dado* una persona ficticia en dos aulas de prueba, *cuando* se ordena suspenderla en todas, *entonces* la vista previa muestra las dos aulas y, tras confirmar, queda suspendida en ambas.
  2. *Dado* que una de las aulas no responde, *entonces* el resultado indica qué aula se cambió y cuál no, y permite reintentar solo la que falló.
  3. *Dado* un cambio global terminado, *entonces* se muestra un resumen por aula: hechos, fallidos y motivo.

#### RF-21. Vista previa, confirmación, registro y vuelta atrás de los cambios en las aulas

- **Descripción:** todo cambio en un aula hecho desde la plataforma debe (1) mostrar antes **qué se va a cambiar, en qué aulas y a cuántas personas**; (2) pedir **confirmación expresa**, reforzada cuando afecte a más de una aula o a más de 10 personas [R]; (3) quedar **registrado** con quién, cuándo, qué, dónde, valor anterior y resultado; y (4) ofrecer la **operación contraria** (reactivar, volver a matricular, restaurar el rol) cuando exista.
- **Justificación:** un error en un cambio global afecta a muchas personas y aulas a la vez (RS-10, RS-11, RP-12).
- **Criterios de aceptación:**
  1. *Dado* un cambio, *cuando* se pide, *entonces* aparece la vista previa y no se aplica nada hasta confirmar.
  2. *Dado* un cambio que afecta a 2 aulas, *entonces* la confirmación exige un paso adicional (por ejemplo, escribir el número de aulas afectadas).
  3. *Dado* un cambio aplicado, *entonces* el registro lo muestra con todos sus datos y solo lo ven los roles de gestión y técnico.
  4. *Dado* una suspensión aplicada por error, *cuando* se usa «deshacer» desde el registro, *entonces* la cuenta vuelve a estar activa y la vuelta atrás también queda registrada.

## 3. Convenientes (Should) y futuros (Could)

### RF-11. Consultar datos agregados de gestión de varias aulas a la vez (S)

- **Descripción:** para cada aula y en una sola vista, cifras de solo lectura: cursos visibles, matrículas activas, cuentas activas y fecha de la última actividad, con la hora de la consulta.
- **Criterios:** *dado* un aula de prueba con 3 cursos y 20 matrículas, *entonces* la vista muestra 3 y 20 y la hora; *dado* un aula que no responde, *entonces* se indica que el dato no está disponible, sin bloquear las demás.

### RF-12. Buscar un curso en todas las aulas (S)

- **Descripción:** buscar un curso por su nombre en todas las aulas y ver en cuál está, con acceso directo a su gestión.
- **Criterios:** *dado* un curso del aula de prueba, *cuando* se busca parte de su nombre, *entonces* aparece con su aula; *dado* un curso inexistente, *entonces* se indica que no hay resultados.

### RF-13. Mostrar el estado técnico de cada aula (S)

- **Descripción:** el rol técnico debe ver la versión de Moodle de cada aula, si tiene soporte y **qué funciones de servicios web tiene habilitadas** (y, por tanto, qué operaciones de la plataforma están disponibles en ella).
- **Justificación:** las versiones varían entre aulas y en el tiempo (DO-05).
- **Criterios:** *dado* un aula con una versión sin soporte, *entonces* aparece señalada; *dado* un aula sin la función de suspender, *entonces* la plataforma lo indica y no ofrece esa operación en ella.

### RF-14. Comprobar periódicamente que cada aula responde (S)

Sin cambios: comprobación no intrusiva de la página pública, como mucho una vez por hora por aula, con aviso al rol técnico tras dos fallos seguidos.

### RF-16. Entrar en la plataforma y en las aulas con la cuenta corporativa (S)

- **Descripción:** el personal debe poder identificarse en la plataforma con su **cuenta de Microsoft 365** y, si Informática lo habilita en cada aula, entrar en ella con la misma cuenta, sin otra contraseña.
- **Justificación:** existe directorio corporativo (DO-07). Moodle incluye de serie la identificación con Microsoft; habilitarla en las aulas es decisión de Informática.
- **Criterios:** *dado* una cuenta corporativa de prueba dada de alta, *cuando* entra en la plataforma, *entonces* accede sin contraseña adicional; *dado* un aula de prueba con la identificación corporativa habilitada, *cuando* sigue un acceso directo, *entonces* entra sin volver a escribir la contraseña.

### RF-18 y RF-22. Futuros condicionados (C)

| ID | Requisito | Condición para valorarlo |
|---|---|---|
| RF-18 | Indicadores agregados para la responsable del DPE (evolución de cursos, matrículas y accesos) | RF-11 y RF-17 en funcionamiento |
| RF-22 | Cambiar ajustes de cursos o de las aulas (fechas, visibilidad, configuración) en varias aulas a la vez | RF-20 probado; aprobación expresa de Informática; aula de prueba por cada versión de Moodle en uso. Mayor riesgo que los cambios sobre usuarios (SF-17) |

No se escriben criterios de aceptación para los *Could*: se escribirán si alguno sube de prioridad.

## 4. Descartados (Won't) en este proyecto

| ID | Qué no se hará | Motivo |
|---|---|---|
| W-01 | Modificar, actualizar o configurar las aulas en producción durante el proyecto | Límite de la ficha. Todo se demuestra en un aula o perfil de prueba (SF-05). La implantación, si se aprueba, la haría Informática |
| W-02 | Unificar las aulas en un único Moodle | Decisión de la organización. Puede citarse en la viabilidad como alternativa de referencia |
| W-03 | Pedir, guardar, recuperar o reenviar contraseñas personales de las aulas | Riesgo grave de seguridad (RS-04) |
| W-04 | Portal o acceso para el alumnado o el profesorado | No son usuarios de la plataforma (DT-03, DO-04) |
| W-05 | Reproducir en la plataforma todas las funciones de administración de Moodle | No es un «segundo Moodle»: solo las operaciones de gestión priorizadas (RF-15, RF-20); el resto se sigue haciendo en cada aula con RF-04 |
| W-06 | Resolver la versión de Moodle sin soporte | Se comunica a Informática, pero no es objeto del proyecto |
| W-07 | Diseño y programación de las aulas | Los lleva otro departamento (DO-01) |

## 5. Bloques y dependencia de la viabilidad

| Bloque | Requisitos | Qué necesita | Valor según la organización |
|---|---|---|---|
| **Base** | RF-01 a RF-10 | Nada de Moodle: solo enlaces e inventario. Siempre viable | **Insuficiente por sí solo** («si solo fuera consultarlo con un hipervínculo sería suficiente, pero queremos ir más allá») |
| **Consulta** | RF-11, RF-12, RF-13, **RF-17**, **RF-19** | Servicios web de **solo lectura** en cada aula | Parte de la petición: vista global de alumnos y control de accesos |
| **Cambios** | **RF-15**, **RF-20**, **RF-21** (RF-22 futuro) | Servicios web con **escritura limitada** y aprobación de Informática | Parte central de la petición |
| **Acceso único** | RF-16 | Microsoft 365 y su activación en cada aula | Conveniente |

El estudio de viabilidad debe contestar, **aula por aula**, hasta qué bloque se puede llegar. Una conclusión posible es intermedia: por ejemplo, consulta en todas las aulas y cambios solo en las que tengan la versión y la configuración adecuadas.

### Funciones de Moodle candidatas (a comprobar en el aula de prueba)

Sin decidir aún la solución (Fase 3), estas funciones estándar de los servicios web de Moodle 4.1 cubrirían el núcleo. Su disponibilidad real en cada aula es lo que debe comprobar la viabilidad:

| Necesidad | Funciones candidatas |
|---|---|
| Versión y funciones habilitadas del aula (RF-13) | `core_webservice_get_site_info` |
| Ver alumnos, cursos y último acceso (RF-17, RF-19) | `core_user_get_users`, `core_user_get_users_by_field`, `core_enrol_get_enrolled_users`, `core_enrol_get_users_courses` |
| Buscar cursos (RF-12) | `core_course_search_courses`, `core_course_get_courses_by_field` |
| Suspender o reactivar (RF-15, RF-20) | `core_user_update_users` (campo «suspendido») |
| Matricular o desmatricular (RF-15, RF-20) | `enrol_manual_enrol_users`, `enrol_manual_unenrol_users` |
| Cambiar el rol en un curso (RF-15) | `core_role_assign_roles`, `core_role_unassign_roles` |

## 6. Correspondencia con versiones anteriores

| v0.2 | v0.3 | Cambio |
|---|---|---|
| RF-01 a RF-14 | RF-01 a RF-14 | Sin cambios de prioridad. RF-02 añade el límite por persona y aula; RF-04 deja de ser el núcleo; RF-13 añade las funciones habilitadas |
| RF-15 Tareas de gestión desde la plataforma (C) | RF-15 Cambios individuales (**M**) y RF-20 Cambios globales (**M**, nuevo) | Pedido por la organización (DO-04) |
| RF-16 Inicio de sesión único (C) | RF-16 Acceso con la cuenta corporativa (**S**) | Microsoft 365 confirmado (DO-07) |
| RF-17 Buscar a una persona en todas las aulas (C) | RF-17 Ver a los alumnos de cada aula y de todas (**M**) | Pedido por la organización (DO-04) |
| RF-18 | RF-18 | Sin cambios |
| — | RF-19 Control de accesos (**M**), RF-21 Seguridad de los cambios (**M**), RF-22 Ajustes en varias aulas (C) | Nuevos |
| W-01 a W-06 | W-01 a W-06 y W-07 | W-04 incluye al profesorado; W-05 se matiza; W-07 nuevo |

La correspondencia de la v0.1 con la v0.2 está en la [v0.2 archivada](historico/03-requisitos-funcionales_v0.2.md#6-correspondencia-con-la-v01).

## 7. Control de versiones

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| 0.1 | 2026-11-03 | Claude (Analista / Arquitecto) | Primera versión: 18 requisitos funcionales y 5 descartes. [Archivada](historico/03-requisitos-funcionales_v0.1.md) |
| 0.2 | 2026-11-04 | Claude (Analista / Arquitecto) | Enfoque de gestión interna: 18 requisitos nuevos (10 *Must*, 4 *Should*, 4 *Could*), 6 descartes. [Archivada](historico/03-requisitos-funcionales_v0.2.md) |
| 0.3 | 2026-11-05 | Claude (Analista / Arquitecto) | Respuestas de Grupo ATU: RF-15 y RF-17 suben a *Must*, RF-16 a *Should*; nuevos RF-19 a RF-22 y W-07; 22 requisitos (15 *Must*, 5 *Should*, 2 *Could*); bloques de viabilidad y funciones candidatas de Moodle |
