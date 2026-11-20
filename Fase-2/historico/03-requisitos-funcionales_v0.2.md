# 03 — Requisitos funcionales

| Campo | Valor |
|---|---|
| Versión | 0.2 |
| Fecha | 2026-11-04 |
| Estado | Revisión del propietario |
| Redacción | Claude (roles Analista y Arquitecto), a petición del alumno |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |

Funciones y acciones que necesitan los distintos perfiles (ficha, grupo «Funcionales»). Se comprueban con **criterios de aceptación** y **casos de prueba** (ver [05](05-matriz-trazabilidad.md)).

> **v0.2.** Requisitos rehechos para una **herramienta interna de gestión** (DT-01 a DT-06). La numeración es nueva; la correspondencia con la v0.1 está en la sección 6. Los requisitos concretan el [alcance preliminar v0.3](../Fase-1/07-alcance-preliminar.md) (AL-15 a AL-27).

**Prioridad (MoSCoW):** **M** imprescindible para el prototipo · **S** conveniente, se planifica y **depende de la viabilidad** de la integración con Moodle · **C** futuro condicionado · **W** descartado en este proyecto.

**Palabras usadas:** *aula* es cada uno de los doce entornos Moodle; *acceso directo* es un enlace a una página concreta de gestión de un aula (por ejemplo, su gestión de cursos); *inventario* es la lista de aulas que mantiene el DPE en la plataforma.

## 1. Resumen

| ID | Requisito | Prior. | Perfil | Origen |
|---|---|---|---|---|
| RF-01 | Permitir la entrada solo al personal autorizado | M | Todos | AL-15 · N-14 · DT-02 |
| RF-02 | Aplicar permisos según el rol | M | PU-09 (asigna); todos | AL-15 · N-14, N-15 |
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
| RF-13 | Mostrar el estado técnico de cada aula | S | PU-09 | AL-23 · N-12 · PR-10 |
| RF-14 | Comprobar periódicamente que cada aula responde | S | PU-09 | AL-08 · N-10 · RS-01 |
| RF-15 | Realizar tareas de gestión desde la plataforma | C | PU-08 | AL-25 · N-11 |
| RF-16 | Inicio de sesión único del personal en las aulas | C | PU-08, PU-09 | AL-24 · N-11 · PR-05 |
| RF-17 | Buscar a una persona usuaria en todas las aulas | C | PU-08, PU-05 | AL-26 · N-13 |
| RF-18 | Indicadores agregados para la responsable del DPE | C | PU-10 | AL-27 · N-13 |

Totales: 10 *Must*, 4 *Should*, 4 *Could* y 6 *Won't* (sección 4).

## 2. Imprescindibles (Must)

### RF-01. Permitir la entrada solo al personal autorizado

- **Descripción:** la plataforma debe exigir que la persona se identifique antes de mostrar cualquier contenido, y solo debe dejar entrar a las personas dadas de alta por Informática.
- **Justificación:** la plataforma reúne accesos a la gestión de doce aulas (DT-02, RS-10).
- **Depende de:** SF-04 (podría usarse la cuenta corporativa).
- **Criterios de aceptación:**
  1. *Dado* una persona sin identificar, *cuando* abre cualquier página de la plataforma, *entonces* solo ve la pantalla de identificación.
  2. *Dado* una persona identificada que no está dada de alta, *cuando* intenta entrar, *entonces* se le deniega el acceso con un mensaje claro.
  3. *Dado* una persona dada de baja, *cuando* intenta entrar, *entonces* se le deniega el acceso.

### RF-02. Aplicar permisos según el rol

- **Descripción:** la plataforma debe distinguir al menos tres roles: **gestión** (DPE: consulta y mantiene el inventario y los accesos), **técnico** (Informática: además, da y quita permisos y ve el estado técnico) y **consulta** (CAU: solo ve el inventario y busca).
- **Justificación:** reparto de tareas entre el DPE e Informática (DT-04, DT-05, N-15) y principio de mínimo privilegio.
- **Depende de:** SF-01, SF-13.
- **Criterios de aceptación:**
  1. *Dado* una persona con rol de consulta, *cuando* intenta modificar el inventario, *entonces* no puede.
  2. *Dado* una persona con rol de gestión, *cuando* intenta dar permisos a otra persona, *entonces* no puede.
  3. *Dado* una persona con rol técnico, *cuando* cambia el rol de otra, *entonces* el cambio se aplica en su siguiente acción y queda registrado (RF-10).

### RF-03. Mostrar el inventario de aulas identificando cada una sin ambigüedad

- **Descripción:** la plataforma debe mostrar la lista de aulas visibles con, al menos: nombre de la marca, nombre propio que la distinga de las demás, dominio, estado (activa, en mantenimiento), persona o equipo responsable en el DPE, contacto técnico en Informática y fecha de última revisión.
- **Justificación:** no existe una vista de conjunto (N-12) y cinco aulas tienen el mismo título (PR-03).
- **Criterios de aceptación:**
  1. *Dado* un inventario con N aulas visibles, *cuando* una persona autorizada entra, *entonces* ve las N aulas y ninguna oculta o retirada.
  2. *Dado* el inventario actual, *cuando* se revisa, *entonces* no hay dos aulas con el mismo nombre propio.
  3. *Dado* un aula, *cuando* se muestra, *entonces* aparecen todos los campos obligatorios.

### RF-04. Ofrecer accesos directos a las áreas de gestión de cada aula

- **Descripción:** para cada aula, la plataforma debe ofrecer enlaces directos a sus páginas de gestión más usadas. Como punto de partida (SF-02): administración del sitio, gestión de cursos y categorías, usuarios, matriculaciones o cohortes, informes y copias de seguridad de cursos. Cada enlace debe indicar a qué aula y a qué dominio lleva.
- **Justificación:** es el núcleo del enfoque: no tener que buscar la dirección de cada aula ni navegar por su menú (DT-01, PR-09).
- **Límite:** la plataforma **no** inicia la sesión en el aula. Si la persona no tiene la sesión abierta en esa aula, el aula le pide identificarse, como hoy (SF-03, RF-16 como futuro).
- **Criterios de aceptación:**
  1. *Dado* un aula y un acceso directo, *cuando* la persona lo activa, *entonces* llega a esa página de gestión del aula en una sola acción (o a la identificación del aula, si no tiene sesión abierta, y tras identificarse, a esa página).
  2. *Dado* un acceso directo, *cuando* se lee o se escucha con lector de pantalla, *entonces* nombra el aula, la página de destino y el dominio.
  3. *Dado* cualquier acceso, *entonces* la plataforma no pide, recibe ni reenvía contraseñas de las aulas (RNF-SEG-02).

### RF-05. Buscar y filtrar aulas y accesos

- **Descripción:** la plataforma debe permitir buscar aulas escribiendo parte de la marca, del nombre propio o del dominio, y filtrarlas por marca, estado o responsable.
- **Justificación:** llegar rápido al aula correcta (ES-02).
- **Criterios de aceptación:**
  1. *Dado* el aula «Tierra Más Ecológica», *cuando* se busca «tierra», «ecologica» o «ECOLÓGICA», *entonces* aparece (sin distinguir mayúsculas ni tildes).
  2. *Dado* un filtro por estado «en mantenimiento», *entonces* solo aparecen las aulas en ese estado; el filtro se combina con la búsqueda y se quita en una acción.
  3. *Dado* cualquier búsqueda, *entonces* se indica cuántos resultados hay, de forma que también lo anuncie un lector de pantalla.

### RF-06. Dar de alta y modificar aulas y accesos

- **Descripción:** el rol de gestión debe poder añadir un aula y modificar sus datos y sus accesos directos sin programar.
- **Campos obligatorios:** marca, nombre propio, dirección principal, estado, responsable en el DPE, contacto técnico, fecha de última revisión. Opcionales: accesos directos adicionales, notas de gestión, versión de Moodle.
- **Justificación:** el inventario solo es útil si se mantiene (N-06, RS-01).
- **Criterios de aceptación:**
  1. *Dado* un alta con todos los campos obligatorios, *cuando* se guarda, *entonces* el aula aparece en el inventario con sus accesos.
  2. *Dado* un alta incompleta, *cuando* se intenta guardar, *entonces* se rechaza indicando qué falta.
  3. *Dado* una dirección de un dominio no permitido o sin HTTPS, *cuando* se intenta guardar, *entonces* se rechaza (RNF-SEG-04).

### RF-07. Ocultar o retirar un aula sin borrarla

- **Descripción:** el rol de gestión debe poder ocultar un aula o marcarla como retirada, y volver a mostrarla.
- **Criterios de aceptación:**
  1. *Dado* un aula visible, *cuando* se oculta, *entonces* deja de aparecer en el inventario y en las búsquedas, pero sus datos se conservan.
  2. *Dado* un aula oculta, *cuando* se vuelve a mostrar, *entonces* aparece con los mismos datos y accesos.

### RF-08. Registrar cada cambio del inventario

- **Descripción:** cada alta, modificación, ocultación o retirada debe quedar registrada con fecha, autor y qué cambió.
- **Criterios de aceptación:**
  1. *Dado* cualquier cambio, *cuando* se guarda, *entonces* el registro muestra fecha, autor, aula y valores anterior y nuevo.
  2. *Dado* un cambio erróneo, *cuando* se revisa, *entonces* se puede volver al valor anterior a partir del registro.

### RF-09. Controlar la fecha de última revisión de cada aula

- **Descripción:** la plataforma debe señalar al rol de gestión las aulas que lleven más tiempo del fijado sin revisar.
- **Valor propuesto [R]:** 90 días; a confirmar (P-C06).
- **Criterios de aceptación:**
  1. *Dado* un aula revisada hace más de 90 días, *cuando* se consulta el inventario, *entonces* aparece señalada.
  2. *Dado* un aula, *cuando* se marca como revisada, *entonces* se actualiza la fecha y queda en el registro.

### RF-10. Registrar las entradas en la plataforma y los cambios de permisos

- **Descripción:** la plataforma debe registrar cada entrada (quién y cuándo), cada intento fallido y cada cambio de permisos, y el rol técnico debe poder consultarlo.
- **Justificación:** una herramienta que da acceso a la gestión de doce aulas debe poder auditarse (RS-10).
- **Criterios de aceptación:**
  1. *Dado* una entrada o un intento fallido, *entonces* queda registrado con fecha, hora y persona.
  2. *Dado* un cambio de rol, *entonces* queda registrado con quién lo hizo.
  3. *Dado* una persona con rol de gestión o consulta, *cuando* intenta ver el registro, *entonces* no puede.

## 3. Convenientes (Should) y futuros (Could)

Los cuatro *Should* dependen de que Informática pueda habilitar los servicios web de Moodle (SF-06), de la versión de las aulas (SF-07) y del estudio de viabilidad (DT-06). En el proyecto **solo se demostrarían sobre un aula de pruebas** (SF-05); presentarlos como funcionando en las aulas reales sin haberlo hecho incumpliría la ficha.

### RF-11. Consultar datos agregados de gestión de varias aulas a la vez (S)

- **Descripción:** la plataforma debe mostrar, para cada aula y en una sola vista, datos agregados de solo lectura: por ejemplo, número de cursos visibles, número de matrículas activas y fecha de la última actividad. Cada dato debe indicar cuándo se obtuvo.
- **Límite:** sin datos de personas concretas (SF-12) y sin cargar las aulas (RNF-REN-07).
- **Criterios:** *dado* un aula de pruebas con 3 cursos y 20 matrículas, *entonces* la vista muestra 3 y 20 y la hora de la consulta; *dado* un aula que no responde, *entonces* se indica que el dato no está disponible, sin bloquear las demás.

### RF-12. Buscar un curso en todas las aulas (S)

- **Descripción:** la plataforma debe permitir buscar un curso por su nombre en todas las aulas y mostrar en cuál está, con un acceso directo a su página de gestión.
- **Criterios:** *dado* un curso que existe en el aula de pruebas, *cuando* se busca parte de su nombre, *entonces* aparece con el aula y su acceso; *dado* un curso inexistente, *entonces* se indica que no hay resultados.

### RF-13. Mostrar el estado técnico de cada aula (S)

- **Descripción:** el rol técnico debe ver la versión de Moodle de cada aula y si esa versión tiene soporte, introducida a mano por Informática u obtenida por los servicios web.
- **Criterios:** *dado* un aula con una versión sin soporte, *entonces* aparece señalada para el rol técnico.

### RF-14. Comprobar periódicamente que cada aula responde (S)

- **Descripción:** la plataforma debe comprobar de forma automática que la página principal de cada aula responde y avisar al rol técnico si no.
- **Límite:** **no intrusiva**: solo carga la página pública, como mucho una vez cada hora por aula y sin iniciar sesión.
- **Criterios:** *dado* un aula que no responde en dos comprobaciones seguidas, *entonces* se avisa; *dado* un aula que responde, *entonces* no hay aviso.

### RF-15 a RF-18. Futuros condicionados (C)

| ID | Requisito | Condición para valorarlo |
|---|---|---|
| RF-15 | Realizar tareas de gestión (crear un curso, matricular) desde la plataforma, sin entrar en el aula | Que el DPE lo pida (P-G04); servicios web con permisos de escritura; confirmación de cada acción y registro (RS-10, RS-11) |
| RF-16 | Inicio de sesión único del personal en todas las aulas | Directorio común (SF-04), cambios en la autenticación de cada aula hechos por Informática y Moodle con soporte (SF-07) |
| RF-17 | Buscar a una persona usuaria en todas las aulas | Finalidad justificada por el DPE, base legal y visto bueno del responsable del tratamiento (RS-03, A-09) |
| RF-18 | Indicadores agregados para la responsable del DPE (evolución de cursos y matrículas) | RF-11 en funcionamiento |

No se escriben criterios de aceptación para los *Could*: se escribirán si alguno pasa a *Should* o *Must*.

## 4. Descartados (Won't) en este proyecto

| ID | Qué no se hará | Motivo |
|---|---|---|
| W-01 | Modificar, actualizar o configurar las aulas en producción | Límite de la ficha. Las pruebas de integración se hacen en un aula de pruebas (SF-05) |
| W-02 | Unificar las aulas en un único Moodle | Decisión de la organización. Puede citarse en la viabilidad como alternativa de referencia |
| W-03 | Pedir, guardar, recuperar o reenviar contraseñas personales de las aulas | Riesgo grave de seguridad (RS-04) |
| W-04 | Portal o catálogo de aulas para el alumnado | El alumnado entra con la URL de su curso (DT-03) |
| W-05 | Reproducir en la plataforma las funciones completas de administración de Moodle | No es un «segundo Moodle»; la gestión completa se sigue haciendo en cada aula |
| W-06 | Resolver la versión de Moodle sin soporte | Se comunica a Informática (OS-01), pero no es objeto del proyecto |

## 5. Dependencia de la viabilidad

| Bloque | Requisitos | Funciona sin integración con Moodle |
|---|---|---|
| Base (siempre viable) | RF-01 a RF-10 | **Sí**: solo enlaza a las aulas y guarda el inventario |
| Consulta | RF-11, RF-12, RF-13 (en parte) | No: necesita servicios web de solo lectura |
| Acciones y acceso único | RF-15, RF-16 | No: necesita escritura o cambios en la autenticación de las aulas |

Este reparto permite que el estudio de viabilidad (Fase 5) concluya en un punto intermedio: por ejemplo, base sí y consulta solo en las aulas que lo permitan.

## 6. Correspondencia con la v0.1

| v0.1 | Qué era | v0.2 |
|---|---|---|
| RF-01 | Catálogo público | RF-03 (inventario interno, con acceso restringido por RF-01) |
| RF-02 | Identificar cada campus | RF-03 |
| RF-03 | Buscar por texto | RF-05 |
| RF-04 | Ir a la página de acceso | RF-04 (accesos a la gestión) |
| RF-05 | Orientar sin resultados | Integrado en RF-05 (indica cuántos resultados hay) |
| RF-06 a RF-09 | Mantenimiento del catálogo | RF-06 a RF-09 |
| RF-10 | Filtros | RF-05 |
| RF-11 | Comprobación de enlaces | RF-14 |
| RF-12 | Página de ayuda para el alumnado | Descartado (W-04) |
| RF-13 | Vista para el CAU | RF-02 (rol de consulta) y RF-03 |
| RF-14 | Enlace estable por campus | Descartado (W-04) |
| RF-15 | «Mis campus» | Descartado (W-04) |
| RF-16 | Inicio de sesión único | RF-16 (para el personal) |
| RF-17 | Datos de Moodle | Sube a *Should*: RF-11 y RF-12 |
| RF-18 | Analítica de uso | RF-18 (indicadores de gestión) |
| W-04 (v0.1) | Gestionar matrículas o contenidos | Sustituido por RF-15 (*Could*) y W-05 |

## 7. Control de versiones

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| 0.1 | 2026-11-03 | Claude (Analista / Arquitecto) | Primera versión: 18 requisitos funcionales y 5 descartes. [Archivada](historico/03-requisitos-funcionales_v0.1.md) |
| 0.2 | 2026-11-04 | Claude (Analista / Arquitecto) | Enfoque de gestión interna: 18 requisitos nuevos (10 *Must*, 4 *Should*, 4 *Could*), 6 descartes, dependencia de la viabilidad y correspondencia con la v0.1 |
