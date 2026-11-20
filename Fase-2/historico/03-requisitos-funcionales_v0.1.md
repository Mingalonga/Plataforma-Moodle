# 03 — Requisitos funcionales

| Campo | Valor |
|---|---|
| Versión | 0.1 |
| Fecha | 2026-11-03 |
| Estado | Revisión del propietario |
| Redacción | Claude (roles Analista y Arquitecto), a petición del alumno |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |

Funciones y acciones que necesitan los distintos perfiles (ficha, grupo «Funcionales»). Se comprueban con **criterios de aceptación** y **casos de prueba** (ver [05](05-matriz-trazabilidad.md)).

**Prioridad (MoSCoW):** **M** imprescindible para el prototipo · **S** conveniente, se planifica · **C** futuro condicionado · **W** descartado en este proyecto. Las prioridades concretan el alcance preliminar de la Fase 1 (AL-01 a AL-14) sin cambiarlo; donde se separa una capacidad en varios requisitos, se indica.

## 1. Resumen

| ID | Requisito | Prior. | Perfil | Origen |
|---|---|---|---|---|
| RF-01 | Mostrar el catálogo de campus activos | M | PU-01 a PU-05 | AL-01 · N-01 · PR-01 |
| RF-02 | Identificar cada campus sin ambigüedad | M | PU-01 a PU-05 | AL-01 · N-03 · PR-03 |
| RF-03 | Buscar campus por texto | M | PU-01, PU-04, PU-05 | AL-02 · N-01, N-02 · PR-02 |
| RF-04 | Ir a la página de acceso del campus avisando de la salida | M | PU-01 a PU-04 | AL-03 · N-02, N-03 · RS-05 |
| RF-05 | Orientar cuando la búsqueda no da resultados | M | PU-01, PU-04 | AL-02, AL-09 · N-01, N-05 |
| RF-06 | Dar de alta y modificar campus | M | PU-06 | AL-05 · N-06 |
| RF-07 | Ocultar o retirar un campus sin borrarlo | M | PU-06 | AL-05 · N-06, N-09 · SF-04 |
| RF-08 | Registrar cada cambio del catálogo | M | PU-06 | AL-05 · N-06 · RS-02 |
| RF-09 | Controlar la fecha de última revisión de cada campus | M | PU-06 | AL-05 · N-06 · RS-01 |
| RF-10 | Filtrar el catálogo por marca y, si se confirma, por área | S | PU-01, PU-04, PU-05 | AL-07 · N-01 · PR-08 |
| RF-11 | Comprobar periódicamente que los enlaces responden | S | PU-06 | AL-08 · N-06, N-10 · RS-01 |
| RF-12 | Ofrecer una página de ayuda con el canal del CAU | S | PU-01 a PU-04 | AL-09 · N-05 |
| RF-13 | Ofrecer al CAU una vista con estado y contacto de escalado | S | PU-05 | AL-10 · N-05 |
| RF-14 | Dar a cada campus un enlace propio y estable | S | PU-03, PU-04, PU-05 | ES-06 · N-01, N-02 |
| RF-15 | Mostrar a cada usuario «sus» campus | C | PU-02 | AL-11 · N-04 |
| RF-16 | Inicio de sesión único entre campus | C | PU-02, PU-03 | AL-12 · N-04 |
| RF-17 | Mostrar datos de los campus obtenidos de Moodle | C | PU-01 a PU-03 | AL-13 · N-01 |
| RF-18 | Analítica mínima de uso | C | Dirección (A-07) | AL-14 · PR-07 |

Totales: 9 *Must*, 5 *Should*, 4 *Could* y 5 *Won't* (sección 4).

## 2. Imprescindibles (Must)

### RF-01. Mostrar el catálogo de campus activos

- **Descripción:** la plataforma debe mostrar, sin necesidad de identificarse, la lista de todos los campus marcados como visibles en el catálogo.
- **Justificación:** hoy no existe ningún punto que reúna los campus (PR-01).
- **Depende de:** SF-03 (catálogo público), SF-04.
- **Criterios de aceptación:**
  1. *Dado* un catálogo con N campus visibles, *cuando* un usuario entra en la plataforma, *entonces* ve los N campus y ninguno oculto o retirado.
  2. *Dado* un usuario sin cuenta, *cuando* entra, *entonces* no se le pide identificarse para ver el catálogo.
  3. *Dado* el catálogo, *cuando* se muestra, *entonces* aparece en un orden predecible y explicado (por ejemplo, alfabético por marca).

### RF-02. Identificar cada campus sin ambigüedad

- **Descripción:** cada campus debe mostrar al menos: nombre de la marca, nombre descriptivo propio, logotipo con texto alternativo, una descripción breve, el dominio de destino y el idioma de la interfaz del campus si no es español.
- **Justificación:** cinco campus comparten título (PR-03) y uno está en inglés (H-02).
- **Depende de:** P-L03 (uso de logotipos). Si no se autoriza el logotipo, basta con el nombre y el dominio.
- **Criterios de aceptación:**
  1. *Dado* el catálogo actual, *cuando* se revisa, *entonces* no hay dos campus con el mismo nombre descriptivo.
  2. *Dado* un campus, *cuando* se muestra, *entonces* se ven todos los campos obligatorios y el dominio coincide con el de su dirección de acceso.
  3. *Dado* el entorno 4 (interfaz en inglés), *cuando* se muestra, *entonces* se indica que el campus está en inglés.

### RF-03. Buscar campus por texto

- **Descripción:** la plataforma debe permitir buscar campus escribiendo parte del nombre de la marca, del nombre descriptivo, de las palabras clave o del dominio.
- **Justificación:** el usuario puede recordar solo una parte del nombre (ES-01) o el tipo de formación (ES-02).
- **Depende de:** SF-11 (palabras clave o áreas por campus).
- **Criterios de aceptación:**
  1. *Dado* el campus «Tierra Más Ecológica», *cuando* se busca «tierra», «ecologica» o «ECOLÓGICA», *entonces* aparece en los resultados (sin distinguir mayúsculas ni tildes).
  2. *Dado* un campus con la palabra clave «agricultura», *cuando* se busca «agricultura», *entonces* aparece.
  3. *Dado* cualquier búsqueda, *cuando* se muestran los resultados, *entonces* se indica cuántos hay, de forma que también lo anuncie un lector de pantalla.
  4. *Dado* un campus oculto o retirado, *cuando* se busca su nombre, *entonces* no aparece.

### RF-04. Ir a la página de acceso del campus avisando de la salida

- **Descripción:** desde cada campus del catálogo, la plataforma debe llevar a su página de acceso e indicar de forma visible y accesible que se sale a otro sitio y a qué dominio.
- **Justificación:** el usuario debe saber a dónde va (N-03) y no debe creer que hay una sesión compartida (RS-05).
- **Criterios de aceptación:**
  1. *Dado* un campus, *cuando* el usuario activa su enlace, *entonces* llega a la página de acceso de ese campus en una sola acción.
  2. *Dado* el enlace, *cuando* se lee o se escucha con lector de pantalla, *entonces* indica que lleva a un sitio externo y nombra el dominio.
  3. *Dado* el paso al campus, *entonces* la plataforma no pide, recibe ni reenvía credenciales (ver RNF-SEG-02).

### RF-05. Orientar cuando la búsqueda no da resultados

- **Descripción:** si una búsqueda no encuentra ningún campus, la plataforma debe decirlo con claridad y ofrecer qué hacer: revisar lo escrito, ver el catálogo completo o contactar con el CAU.
- **Justificación:** evitar que el usuario se quede sin salida (ES-02).
- **Depende de:** SF-12.
- **Criterios de aceptación:**
  1. *Dado* una búsqueda sin coincidencias, *cuando* se muestran los resultados, *entonces* aparece un mensaje con las tres opciones y el contacto del CAU.
  2. *Dado* ese mensaje, *cuando* lo lee un lector de pantalla, *entonces* se anuncia sin que el usuario tenga que buscarlo.

### RF-06. Dar de alta y modificar campus

- **Descripción:** la persona gestora debe poder añadir un campus nuevo y modificar los datos de uno existente sin programar.
- **Justificación:** el catálogo solo es útil si se mantiene (N-06, RS-01).
- **Depende de:** SF-05.
- **Campos obligatorios:** marca, nombre descriptivo, dirección de la página de acceso, descripción breve, estado (activo / en mantenimiento), responsable de la información, fecha de última revisión. Opcionales: logotipo, palabras clave, área, idioma, contacto de escalado.
- **Criterios de aceptación:**
  1. *Dado* un alta con todos los campos obligatorios, *cuando* se guarda, *entonces* el campus aparece en el catálogo.
  2. *Dado* un alta a la que le falta un campo obligatorio, *cuando* se intenta guardar, *entonces* se rechaza indicando qué falta.
  3. *Dado* una dirección cuyo dominio no está en la lista de dominios permitidos o que no usa HTTPS, *cuando* se intenta guardar, *entonces* se rechaza (ver RNF-SEG-04).

### RF-07. Ocultar o retirar un campus sin borrarlo

- **Descripción:** la persona gestora debe poder ocultar un campus (deja de mostrarse pero se conserva) o marcarlo como retirado, y volver a mostrarlo si hace falta.
- **Justificación:** campus que se cierran, o marcas que no deban aparecer con otras (SF-04, N-09). Conservar el historial (N-10).
- **Criterios de aceptación:**
  1. *Dado* un campus visible, *cuando* se oculta, *entonces* deja de aparecer en el catálogo y en las búsquedas, pero sus datos se conservan.
  2. *Dado* un campus oculto, *cuando* se vuelve a mostrar, *entonces* aparece con los mismos datos.

### RF-08. Registrar cada cambio del catálogo

- **Descripción:** cada alta, modificación, ocultación o retirada debe quedar registrada con fecha, autor y qué cambió.
- **Justificación:** detectar errores o manipulaciones (RS-02) y permitir deshacer.
- **Criterios de aceptación:**
  1. *Dado* cualquier cambio, *cuando* se guarda, *entonces* el registro muestra fecha, autor, campus y valores anterior y nuevo.
  2. *Dado* un cambio erróneo, *cuando* la persona gestora lo revisa, *entonces* puede volver al valor anterior a partir del registro.

### RF-09. Controlar la fecha de última revisión de cada campus

- **Descripción:** cada campus debe guardar la fecha en que se revisó por última vez su información, y la plataforma debe señalar a la persona gestora los que lleven más tiempo del fijado sin revisar.
- **Justificación:** evitar que el catálogo se desactualice sin que nadie lo note (RS-01).
- **Valor propuesto [R]:** revisión al menos cada 90 días; a confirmar con la organización (P-C06).
- **Criterios de aceptación:**
  1. *Dado* un campus revisado hace más de 90 días, *cuando* la persona gestora consulta el catálogo, *entonces* aparece señalado como pendiente de revisión.
  2. *Dado* un campus revisado, *cuando* se marca como revisado, *entonces* se actualiza la fecha y queda en el registro de cambios.

## 3. Convenientes (Should) y futuros (Could)

### RF-10. Filtrar por marca y, si se confirma, por área (S)

- **Descripción:** la plataforma debe permitir reducir el catálogo a una marca y, si se confirma la relación entre áreas y campus (P-V09), a un área formativa.
- **Condición:** solo si la organización mantiene esos datos (P-N04).
- **Criterios:** *dado* un filtro por marca, *entonces* solo aparecen los campus de esa marca; el filtro se combina con la búsqueda y se puede quitar en una acción.

### RF-11. Comprobar periódicamente que los enlaces responden (S)

- **Descripción:** la plataforma debe comprobar de forma automática y periódica que la página de acceso de cada campus responde, y avisar a la persona gestora si no.
- **Límite:** la comprobación debe ser **no intrusiva**: solo carga la página pública de acceso, como haría un visitante, como mucho una vez al día por campus y sin intentar iniciar sesión (límites de la ficha).
- **Criterios:** *dado* un campus que no responde en dos comprobaciones seguidas, *entonces* se avisa a la persona gestora; *dado* un campus que responde, *entonces* no se genera aviso.

### RF-12. Página de ayuda con el canal del CAU (S)

- **Descripción:** la plataforma debe tener una página de ayuda breve con preguntas frecuentes («no sé cuál es mi campus», «no puedo entrar») y el contacto del CAU, accesible desde cualquier página.
- **Criterios:** *dado* cualquier página, *entonces* hay un enlace visible a la ayuda; la ayuda explica que las contraseñas se gestionan en cada campus.

### RF-13. Vista para el CAU con estado y contacto de escalado (S)

- **Descripción:** el CAU debe poder ver, para cada campus, su estado, la fecha de última revisión y a quién escalar una incidencia.
- **Condición:** el contacto de escalado puede ser un dato interno; si lo es, esta vista no puede ser pública (cambia SF-03 para esta vista).
- **Criterios:** *dado* un campus en mantenimiento, *entonces* el CAU lo ve marcado; *dado* un usuario sin permiso, *entonces* no ve los contactos de escalado.

### RF-14. Enlace propio y estable para cada campus (S)

- **Descripción:** cada campus debe tener en la plataforma una dirección propia que no cambie aunque cambie la dirección del campus.
- **Criterios:** *dado* un campus cuya dirección de acceso cambia, *cuando* se usa el enlace antiguo de la plataforma, *entonces* lleva a la información actualizada.

### RF-15 a RF-18. Futuros condicionados (C)

| ID | Requisito | Condición para valorarlo |
|---|---|---|
| RF-15 | Mostrar a cada usuario «sus» campus | Identidad común (SF-02, P-I01). Supone tratar datos personales (RS-03) |
| RF-16 | Inicio de sesión único entre campus | Necesidad confirmada (P-N02), identidad común, colaboración de los administradores y Moodle con soporte |
| RF-17 | Mostrar datos obtenidos de Moodle (cursos, avisos) | Versión confirmada (P-C01) y servicios web habilitados (P-C04) |
| RF-18 | Analítica mínima de uso | Finalidad definida y política corporativa (P-L02); sin datos personales si es posible. Serviría para medir PR-07 |

No se escriben criterios de aceptación para los *Could*: se escribirán si alguno pasa a *Should* o *Must*.

## 4. Descartados (Won't) en este proyecto

| ID | Qué no se hará | Motivo |
|---|---|---|
| W-01 | Modificar, actualizar o configurar los campus Moodle | Límite de la ficha; fuera del alcance (alcance preliminar) |
| W-02 | Unificar los campus en un único Moodle | Decisión de la organización, no de esta plataforma |
| W-03 | Pedir, guardar, recuperar o reenviar contraseñas de los campus | Riesgo grave de seguridad (RS-04) |
| W-04 | Gestionar matrículas, usuarios o contenidos de los cursos | Lo hace cada Moodle |
| W-05 | Resolver la versión de Moodle sin soporte | Se comunica a la organización (OS-01), pero no es objeto del proyecto |

## 5. Control de versiones

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| 0.1 | 2026-11-03 | Claude (Analista / Arquitecto) | Primera versión: 18 requisitos funcionales y 5 descartes |
