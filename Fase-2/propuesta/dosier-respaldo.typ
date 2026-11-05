// Dosier de respaldo de la propuesta · fuente Typst
// Compilar desde Fase-2/propuesta: python3 -c "import typst; typst.compile('dosier-respaldo.typ', output='Dosier-respaldo_Plataforma-Moodle_v4.pdf')"

#import "estilo.typ": *
#set document(title: "Gestión centralizada de las aulas Moodle — Dosier de respaldo", author: "Carlos García Rallo")
#show: plantilla.with(pie: [Gestión centralizada de las aulas Moodle · Dosier de respaldo (v4)])

#portada(
  [GRUPO ATU · DOSIER DE RESPALDO DE LA PROPUESTA],
  [Gestión centralizada \ de las aulas Moodle],
  [Dosier de respaldo: requisitos, viabilidad técnica, \ seguridad, pruebas e implantación],
  (
    text(fill: gris)[Para], [Departamento de Pedagogía y e-learning, Informática y Dirección],
    text(fill: gris)[Autor], [Carlos García Rallo (proyecto de prácticas, Ficha 01)],
    text(fill: gris)[Fecha], [5 de noviembre de 2026],
    text(fill: gris)[Versión], [4. Basado en la especificación de la Fase 2, versión 0.4],
    text(fill: gris)[Relación], [Respalda el documento «Propuesta y viabilidad». Se puede leer por partes; cada sección es independiente],
  ),
)

#outline(title: [Contenido], depth: 1)

#nota[Cómo leer este dosier.][El documento «Propuesta y viabilidad» (3 páginas) basta para decidir. Este dosier contiene el detalle para quien lo necesite: Informática encontrará lo técnico en las secciones 6 a 8; el Departamento, el funcionamiento en las secciones 2 a 4. Los identificadores (RF, RNF, ES, CP…) remiten a la documentación completa del proyecto. Etiquetas: *[D]* dato de la organización, *[S]* supuesto, *[R]* propuesta razonada pendiente de validar.]

#pagebreak()

= 1. Contexto y petición

Grupo ATU gestiona doce aulas Moodle independientes, cada una en su dirección y con cuentas y roles propios. El Departamento de Pedagogía y e-learning (DPE), entre 20 y 30 personas, realiza toda la gestión de Moodle salvo el diseño y la programación, y hoy tiene que entrar y salir de cada aula para trabajar.

#table(columns: (auto, 1.2fr, 1.3fr),
  [Pregunta], [Respuesta de Grupo ATU (5-11-2026) [D]], [Consecuencia en la propuesta],
  [Tareas], [Todas las de gestión de Moodle, salvo diseño y programación], [La herramienta se centra en gestión, no en diseño],
  [Personas], [Entre 20 y 30], [Roles y permisos por persona],
  [Cuentas], [Cada aula por separado; roles distintos por persona y aula, por seguridad], [Nadie puede hacer en la herramienta más que en el aula (RNF-SEG-12)],
  [*Qué quieren*], [*Ver alumnos global y por aula, controles de accesos, cambios globales o individuales; viabilidad real; más allá de hipervínculos*], [*Los cuatro módulos principales*],
  [Versión], [La más actualizada, 4.1.18; no todas iguales; cambian], [Funcionar con versiones distintas (RNF-MAN-09)],
  [Pruebas], [Perfil de prueba posible cuando haya una base de qué hacer y cómo], [La propuesta y este dosier son esa base],
  [Directorio y normas], [Microsoft 365; normas internas en la sede (recibidas: Política de Seguridad y Normas de uso)], [Acceso con cuenta corporativa; cumplir las normas (RNF-SEG-13 y apartado 8.1)],
  [Informática], [Puede asumirlo todo o delegar; poco tiempo; documento claro y directo], [Documento breve de propuesta + este dosier],
  [Decisión], [DPE valora; Informática y Dirección deciden], [La propuesta termina con la decisión que se pide a cada uno],
)

= 2. Alcance

== Incluido

#table(columns: (1fr, 1.8fr, auto),
  [Módulo], [Detalle], [Requisitos],
  [Vista de alumnos], [Alumnado de un aula (cursos, estado, último acceso) y búsqueda de una persona en todas las aulas], [RF-17],
  [Control de accesos], [Cuentas sin acceso en más de 90 días [R], que nunca han entrado y suspendidas; filtros por aula y curso], [RF-19],
  [Cambios individuales], [Suspender o reactivar; matricular o desmatricular; cambiar el rol en un curso], [RF-15],
  [Cambios globales], [Una operación de RF-15 sobre varias personas o aulas en una orden], [RF-20],
  [Seguridad de los cambios], [Vista previa, confirmación reforzada, registro, deshacer], [RF-21],
  [Base], [Acceso restringido y roles, inventario de aulas, accesos directos, búsqueda, registros], [RF-01 a RF-10],
  [Convenientes], [Cifras por aula, buscar cursos, estado técnico, comprobar que responden, Microsoft 365], [RF-11 a RF-14, RF-16],
  [Futuro], [Indicadores; cambios de ajustes en varias aulas], [RF-18, RF-22],
)

== Excluido

Modificar las aulas en producción durante el proyecto (todo se prueba en aulas de prueba) · guardar contraseñas de las aulas · acceso para alumnado o profesorado · reproducir toda la administración de Moodle · diseño y programación de las aulas · unificar las aulas · resolver la versión de Moodle (W-01 a W-07).

= 3. Usuarios y escenarios

#table(columns: (auto, 1.4fr, 1fr),
  [Perfil], [Quién], [Qué hace en la herramienta],
  [PU-08], [Gestor/a del DPE (principal)], [Consulta, controla accesos y hace cambios en las aulas donde tiene permiso],
  [PU-09], [Técnico/a de Informática], [Instala, da permisos, custodia claves, ve el estado técnico],
  [PU-10], [Responsable del DPE], [Vista de conjunto e indicadores],
  [PU-05], [CAU], [Solo consulta],
)

#table(columns: (auto, 1.7fr, auto),
  [ID], [Escenario representativo], [Requisitos],
  [ES-14], [Una empresa cliente pregunta en qué cursos está una trabajadora: se busca por correo y se ven todas sus aulas y cursos], [RF-17],
  [ES-15], [Al cerrar un plan, revisar quién no ha entrado nunca o lleva 90 días sin entrar], [RF-19],
  [ES-16], [Reactivar a un alumno suspendido por error], [RF-15, RF-21],
  [ES-17], [Suspender en tres aulas a una trabajadora que ha dejado la empresa cliente, en una sola orden], [RF-20, RF-21],
  [ES-03], [Matricular a 15 trabajadores en un curso desde la herramienta], [RF-15, RF-20],
  [ES-18], [Entrar con la cuenta de Microsoft 365], [RF-16],
  [ES-13], [La herramienta no está disponible: se trabaja en las aulas como hoy], [RNF-REN-05],
)

El proyecto describe 18 escenarios en total; los demás cubren el inventario, el mantenimiento y la accesibilidad.

= 4. Requisitos funcionales

Prioridad MoSCoW: *M* imprescindible · *S* conveniente · *C* futuro.

#table(columns: (auto, 1.5fr, auto, 1.5fr),
  [ID], [Requisito], [Prior.], [Criterio de aceptación principal],
  [RF-01], [Solo entra personal autorizado], [M], [Sin identificarse no se ve nada; bajas sin acceso],
  [RF-02], [Roles (gestión, técnico, consulta) y permisos por persona y aula], [M], [Sin permiso en un aula, no se puede actuar en ella],
  [RF-03], [Inventario de aulas sin ambigüedad], [M], [Doce aulas con nombre propio único, estado y responsables],
  [RF-04], [Accesos directos a la gestión de cada aula], [M], [Una acción hasta la página; sin contraseñas],
  [RF-05], [Buscar y filtrar aulas], [M], [Sin distinguir mayúsculas ni tildes],
  [RF-06], [Altas y cambios de aulas sin programar], [M], [Solo dominios permitidos y HTTPS],
  [RF-07], [Ocultar o retirar sin borrar], [M], [Se conservan los datos],
  [RF-08], [Registro de cambios del inventario], [M], [Fecha, autor, antes y después; vuelta atrás],
  [RF-09], [Aviso de aulas sin revisar en 90 días], [M], [Aula señalada],
  [RF-10], [Registro de entradas y permisos], [M], [Solo visible para el rol técnico],
  [RF-11], [Cifras de varias aulas a la vez], [S], [Cursos y matrículas con hora de consulta],
  [RF-12], [Buscar un curso en todas las aulas], [S], [Aparece con su aula],
  [RF-13], [Estado técnico: versión y funciones disponibles], [S], [Lo no disponible no se ofrece],
  [RF-14], [Comprobar que cada aula responde], [S], [Aviso tras dos fallos seguidos],
  [*RF-15*], [*Cambios individuales*], [*M*], [El aula refleja el cambio; un rechazo se muestra],
  [RF-16], [Acceso con Microsoft 365], [S], [Entrada sin contraseña adicional],
  [*RF-17*], [*Vista de alumnos por aula y global*], [*M*], [Persona en dos aulas aparece en una vista; sin datos de aulas sin permiso],
  [RF-18], [Indicadores], [C], [—],
  [*RF-19*], [*Control de accesos*], [*M*], [Inactivas, sin entrar y suspendidas, con filtros],
  [*RF-20*], [*Cambios globales*], [*M*], [Resultado por aula; un fallo no detiene el resto],
  [*RF-21*], [*Vista previa, confirmación, registro, deshacer*], [*M*], [Nada se aplica sin confirmar; deshacer registrado],
  [RF-22], [Ajustes en varias aulas], [C], [—],
)

= 5. Requisitos no funcionales

39 requisitos en los cuatro grupos de la ficha del proyecto. Los más relevantes para la decisión:

#table(columns: (auto, 1.6fr, 1.2fr),
  [ID], [Requisito], [Valor],
  [RNF-UX-01], [Accesibilidad], [WCAG 2.2 AA],
  [RNF-UX-03], [Llegar a una tarea de gestión], [90 % en ≤ 3 acciones y ≤ 20 s [R]],
  [RNF-UX-09], [Ahorro de un cambio global], [5 aulas en < 25 % del tiempo actual [R]],
  [RNF-SEG-01], [Identificación robusta], [Cuenta corporativa con doble factor, o propia con doble factor],
  [RNF-SEG-02], [Contraseñas de las aulas], [Nunca se piden, guardan ni reenvían],
  [RNF-SEG-06], [Claves de servicio], [Una por aula, funciones mínimas, lectura y escritura separadas, revocables],
  [RNF-SEG-07], [Datos del alumnado], [Se leen al consultar; sin copia permanente (temporal ≤ 24 h [R])],
  [RNF-SEG-08], [Registros], [Entradas, permisos, consultas y cambios; 12 meses [R]; no modificables],
  [RNF-SEG-09], [Exposición], [No pública; si Informática lo decide, solo red corporativa],
  [RNF-SEG-12], [Permisos por aula], [Nunca más que con la cuenta propia en el aula],
  [RNF-SEG-13], [Normas internas], [Cumple la lista de 8.1, revisada con Informática],
  [RNF-REN-05], [Si la herramienta cae], [Las aulas se gestionan como hoy],
  [RNF-REN-06], [Recuperación], [≤ 1 día laborable [R]],
  [RNF-REN-07], [Carga de las aulas], [Una petición simultánea por aula como máximo],
  [RNF-REN-08], [Duración de un cambio global], [Una persona en 12 aulas en ≤ 2 min [R]],
  [RNF-MAN-06], [Mantenimiento], [≤ 8 h/mes [S]],
  [RNF-MAN-08], [Actualizaciones de Moodle], [Se repiten las pruebas tras actualizar],
  [RNF-MAN-09], [Versiones distintas], [Detecta y adapta; probado con dos versiones],
)

La lista completa, con su forma de comprobación, está en el documento 04 de la Fase 2.

= 6. Viabilidad técnica

== 6.1 Cómo se conectaría la herramienta con cada aula

Moodle incluye de serie los *servicios web*: una forma oficial de que otro programa pida datos o haga cambios en un aula sin entrar por la página. Funcionan así:

+ Un administrador del aula los *activa* y elige el *protocolo* (REST, el más sencillo).
+ Crea un *servicio*: una lista cerrada de *funciones* permitidas (por ejemplo, «ver usuarios» o «suspender usuario»).
+ Asocia ese servicio a un *usuario* del aula y genera una *clave* (token). Quien tenga la clave solo puede usar esas funciones y *solo con los permisos de ese usuario*.
+ La clave puede *restringirse a una dirección IP* y tener *fecha de caducidad*.

No se instala nada en las aulas ni se cambia su código. Es reversible: basta con desactivar el servicio o borrar la clave.

== 6.2 Funciones de Moodle por requisito

Funciones estándar de Moodle 4.1. La lista exacta y los permisos necesarios se confirmarán en el aula de prueba (prueba V-02).

#table(columns: (1fr, 1.45fr, 1.2fr),
  [Necesidad], [Función de Moodle], [Permiso de Moodle necesario (orientativo)],
  [Versión y funciones disponibles (RF-13)], [`core_webservice_get_site_info`], [Ninguno especial],
  [Buscar a una persona (RF-17)], [`core_user_get_users_by_field`, `core_user_get_users`], [Ver perfiles de usuario],
  [Alumnado de un curso (RF-17, RF-19)], [`core_enrol_get_enrolled_users`], [Ver participantes del curso],
  [Cursos de una persona (RF-17)], [`core_enrol_get_users_courses`], [Ver perfiles y cursos],
  [Buscar cursos (RF-12)], [`core_course_search_courses`, `core_course_get_courses_by_field`], [Ver cursos],
  [Suspender o reactivar (RF-15, RF-20)], [`core_user_update_users`], [Modificar usuarios],
  [Matricular (RF-15, RF-20)], [`enrol_manual_enrol_users`], [Matricular manualmente y asignar roles],
  [Desmatricular (RF-15, RF-20)], [`enrol_manual_unenrol_users`], [Desmatricular manualmente],
  [Cambiar el rol (RF-15)], [`core_role_assign_roles`, `core_role_unassign_roles`], [Asignar roles],
)

*Último acceso.* Moodle guarda el último acceso al sitio y a cada curso; las funciones de usuarios y participantes lo devuelven cuando el usuario de la clave tiene permiso para verlo. Es lo que alimenta el control de accesos (RF-19).

*Matrícula manual.* Las funciones de matrícula actúan sobre el método de *matrícula manual* del curso. Si un aula usa otros métodos (cohortes, autoinscripción), la herramienta lo indicará y esa matrícula se hará en el aula (pregunta P-G08).

== 6.3 Configuración en cada aula (Informática)

#table(columns: (auto, 1.7fr, auto),
  [Paso], [Qué se hace en Moodle (Administración del sitio)], [Tiempo],
  [1], [Activar los servicios web y el protocolo REST], [5 min],
  [2], [Crear un rol limitado con solo los permisos de la tabla 6.2 que se aprueben], [15 min],
  [3], [Crear el usuario (o usuarios, ver 6.4) y asignarle ese rol], [10 min],
  [4], [Crear un servicio externo con solo las funciones aprobadas; separar lectura y escritura], [15 min],
  [5], [Generar la clave, restringida a la IP del servidor de la herramienta y con caducidad], [5 min],
  [6], [Entregar la clave por un canal seguro y anotarla en el inventario de claves de Informática], [10 min],
)

Total orientativo: alrededor de 1 hora por aula [R]. Se hace primero solo en el aula de prueba.

== 6.4 Decisión de diseño clave: ¿con qué permisos actúa la herramienta?

El departamento ha dicho que cada persona tiene roles distintos en cada aula por seguridad (DO-03). La herramienta debe respetarlo. Hay tres formas:

#table(columns: (0.9fr, 1.4fr, 1.1fr, 1.1fr),
  [Opción], [Cómo funciona], [A favor], [En contra],
  [*1. Clave de servicio común*], [Una clave por aula. La herramienta guarda qué puede hacer cada persona en cada aula y lo comprueba antes de actuar.], [Pocas claves (12); fácil de administrar.], [La herramienta tiene que mantener los permisos al día; en el registro de Moodle todo aparece hecho por el usuario de servicio. Para escribir, choca con las normas de acceso personal e intransferible (8.1).],
  [*2. Clave personal*], [Una clave por persona y aula, creada por Informática para la cuenta de esa persona. Moodle aplica sus permisos reales.], [Respeta los roles sin copiarlos; el registro de Moodle muestra a la persona real.], [Hasta 30 × 12 = 360 claves que crear, renovar y retirar.],
  [*3. Mixta*], [Clave común de *lectura* para consultar y claves *personales de escritura* solo para quien haga cambios.], [El riesgo está en la escritura, y ahí se usan los permisos reales; menos claves.], [Algo más compleja de explicar y montar.],
)

#nota[Propuesta.][*Opción 3 (mixta)*, a validar con Informática. Las Normas de uso de Grupo ATU piden que cada acceso sea personal e intransferible y que nadie use el de otra persona (4.4.2 y 4.4.6), lo que refuerza usar claves personales para escribir. La clave común de lectura, que no deja huella de la persona en Moodle, se compensa con el registro de la herramienta (RNF-SEG-08); su encaje lo confirmarán Informática y el Responsable de Seguridad. La decisión final se tomará con Informática una vez aceptada la propuesta, al concretar el diseño. Las claves nunca se obtienen a partir de la contraseña de la persona (W-03).]

== 6.5 Versiones distintas de Moodle

La herramienta preguntará a cada aula su versión y las funciones habilitadas (`core_webservice_get_site_info`) y solo ofrecerá en cada aula lo que esté disponible. Tras actualizar un aula se repetirán las pruebas de consulta y cambios (RNF-MAN-08). Moodle 4.1 dejó de recibir actualizaciones de seguridad en diciembre de 2025: no lo resuelve este proyecto, pero refuerza la necesidad de restringir las claves por IP y limitar funciones.

== 6.6 Pruebas de viabilidad en el aula de prueba

#table(columns: (auto, 1.7fr, 1fr),
  [ID], [Qué se comprueba], [Si falla],
  [V-01], [Se pueden activar los servicios web y REST en el aula de prueba], [No es viable más allá de la base],
  [V-02], [Las funciones de 6.2 están disponibles en la versión del aula y con qué permisos], [Se ajusta la lista; se descartan operaciones],
  [V-03], [Se leen usuarios, cursos, matrículas y último acceso], [Nivel A no viable en esa versión],
  [V-04], [Se suspende, reactiva, matricula y cambia el rol de una persona ficticia], [Nivel B no viable],
  [V-05], [Un cambio en dos aulas de prueba con una de ellas caída da el resultado por aula], [Revisar el diseño del nivel C],
  [V-06], [Una clave restringida por IP no funciona desde otra dirección], [Reforzar la protección],
  [V-07], [Una clave con permisos limitados no puede hacer más de lo concedido], [Revisar el rol limitado],
  [V-08], [Tiempo de las consultas y los cambios; sin efecto apreciable en el aula], [Ajustar la frecuencia y los lotes],
)

= 7. Arquitectura propuesta

Esta es la arquitectura sobre la que se valora la viabilidad. Describe las piezas de la herramienta y cómo se relacionan; la tecnología concreta (lenguaje, servidor, librerías) se elegirá con Informática una vez aceptada la propuesta, y no cambia las conclusiones de este dosier.

#table(columns: (0.9fr, 1.8fr),
  [Pieza], [Función],
  [Interfaz web interna], [Pantallas de vista de alumnos, control de accesos, cambios e inventario. Accesible (WCAG 2.2 AA).],
  [Identificación], [Entrada con la cuenta corporativa (Microsoft 365) o cuenta propia con doble factor.],
  [Permisos], [Roles de la herramienta y comprobación por persona y aula antes de cada acción.],
  [Conector de aulas], [Habla con cada aula por los servicios web: una petición a la vez por aula, con reintentos y detección de versión.],
  [Motor de cambios], [Vista previa, confirmación, ejecución aula por aula, resultado y deshacer.],
  [Registro], [Entradas, consultas de datos personales y cambios; no modificable; 12 meses.],
  [Inventario y claves], [Lista de aulas y referencia a sus claves, que guarda Informática fuera de la herramienta y del código.],
)

== Flujo de un cambio global (ejemplo de ES-17)

+ Ana busca a la persona y elige «suspender en todas sus aulas».
+ La herramienta comprueba en qué aulas tiene Ana permiso para suspender.
+ Consulta el estado actual de la persona en cada una de esas aulas.
+ Muestra la *vista previa*: tres aulas, cursos afectados, estado actual.
+ Ana *confirma* escribiendo el número de aulas (confirmación reforzada).
+ La herramienta aplica el cambio aula por aula y guarda el estado anterior.
+ Muestra el *resultado por aula*; si una falla, permite reintentar solo esa.
+ Todo queda en el *registro*, desde donde se puede *deshacer*.

= 8. Seguridad y protección de datos

#table(columns: (1fr, 1.8fr),
  [Tema], [Medida],
  [Acceso a la herramienta], [Solo personal dado de alta; doble factor; no indexada; red corporativa si Informática lo decide],
  [Permisos], [Tres roles; nunca más permisos que en el aula; revisión de cuentas cada 90 días [R]],
  [Claves de las aulas], [Funciones mínimas; lectura y escritura separadas; IP restringida; caducidad; custodia por Informática; nunca en el código],
  [Contraseñas], [Ninguna contraseña de las aulas pasa por la herramienta],
  [Datos del alumnado], [Solo los campos necesarios; lectura al consultar; sin copia permanente; registro de cada consulta],
  [Base legal], [Misma finalidad con la que el DPE ya gestiona esos datos (gestión de la formación) [S]. El responsable del tratamiento es Grupo ATU, que tiene Delegado de Protección de Datos [D]; falta que confirme que admite la consulta global],
  [Normas internas], [Lista de comprobación de 8.1, revisada con Informática],
  [Pruebas], [Nunca sobre aulas reales; solo aulas de prueba sin datos reales],
)

== 8.1 Lista de comprobación de las normas de Grupo ATU

Grupo ATU ha facilitado su *Política de Seguridad de la Información* (2025, basada en el Esquema Nacional de Seguridad) y sus *Normas de uso de recursos informáticos y deber de confidencialidad* (2026). Estas son las reglas que afectan a la herramienta y cómo las cumpliría:

#block(breakable: false)[
#table(columns: (auto, 1.3fr, 1.5fr),
  [Origen], [Qué pide], [Cómo se cumple],
  [Política (ENS)], [El Responsable del Sistema aprueba los cambios de configuración], [La activación de los servicios web y las claves en cada aula las aprueba él (etapa 0)],
  [Política (ENS)], [Análisis de riesgos cada año y cuando cambian los servicios], [La herramienta entra en el análisis antes de la etapa 0; este dosier (apartado 11) sirve de base],
  [Normas 4.2.2], [Solo el personal autorizado instala aplicaciones], [Informática instala la herramienta o autoriza a quien lo haga; en las aulas no se instala nada],
  [Normas 4.3.4], [Acceso solo a los datos necesarios, con perfiles de acceso], [Tres roles, funciones mínimas por clave y nunca más permisos que en el aula (RNF-SEG-12)],
  [Normas 4.3.10], [Los ficheros temporales con datos personales se borran cuando dejan de ser útiles], [Sin copia permanente; la copia temporal se borra sola en 24 h [R] (RNF-SEG-07)],
  [Normas 4.4.2 y 4.4.6], [Acceso personal e intransferible; nunca usar el de otra persona], [Entrada con la cuenta personal; claves personales para escribir (6.4)],
  [Normas 4.4.9], [Los accesos se pueden supervisar], [Registro de entradas, consultas y cambios, disponible para Informática (RNF-SEG-08)],
  [Normas 4.5.3], [El personal externo necesita autorización del Responsable de Seguridad para conectar equipos propios], [El alumno en prácticas solo conecta su equipo a la red de Grupo ATU con esa autorización],
)]

= 9. Plan de pruebas

47 casos de prueba definidos, cada uno ligado a su requisito. Se ejecutarán sobre aulas de prueba.

#table(columns: (1fr, auto, 1.8fr),
  [Tipo], [Casos], [Ejemplos],
  [Funcionales], [20], [Vista de alumnos en dos aulas; control de accesos; suspender y deshacer; cambio global con un aula caída],
  [Usabilidad y accesibilidad], [6], [Prueba con tareas frente al camino actual; WCAG 2.2 AA; teclado y lector de pantalla],
  [Seguridad], [8], [Permisos por aula; claves limitadas; sin copia de datos; registros; normas internas],
  [Rendimiento], [6], [Tiempo de consulta y de un cambio global; carga sobre las aulas],
  [Mantenimiento], [7], [Alta de un aula con la guía; restauración; dos versiones de Moodle],
)

= 10. Implantación por etapas

#table(columns: (auto, 1.4fr, 1.4fr),
  [Etapa], [Qué se hace], [Para pasar a la siguiente],
  [0], [Análisis de riesgos de la herramienta (Responsable de Seguridad); aprobación del Responsable del Sistema; aula o perfil de prueba y servicios web en ella (Informática)], [Riesgos aceptados; V-01 y V-02 superadas],
  [A], [Consulta: vista de alumnos, control de accesos, inventario], [V-03; prueba con tareas con personal del DPE],
  [B], [Cambios individuales con vista previa, registro y deshacer], [V-04, V-06, V-07; visto bueno de Informática a la escritura],
  [C], [Cambios globales], [V-05, V-08; visto bueno del DPE],
  [D], [Microsoft 365 en la herramienta y, si se decide, en las aulas], [Decisión de Informática],
  [Real], [Llevar a las aulas reales, una a una], [Decisión de Informática y Dirección],
)

Cada etapa es útil por sí sola y se puede detener sin perder lo anterior.

= 11. Riesgos

#table(columns: (auto, 1.3fr, auto, 1.5fr),
  [ID], [Riesgo], [Nivel], [Respuesta],
  [R1], [Cambio global equivocado], [Alto], [RF-21; confirmación reforzada; pruebas V-05],
  [R2], [Robo o mal uso de una clave], [Alto], [Claves limitadas, IP, caducidad, revocables],
  [R3], [Tratamiento de datos sin base suficiente], [Medio], [Confirmación con Grupo ATU y su Delegado de Protección de Datos; sin copias],
  [R4], [Informática no puede dedicar tiempo], [Medio], [Etapas cortas; documento breve; el alumno asume el prototipo],
  [R5], [Una actualización de Moodle rompe la conexión], [Medio], [Detección de versión; repetir pruebas],
  [R6], [Aulas sin soporte de seguridad (Moodle 4.1)], [Medio], [Funciones mínimas e IP restringida; comunicarlo a Informática],
  [R7], [La herramienta falla], [Bajo], [Las aulas se siguen gestionando como hoy],
  [R8], [Interpretar mal «controles de accesos» o «cambios globales»], [Medio], [Confirmación con el DPE antes del prototipo],
)

= 12. Alternativas consideradas

Antes de llegar a la propuesta se han considerado estas opciones:

#table(columns: (1fr, 1.8fr),
  [Alternativa], [Por qué no se elige],
  [No hacer nada], [Se sigue entrando y saliendo de cada aula, que es el problema de partida. Sirve como referencia para medir el ahorro.],
  [Solo enlaces a cada aula], [Es viable y sencillo, pero el departamento ha dicho que no le basta: quiere ver a los alumnos, controlar accesos y hacer cambios. Se mantiene dentro de la propuesta como inventario y accesos directos.],
  [Productos existentes para gestionar varios Moodle (por ejemplo, Moodle Workplace)], [Suelen ser de pago y exigir migrar las aulas a una nueva instalación, lo que cambia la forma de trabajar de todo el personal.],
  [Unificar las aulas en un único Moodle], [Resolvería la dispersión, pero es una migración completa de doce aulas, fuera del alcance del encargo y de la decisión de este proyecto.],
  [*Herramienta propia conectada por servicios web*], [*Es la propuesta*: aprovecha lo que Moodle ya incluye, no toca las aulas, se implanta por etapas y cada etapa es reversible.],
)

Una vez aceptada la propuesta, se documentará una comparación formal con criterios y pesos fijados antes de puntuar, como pide la ficha del proyecto. Esa comparación servirá para afinar la propuesta (por ejemplo, elegir la tecnología), no para volver a abrirla.

= 13. Preguntas pendientes

#table(columns: (auto, 1.6fr, auto),
  [ID], [Pregunta], [Para],
  [P-C04], [¿Se pueden activar los servicios web, de lectura y de escritura limitada?], [Informática],
  [P-G07], [¿«Controles de accesos» es lo descrito en RF-19?], [DPE],
  [P-G08], [¿Qué cambios globales son los más útiles? ¿Se matricula siempre de forma manual?], [DPE],
  [P-I01], [¿Están las aulas conectadas a Microsoft 365?], [Informática],
  [P-L01], [¿Admite Grupo ATU, como responsable del tratamiento y con su Delegado de Protección de Datos, la consulta global?], [Dirección],
  [—], [¿Opción 1, 2 o 3 para los permisos (6.4)?], [Informática],
)

= 14. Trazabilidad resumida

#table(columns: (1.4fr, 1fr, 1fr),
  [Necesidad], [Requisitos], [Pruebas],
  [N-16 Gestionar alumnado y accesos con cambios globales o individuales], [RF-15, RF-17, RF-19 a RF-21], [CP-F-15 a CP-F-19, CP-UX-06, CP-SEG-07],
  [N-11 Gestionar cualquier aula desde un único punto], [RF-04, RF-05, RF-12, RF-16], [CP-F-04, CP-F-05, CP-UX-01],
  [N-13 Consultar varias aulas sin entrar], [RF-11, RF-12, RF-17], [CP-F-11, CP-F-16],
  [N-14 Acceso solo para personal autorizado], [RF-01, RF-02, RF-10, RF-21], [CP-F-01, CP-SEG-01 a 08],
  [N-10 Que el servicio siga y se recupere], [RF-07, RF-13, RF-14], [CP-REN-05, CP-MAN-03, CP-MAN-07],
)

Matriz completa: documento 05 de la Fase 2 (12 necesidades, 22 requisitos funcionales, 39 no funcionales, 47 pruebas).

= Glosario

#table(columns: (0.55fr, 1.45fr),
  [Término], [Significado],
  [Servicios web], [Vía oficial de Moodle para que otro programa consulte o cambie datos sin entrar por la página.],
  [REST], [Forma sencilla de enviar esas peticiones por internet.],
  [Función], [Cada operación concreta que ofrece Moodle por servicios web, como «suspender usuario».],
  [Servicio externo], [Lista cerrada de funciones permitidas para una clave.],
  [Clave (token)], [Credencial que permite usar un servicio, con los permisos de un usuario concreto.],
  [Rol limitado], [Rol de Moodle creado solo con los permisos necesarios.],
  [Vista previa], [Pantalla que muestra qué se va a cambiar antes de confirmar.],
  [Matrícula manual], [Método de matrícula de Moodle en el que la gestión añade a las personas.],
  [MoSCoW], [Prioridades: imprescindible, conveniente, futuro, excluido.],
  [WCAG 2.2 AA], [Pautas internacionales de accesibilidad web, nivel intermedio.],
)
