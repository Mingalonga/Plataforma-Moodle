// Guía del alumno para la propuesta · fuente Typst
// Compilar desde Fase-2/propuesta: python3 -c "import typst; typst.compile('guia-propuesta-alumno.typ', output='Guia-alumno_Propuesta_Plataforma-Moodle_v5.pdf')"

#import "estilo.typ": *
#set document(title: "Guía del alumno: la propuesta", author: "Carlos García Rallo")
#show: plantilla.with(pie: [Guía del alumno · La propuesta (v5) · uso interno])

#portada(
  [FICHA DE PROYECTO 01 · DOCUMENTO DE TRABAJO DEL ALUMNO],
  [Guía de la propuesta: \ todo lo que hay detrás],
  [Qué se ha hecho, de dónde sale cada dato, qué es seguro \ y qué no, cómo defenderlo y cómo mantener el control],
  (
    text(fill: gris)[Para], [Carlos García Rallo (uso interno, *no es para entregar*)],
    text(fill: gris)[Fecha], [5 de noviembre de 2026],
    text(fill: gris)[Acompaña a], [«Propuesta y viabilidad» v3, dosier de respaldo v4 y preguntas sobre la propuesta v3],
    text(fill: gris)[Basada en], [Especificación de la Fase 2, versión 0.4, y guía de la Fase 2 v3],
  ),
)

#outline(title: [Contenido], depth: 1)

#pagebreak()

= Leyenda de siglas

Todas las siglas e identificadores que aparecen en esta guía, en la propuesta, en el dosier y en la documentación del proyecto. Los identificadores llevan un número (por ejemplo, RF-17) y nunca se reutilizan: si algo se descarta, se tacha o se marca, pero su número no pasa a otra cosa.

== Organización y personas

#table(columns: (auto, 1fr, auto),
  [Sigla], [Significado], [Dónde],
  [DPE], [Departamento de Pedagogía y e-learning: gestiona las aulas y es el usuario principal], [—],
  [CAU], [Centro de atención al usuario (soporte); en la herramienta, solo consulta], [—],
  [A-xx], [Actor: persona, departamento o sistema relacionado con el proyecto (A-13 es el DPE, A-14 Informática)], [Fase 1, doc. 04],
  [PU-xx], [Perfil de usuario: PU-08 gestor/a del DPE, PU-09 técnico/a de Informática, PU-10 responsable del DPE, PU-05 CAU], [Fase 1, doc. 04; Fase 2, doc. 02],
)

== Datos, supuestos y preguntas

#table(columns: (auto, 1fr, auto),
  [Sigla], [Significado], [Dónde],
  [DT-xx], [Dato de la tutora (respuesta del 4-11). Es información confirmada], [Fase 2, doc. 01],
  [DO-xx], [Dato de la organización (respuestas de Grupo ATU del 5-11). Es información confirmada], [Fase 2, doc. 01],
  [SF-xx], [Supuesto de la Fase 2: lo que damos por cierto sin confirmar, con lo que cambiaría si fuera falso], [Fase 2, doc. 01],
  [S-xx], [Supuesto de la Fase 1], [Fase 1, doc. 01],
  [H-xx], [Hecho comprobado en la Fase 1 (por ejemplo, H-04: indicio de Moodle 4.1)], [Fase 1, docs. 03 y 05],
  [P-xx], [Pregunta abierta. La letra indica a quién va: P-G gestión (DPE), P-C configuración de las aulas (Informática), P-I identidad y directorio, P-L legal y datos, P-T tutora, P-O organización, P-U usuarios, P-N necesidades, P-V verificación de las aulas, P-A alumno], [Fase 1, doc. 01],
  [PG-xx], [Pregunta guía de la ficha del proyecto (página 4)], [Fase 1, doc. 01],
  [D-xx], [Dependencia: algo de lo que depende el proyecto (por ejemplo, D-05: implementación por Informática)], [Fase 1, doc. 01],
)

== Necesidades, problemas, alcance y riesgos

#table(columns: (auto, 1fr, auto),
  [Sigla], [Significado], [Dónde],
  [N-xx], [Necesidad: lo que hace falta resolver (N-16: gestionar alumnado y accesos con cambios globales o individuales)], [Fase 1, doc. 05; N-16 en Fase 2, doc. 05],
  [PR-xx], [Problema detectado (PR-09: gestión dispersa, entrar y salir de cada aula)], [Fase 1, doc. 05],
  [AL-xx], [Elemento del alcance preliminar], [Fase 1, doc. 07],
  [RS-xx], [Riesgo del proyecto (por ejemplo, RS-10: la herramienta concentra el acceso a doce aulas)], [Fase 1, doc. 06],
  [RP-xx], [Riesgo propio de una fase (RP-11: que no lean la propuesta por larga; RP-12: cambio global erróneo)], [Fase 2, doc. 00],
  [R1 a R8], [Riesgos del dosier (sección 11)], [Dosier],
  [OS-xx], [Observación de seguridad comunicada a la organización (por ejemplo, la versión sin soporte)], [Fase 1],
)

== Requisitos y pruebas

#table(columns: (auto, 1fr, auto),
  [Sigla], [Significado], [Dónde],
  [ES-xx], [Escenario de uso: una situación concreta de trabajo (ES-17: suspender en tres aulas a una persona)], [Fase 2, doc. 02],
  [RF-xx], [Requisito funcional: algo que la herramienta *hace*], [Fase 2, doc. 03],
  [RNF-xx], [Requisito no funcional: *cómo* lo hace. Grupos: RNF-UX usabilidad y accesibilidad, RNF-SEG seguridad y privacidad, RNF-REN rendimiento y disponibilidad, RNF-MAN mantenimiento], [Fase 2, doc. 04],
  [W-xx], [Descartado expresamente (*Won't*), con su motivo], [Fase 2, doc. 03],
  [CP-xx], [Caso de prueba. Mismos grupos: CP-F funcional, CP-UX, CP-SEG, CP-REN, CP-MAN], [Fase 2, doc. 05],
  [V-xx], [Prueba de viabilidad en el aula de prueba (V-01 a V-08)], [Dosier, 6.6],
  [T-xx / Txx], [Tarea del plan de la fase (T14: la propuesta y el dosier)], [Fase 2, doc. 00],
)

== Prioridades, niveles y etiquetas

#table(columns: (auto, 1fr),
  [Sigla], [Significado],
  [M / S / C / W], [Método *MoSCoW*: *Must* imprescindible, *Should* conveniente, *Could* futuro, *Won't* descartado],
  [Nivel A a D], [Etapas de la propuesta: A consulta, B cambios individuales, C cambios globales, D Microsoft 365],
  [[H]], [Hecho comprobado],
  [[O]], [Observado en la web pública de las aulas],
  [[D]], [Dato de la organización o de la tutora],
  [[S]], [Supuesto],
  [[R]], [Recomendación o propuesta razonada (por ejemplo, un valor numérico sin medir)],
  [[P]], [Pendiente de autorización],
)

== Términos técnicos y normas

#table(columns: (auto, 1fr),
  [Sigla], [Significado],
  [REST], [Forma de enviar peticiones a los servicios web de Moodle],
  [Token], [Clave de servicio de Moodle],
  [IP], [Dirección de red de un equipo; una clave puede limitarse a una IP],
  [LTS], [Versión de Moodle con soporte extendido (la 4.1 lo fue hasta diciembre de 2025)],
  [WCAG 2.2 AA], [Pautas internacionales de accesibilidad web, nivel intermedio],
  [SUS], [Cuestionario estándar de usabilidad de 10 preguntas (68 es la media)],
  [RGPD], [Reglamento General de Protección de Datos],
  [ENS], [Esquema Nacional de Seguridad (Real Decreto 311/2022). La Política de Seguridad de Grupo ATU se basa en él],
  [DPD], [Delegado de Protección de Datos. Grupo ATU tiene uno designado],
  [Resp. del Sistema], [En el ENS, quien gestiona los sistemas y aprueba los cambios de configuración],
  [Resp. de Seguridad], [En el ENS, quien decide las medidas de seguridad y hace el análisis de riesgos],
  [PR], [En GitHub, *pull request*: propuesta de cambios en el repositorio que se revisa y se fusiona. No confundir con PR-xx (problema)],
)

#pagebreak()

= 1. Dónde estamos en el proyecto

La ficha divide el proyecto en fases. Esta tabla es tu mapa: qué está hecho, qué se ha adelantado y qué falta.

#table(columns: (auto, 1fr, 1.6fr),
  [Fase], [Nombre], [Estado a 5 de noviembre],
  [1], [Descubrimiento], [Hecha (resumen v5). Registro de preguntas actualizado a la v0.10 con las respuestas de Grupo ATU.],
  [2], [Requisitos], [Especificación v0.4 hecha. *Hito «requisitos aprobados»: pendiente de la tutora.*],
  [3], [Alternativas], [Adelantada en parte: el dosier recoge las *alternativas consideradas* y por qué no se eligen (sección 12). La comparación formal con criterios y pesos se hará *después* de aceptar la propuesta.],
  [4], [Diseño], [Adelantado en parte: el dosier da la *arquitectura propuesta* (sección 7). La tecnología se elegirá con Informática después de aceptar la propuesta.],
  [5], [Viabilidad], [*Adelantada en parte*: el documento «Propuesta y viabilidad» da una conclusión *preliminar*, basada en la documentación de Moodle, no en pruebas.],
  [6 a 8], [Prototipo, validación y cierre], [Sin empezar. Dependen del aula de prueba.],
)

#caja[El orden ha cambiado respecto a la ficha.][La ficha ordena las fases como alternativas (3), diseño (4) y viabilidad (5). Grupo ATU ha pedido la viabilidad primero, y por eso la propuesta adelanta lo necesario de las fases 3 y 4 (alternativas consideradas y arquitectura propuesta). Una vez aceptada la propuesta, la comparación formal y el diseño detallado solo afinarán la propuesta, sin volver a abrirla. Si la tutora pregunta por el orden, esta es la explicación.]

#caja[Por qué se ha adelantado la viabilidad.][Grupo ATU lo pidió así: «es eso en lo que necesitamos que investigues y hagas una viabilidad real», e Informática no dará un perfil de prueba «sin antes tener un plano de trazabilidad». Sin esta propuesta el proyecto se paraba. Si la tutora pregunta, la respuesta es: *lo he adelantado porque la organización lo necesitaba para darme el entorno de prueba, y lo he marcado como preliminar*.]

= 2. Los tres documentos de hoy

#table(columns: (0.9fr, 0.9fr, 1.6fr),
  [Documento], [Para quién], [Qué hace],
  [*Propuesta y viabilidad* (3 páginas)], [DPE, Informática y Dirección], [Responde a «no van a leer 20 páginas»: qué se propone, si es viable, opciones, riesgos, esfuerzo y la decisión que se pide a cada uno.],
  [*Dosier de respaldo* (10 páginas)], [Quien quiera el detalle, sobre todo Informática], [Responde a «aunque después haya un dosier que lo respalde, que sería independiente». Se puede leer por secciones.],
  [*Esta guía*], [*Solo tú*], [Para que entiendas y controles todo. *No se envía.*],
)

Los dos primeros sustituyen, para la organización, a la especificación completa: son la versión «para decidir» de los mismos requisitos. La especificación (documentos 00 a 06 de la Fase 2) sigue siendo la fuente; si algo cambia, se cambia allí primero y luego aquí.

= 3. La cadena completa: de la respuesta a la propuesta

Todo lo que dicen la propuesta y el dosier sale de algún sitio. Así puedes seguir cualquier afirmación:

+ *Respuesta de Grupo ATU* (literal en el registro de seguimiento de la Fase 2) →
+ *Dato DO-xx* (documento 01) →
+ *Supuesto SF-xx* cuando la respuesta no basta (documento 01) →
+ *Escenario ES-xx* (documento 02) →
+ *Requisito RF / RNF* (documentos 03 y 04) →
+ *Caso de prueba CP-xx* (documento 05) →
+ *Módulo, condición, riesgo o prueba V-xx* en la propuesta y el dosier.

#caja[Ejemplo de principio a fin.][«poder gestionar cambios globales o individuales» (respuesta 4) → *DO-04* → interpretación *SF-17* («la misma operación sobre varias personas o aulas») → *ES-17* (suspender en tres aulas a una trabajadora que se va) → *RF-20* (cambios globales) y *RF-21* (vista previa, confirmación, registro, deshacer) → *CP-F-18* y *CP-F-19* → en la propuesta: módulo «cambios globales», nivel *C*, riesgo «cambio global equivocado» y prueba de viabilidad *V-05*.]

= 4. «Propuesta y viabilidad», sección por sección

#table(columns: (0.75fr, 1.2fr, 1.2fr),
  [Sección], [Qué dice], [De dónde sale y qué vigilar],
  [Párrafo inicial], [Herramienta interna; ver alumnos, controlar accesos, cambios; vía oficial de Moodle; viable técnicamente], [DO-04 + documento 03. «Viable técnicamente» significa *según la documentación*: está dicho que falta comprobarlo],
  [1. Módulos], [Siete filas con prioridad], [RF-15 a RF-21 (imprescindibles), RF-16 (conveniente), RF-18 y RF-22 (futuro). «Módulo» es solo una forma clara de agrupar requisitos; no implica decisión técnica],
  [2. Cómo funcionaría], [Diagrama y cuatro garantías], [RNF-SEG-02, RNF-SEG-07, RNF-SEG-12 y RF-21. *Son compromisos*: no los cambies sin cambiar los requisitos],
  [3. Viabilidad], [Conclusión preliminar (técnicamente viable) y, con su propio título, las cinco condiciones que dependen de Grupo ATU], [Condiciones = SF-06 (servicios web, que aprueba el Responsable del Sistema), SF-05 (validación en prueba, *una vez aceptada la propuesta*), análisis de riesgos del ENS (DO-10), decisión de escritura con clave personal (SF-18 y Normas 4.4.2/4.4.6), SF-15 (datos, con Grupo ATU como responsable del tratamiento y su DPD). Separar «posible técnicamente» de «viable en Grupo ATU» es lo que justifica las condiciones],
  [3. Qué supondría para Informática], [≈ 1 h por aula], [Estimación [R] de los pasos del dosier 6.3. *No la ha validado Informática*],
  [4. Niveles A a D], [Opciones por etapas y recomendación A+B → C → D], [Bloques del documento 03, sección 5. La recomendación es tuya; pueden elegir otra],
  [5. Riesgos], [Cinco riesgos con su control], [Documento 00 (RP-12), riesgos de la Fase 1 (RS-10, RS-11) y DO-05],
  [6. Esfuerzo], [Horas orientativas], [Todas [R]. Ver sección 8 de esta guía],
  [7. Decisión], [Una pregunta para cada uno], [Sigue el recorrido de DO-09: el DPE confirma módulos e interpretaciones; Informática dice si es viable; Dirección autoriza. *No se pide el aula de prueba*: Informática ya dijo (DO-06) que la daría después de tener la base, así que se pedirá cuando acepten la propuesta],
)

= 5. El dosier, sección por sección

#table(columns: (0.7fr, 1.7fr),
  [Sección], [Qué contiene y para qué sirve],
  [1. Contexto], [Las nueve respuestas resumidas y qué consecuencia tienen. Demuestra que has escuchado.],
  [2. Alcance], [Qué entra (por módulos) y qué no (W-01 a W-07).],
  [3. Usuarios y escenarios], [Perfiles y siete escenarios representativos de los 18.],
  [4. Requisitos funcionales], [Los 22 con prioridad y su criterio principal.],
  [5. No funcionales], [18 de los 39, los que más pesan en la decisión.],
  [6. Viabilidad técnica], [*La parte más importante para Informática*: cómo funcionan los servicios web, qué función de Moodle cubre cada requisito, los pasos de configuración, la decisión de permisos, las versiones y las 8 pruebas de viabilidad.],
  [7. Arquitectura propuesta], [Las piezas de la herramienta y el flujo de un cambio global, sobre las que se valora la viabilidad. La tecnología se elige después.],
  [8. Seguridad y datos], [Todas las medidas en una tabla.],
  [9. Pruebas], [Los 47 casos resumidos por tipo.],
  [10. Implantación por etapas], [Etapas 0, A, B, C, D y real, con la condición para pasar de una a otra.],
  [11. Riesgos], [Ocho riesgos con nivel y respuesta.],
  [12. Alternativas], [Las alternativas consideradas y por qué no se eligen. La comparación formal (Fase 3) se hará después de aceptar la propuesta, para afinarla, no para reabrirla.],
  [13. Preguntas pendientes], [Lo que falta saber y a quién preguntarlo.],
  [14. Trazabilidad], [Resumen necesidad → requisito → prueba.],
)

= 6. Conceptos técnicos, explicados a fondo

== Servicios web

Moodle tiene dos «puertas». La *página web*, por la que entras tú con usuario y contraseña, y los *servicios web*, pensados para que *otro programa* hable con Moodle. La app móvil oficial de Moodle, por ejemplo, funciona por los servicios web. Vienen incluidos en Moodle, pero *desactivados* hasta que un administrador los activa.

== REST

Es el «idioma» de la petición. El programa envía una dirección del tipo `https://aula/webservice/rest/server.php` con la clave, el nombre de la función y los datos, y Moodle responde con los resultados. No hace falta que entiendas más: Informática lo conoce.

== Función

Cada operación concreta: `core_user_update_users` sirve para modificar usuarios (entre otras cosas, suspenderlos). El nombre indica el componente de Moodle (`core_user`) y la acción (`update_users`). Moodle 4.1 tiene cientos; los planos usan unas diez (dosier, 6.2).

== Servicio externo

Una *lista cerrada* de funciones que se permite usar con una clave. Si el servicio solo incluye funciones de lectura, con esa clave *no se puede cambiar nada*, aunque el usuario tuviera permisos. Por eso se proponen dos servicios por aula: uno de lectura y otro de escritura.

== Clave (token)

Una cadena larga de letras y números que hace de «llave». Cada clave está ligada a *un usuario* del aula y a *un servicio*. Lo que se puede hacer con ella es lo que permite *a la vez* el servicio (qué funciones) y el usuario (qué permisos). Se puede restringir a una *dirección IP* (solo funciona desde el servidor de la herramienta) y ponerle *caducidad*. Si se pierde, se borra y se crea otra.

#caja[Por qué es más seguro que guardar contraseñas.][Una contraseña da acceso a todo lo que puede hacer la persona, por la página y desde cualquier sitio. Una clave limitada solo sirve para unas funciones concretas, desde una IP concreta y hasta una fecha. Y se puede revocar sin cambiar la contraseña de nadie.]

== Rol y permiso (capacidad)

En Moodle, un *rol* (gestor, profesor, estudiante…) es un conjunto de *permisos* llamados *capacidades*, como «modificar usuarios» o «matricular». Los roles se asignan en un *contexto*: todo el sitio, una categoría o un curso. Por eso una persona puede ser gestora en un curso y no en otro. Esto es lo que dijo Grupo ATU en la pregunta 3, y es la base de RNF-SEG-12.

== Usuario de servicio

Una cuenta del aula que no es de ninguna persona, creada solo para la herramienta, con un *rol limitado* a los permisos necesarios.

== Matrícula manual

Moodle tiene varios *métodos de matrícula*: manual (la gestión añade a las personas), autoinscripción, por cohortes, etc. Las funciones de matrícula de la propuesta actúan sobre la *manual*. Si algún aula matricula de otra forma, esa parte se haría en el aula. Por eso está en la pregunta P-G08.

== Suspender frente a borrar

Suspender una cuenta impide entrar, pero conserva todo (cursos, notas, historial) y se puede reactivar. Borrar es irreversible. *La propuesta solo contempla suspender*, nunca borrar. Si te preguntan, es a propósito.

== Último acceso

Moodle guarda la fecha del último acceso de cada persona al sitio y a cada curso. Es lo que permite el control de accesos sin entrar en cada aula.

== Versión 4.1 y soporte

Moodle publica versiones con soporte limitado. La 4.1 es una versión de soporte extendido cuyo soporte de seguridad terminó en diciembre de 2025. «4.1.18» es una revisión dentro de la 4.1. No es tu problema resolverlo (W-06), pero sí debes mencionarlo, porque abrir servicios web en una versión sin soporte exige más precaución.

= 7. La decisión de los permisos, con un ejemplo

Es la decisión técnica más delicada (dosier, 6.4). Imagina a *Luis*, del DPE, que puede matricular en el aula A pero no en la B.

#table(columns: (0.7fr, 1.5fr, 1.2fr),
  [Opción], [Qué pasa si Luis intenta matricular en la B], [Quién aparece en el registro de Moodle],
  [1. Clave común], [La herramienta consulta su propia tabla de permisos y le dice que no. *Si la tabla estuviera mal, la clave común sí podría hacerlo.*], [El usuario de servicio],
  [2. Clave personal], [Moodle rechaza la operación, porque Luis no tiene ese permiso en la B. La herramienta no necesita saber nada.], [Luis],
  [3. Mixta], [Para mirar usa la clave común (solo lectura). Para matricular usa la clave personal de Luis: Moodle la rechaza.], [Luis, en los cambios],
)

La opción 3 pone la seguridad fuerte donde está el riesgo (los cambios) y reduce el número de claves. *No está decidida*: es una propuesta para hablar con Informática. Las claves personales las crea Informática desde la administración del aula; *nunca* se generan pidiendo la contraseña a la persona (eso sería W-03).

= 8. Cada número: de dónde sale y cómo defenderlo

Ningún número de la propuesta ni del dosier está medido. Todos son propuestas razonadas [R] o supuestos [S]. Si te los discuten, *se cambian*: no son compromisos de la organización.

#table(columns: (0.9fr, 1.6fr),
  [Valor], [Origen y defensa],
  [90 días sin acceso], [Un trimestre: plazo habitual para considerar una cuenta inactiva. Configurable (RF-19).],
  [Confirmación reforzada con más de 1 aula o más de 10 personas], [Umbral prudente: un error en una persona se corrige fácil; en muchas, no. Ajustable (RF-21).],
  [≈ 1 h por aula de configuración], [Suma de los seis pasos del dosier 6.3 para alguien que conoce Moodle. Lo confirmará Informática en el aula de prueba.],
  [2 a 4 h para el aula de prueba], [Crear un perfil o copiar un aula sin datos reales. Depende de cómo trabaje Informática.],
  [≤ 8 h al mes de mantenimiento], [Antes eran 4 h; se doblan porque ahora hay claves, permisos y pruebas tras cada actualización (RNF-MAN-06).],
  [Cambio en 5 aulas en < 25 % del tiempo], [Entrar, buscar y cambiar en 5 aulas frente a una orden con vista previa. Se medirá en la prueba con tareas (CP-UX-06).],
  [Una persona en 12 aulas en ≤ 2 min], [Doce peticiones, una por aula, con margen para aulas lentas (RNF-REN-08).],
  [Copia temporal ≤ 24 h], [Permite volver a una lista sin pedirla otra vez, sin acumular datos (RNF-SEG-07).],
  [Registros 12 meses], [Un año permite revisar cualquier incidencia del curso. Ajustable a la política de la empresa (RNF-SEG-08).],
  [20 a 30 personas], [*Dato* de Grupo ATU (DO-02).],
  [4.1.18], [*Dato* de Informática (DO-05).],
)

= 9. Qué es seguro y qué no

Para que no te pillen en una afirmación demasiado fuerte:

#table(columns: (1fr, 1fr),
  [*Seguro (dato o hecho)*], [*No seguro (supuesto o por comprobar)*],
  [Lo que respondió Grupo ATU (DO-01 a DO-09)], [Que Informática quiera y pueda activar los servicios web (SF-06)],
  [Que Moodle incluye servicios web de serie], [Que las funciones de la tabla 6.2 estén habilitadas en *sus* aulas y con *sus* permisos (V-02)],
  [Que existen funciones estándar para leer usuarios, matricular, suspender y asignar roles], [Que todas las aulas matriculen de forma manual (P-G08)],
  [Que las claves se pueden limitar por funciones, IP y fecha], [Qué entienden exactamente por «controles de accesos» (SF-16) y «cambios globales» (SF-17)],
  [Que Moodle 4.1 dejó de tener soporte de seguridad en diciembre de 2025], [Que la consulta global de alumnos esté cubierta por la base legal actual (SF-15)],
  [], [Todas las horas y plazos],
)

#caja[La frase que te protege.][«La conclusión es preliminar y se basa en la documentación de Moodle. Por eso pido un aula de prueba: para confirmarla antes de que nadie decida implantar nada.»]

== Las normas de Grupo ATU, en claro

Grupo ATU te ha pasado dos documentos (DO-10). Responden a la pregunta P-G09 y cambian algunas cosas de la propuesta:

#table(columns: (0.9fr, 1.6fr),
  [Documento], [Qué te importa],
  [*Política de Seguridad de la Información* (2025, pública)], [Grupo ATU sigue el *ENS*. Hay roles fijos: el *Responsable del Sistema* aprueba los cambios de configuración (activar servicios web lo es) y el *Responsable de Seguridad* hace el análisis de riesgos, cada año y cuando cambian los servicios. Por eso la propuesta tiene ahora cinco condiciones y la etapa 0 empieza por ese análisis. El responsable del tratamiento de datos es *Grupo ATU*, con un *DPD* designado: la pregunta ya no es «quién», sino «¿lo admite?».],
  [*Normas de uso y deber de confidencialidad* (2026, *confidencial*)], [Las reglas que más afectan: acceso solo a los datos necesarios (4.3.4); borrar los temporales con datos personales (4.3.10); acceso personal e intransferible, nunca el de otro (4.4.2 y 4.4.6); los accesos se supervisan (4.4.9); y, como externo, no conectar tu equipo a su red sin autorización del Responsable de Seguridad (4.5.3). La lista completa con cómo se cumple cada una está en el dosier, 8.1.],
)

#caja[Cuidado con el documento confidencial.][Las Normas de uso están marcadas como confidenciales. Puedes citar el número de cada norma, como hace el dosier, pero *no lo subas al repositorio ni lo reenvíes* a nadie de fuera de Grupo ATU (tampoco a la tutora sin preguntar antes). Aplica tú mismo la norma 4.5.3: pide autorización antes de conectar tu portátil a su red.]

= 10. Riesgos para ti (cómo no perder el control)

#table(columns: (1fr, 1.5fr),
  [Riesgo], [Qué hacer],
  [*Que el alcance crezca sin control* («ya que estás, ¿podrías…?»)], [Todo lo nuevo se anota como requisito con prioridad. Si es grande, va a *Could* o a otra fase. El documento 00 y el registro de cambios de alcance lo dejan escrito.],
  [*Prometer de más*], [Habla de «prototipo en aula de prueba» y «viabilidad preliminar». Nunca digas «funcionará en vuestras aulas» hasta superar V-01 a V-08.],
  [*Tocar algo real*], [La ficha lo prohíbe sin autorización expresa. Aunque te den acceso, *no pruebes nada en las aulas reales* (W-01).],
  [*Datos personales*], [Aula de prueba con personas ficticias. Ninguna captura con datos reales en la documentación.],
  [*Recibir claves o contraseñas reales por correo*], [Pide que vayan por un canal seguro y que sean solo del aula de prueba. Nunca las subas al repositorio.],
  [*Que Informática lo asuma «todo» y te quedes sin papel*], [DO-08 dice que pueden asumirlo o delegar. Ofrece lo que el proyecto necesita: prototipo, pruebas y documentación.],
  [*Comprometer plazos*], [Los tiempos son orientativos. No pongas fechas sin hablarlo con la tutora.],
)

= 11. Cómo y a quién enviarlo

Según DO-09, el orden es: el DPE valora, después Informática y Dirección. Propuesta:

+ Enviar a tu contacto del DPE (quien respondió) el documento *«Propuesta y viabilidad»* y el *dosier* como dos archivos separados.
+ Enviar a la tutora el *resumen de la Fase 2 v3* y avisarle de que has enviado la propuesta.
+ No enviar esta guía ni la especificación completa salvo que la pidan.

#caja[Borrador de mensaje para el DPE.][
Buenos días:

Muchas gracias por las respuestas; me han aclarado mucho el encargo. Os adjunto la propuesta en dos documentos:

- *Propuesta y viabilidad* (3 páginas): qué se propone, si es viable, opciones por niveles, riesgos y la decisión que pido a cada uno.
- *Dosier de respaldo*, independiente, con el detalle técnico para quien lo necesite.

Lo más importante: la conclusión es que *es viable técnicamente*, porque Moodle ya incluye lo necesario, pero hay que *confirmarlo en un aula o perfil de prueba* antes de decidir nada. También os agradecería que me confirmarais si «controles de accesos» y «cambios globales» significan lo que describo en el apartado 1.

Un saludo,
Carlos
]

= 12. Preguntas difíciles y respuestas

#table(columns: (0.85fr, 1.15fr),
  [Pregunta], [Respuesta posible],
  [¿Por qué no usáis un producto ya hecho?], [Es una de las alternativas (dosier, 12). Suelen ser de pago y exigir migrar las aulas. Las compararé con criterios antes de decidir.],
  [¿Y si alguien roba la clave?], [Solo sirve desde la IP del servidor, para unas funciones, hasta una fecha, y se revoca en un minuto.],
  [¿Quién responde si un cambio global sale mal?], [La persona que lo confirma, como hoy en el aula. La herramienta muestra antes qué va a cambiar, lo registra y permite deshacerlo.],
  [¿Esto cumple la protección de datos?], [No se guarda copia; se registra cada consulta; la finalidad es la misma de hoy. El responsable del tratamiento es Grupo ATU, que tiene DPD; debe confirmar que admite la consulta global, y está en las condiciones. Además, la herramienta cumple la lista de normas del dosier (8.1).],
  [¿Cuánto cuesta?], [Sin licencias. Coste en horas: unas 12 h de configuración de Informática para las doce aulas, un servidor interno y menos de 8 h al mes de mantenimiento. Son estimaciones.],
  [¿Puedes programarlo ya?], [Primero el aula de prueba y la validación de los niveles A y B. Es lo que pide Informática y lo que permite la ficha.],
  [¿Por qué no borrar las cuentas inactivas?], [Borrar es irreversible y elimina historial y notas. Suspender consigue lo mismo y se puede deshacer.],
  [¿Y si cada aula tiene una versión?], [La herramienta pregunta a cada aula qué permite y solo ofrece eso.],
  [¿Qué pasa si se cae la herramienta?], [Nada grave: se sigue trabajando en cada aula como hoy.],
)

= 13. Tablero de control

== Pendiente

#table(columns: (auto, 1.5fr, 0.8fr, 0.7fr),
  [N.º], [Qué], [Quién], [Estado],
  [1], [Revisar y fusionar la PR de esta versión (normas incorporadas)], [Tú], [Pendiente],
  [2], [Enviar la propuesta y el dosier al DPE], [Tú], [Pendiente],
  [3], [Enviar el resumen v3 a la tutora], [Tú], [Pendiente],
  [4], [Confirmar «controles de accesos» y «cambios globales» (P-G07, P-G08)], [DPE], [Preguntado en la propuesta],
  [5], [Normas de seguridad (P-G09)], [Informática], [*Hecho*: recibidas la Política de Seguridad y las Normas de uso (DO-10)],
  [6], [Aula o perfil de prueba con servicios web], [Informática], [Se pedirá cuando acepten la propuesta (DO-06)],
  [7], [Decisión sobre la escritura y la opción de permisos], [Informática y Dirección], [Pendiente],
  [8], [¿Admite Grupo ATU la consulta global? (P-L01)], [Dirección con el DPD], [Preguntado. Ya se sabe que el responsable es Grupo ATU],
  [9], [Hito «requisitos aprobados»], [Tutora], [Pendiente],
)

== Decisiones ya tomadas (y dónde están escritas)

- Enfoque de gestión interna (tutora, 4-11) → registro de seguimiento de la Fase 1.
- Núcleo: vista de alumnos, control de accesos y cambios (Grupo ATU, 5-11) → documento 03 v0.3 y cambios de alcance de la Fase 2.
- Se suspende, no se borra → propuesta y RF-15.
- Todo se prueba en aulas de prueba → regla del documento 05.
- Formato del entregable: documento breve + dosier → T14 del plan.
- Sin analogía de «la casa» ni «habitaciones»: se habla de *módulos* (decisión del alumno, 5-11).
- Para escribir en las aulas, claves personales: lo piden las Normas de uso (4.4.2 y 4.4.6) → dosier 6.4 y 8.1.

== Lo que no debes hacer

Probar en aulas reales · guardar contraseñas · subir claves al repositorio · usar datos reales en pruebas o capturas · prometer plazos o implantación · aceptar trabajo nuevo sin anotarlo como requisito.

= 14. Qué viene después, según lo que respondan

#table(columns: (1fr, 1.6fr),
  [Si responden…], [Siguiente paso],
  [«Adelante con A y B; os damos el aula de prueba»], [Pruebas V-01 a V-04; después, Fase 3 (comparar alternativas) y Fase 4 (diseño) con datos reales de viabilidad.],
  [«Solo lectura por ahora»], [Nivel A. Los cambios pasan a *Should* condicionado; se actualiza el documento 03.],
  [«Las interpretaciones no son correctas»], [Se corrigen SF-16 o SF-17 y los requisitos afectados (la matriz del documento 05 dice cuáles).],
  [«No es viable activar servicios web»], [La propuesta se reduce a la base, que ellos consideran insuficiente. Habría que estudiar alternativas (productos o unificación) en la Fase 3.],
  [No responden], [Seguir con la Fase 3 sobre supuestos, como en la Fase 2, y montar un aula de prueba propia, local y sin datos reales.],
)

= 15. Dónde está cada cosa

#table(columns: (1.1fr, 1.4fr),
  [Archivo], [Ubicación],
  [Propuesta y viabilidad (PDF)], [Repositorio: `Fase-2/propuesta/` · Carpeta del proyecto: `Fase-2/Propuesta/`],
  [Dosier de respaldo (PDF)], [Ídem],
  [Esta guía (PDF)], [Ídem],
  [Fuentes Typst de los tres], [`Fase-2/propuesta/*.typ` (estilo común en `estilo.typ`); versiones anteriores en `Fase-2/propuesta/historico/`],
  [Especificación completa], [`Fase-2/00` a `06` (versiones 0.3 y 0.4)],
  [Respuestas literales de Grupo ATU], [`Fase-2/registro-seguimiento.md`],
  [Preguntas y su estado], [`Fase-1/01-registro-preguntas-supuestos.md` (v0.11)],
  [Normas de Grupo ATU], [*No están en el repositorio.* Solo se citan. La Política de Seguridad es pública; las Normas de uso son confidenciales],
)

= Glosario rápido

#table(columns: (0.55fr, 1.45fr),
  [Término], [Significado],
  [DO-xx], [Dato de la organización (respuestas del 5-11).],
  [SF-xx], [Supuesto de la Fase 2.],
  [V-xx], [Prueba de viabilidad en el aula de prueba (dosier, 6.6).],
  [Nivel A a D], [Etapas de la propuesta: consulta, cambios individuales, cambios globales, Microsoft 365.],
  [Módulo], [Cada gran función de la herramienta (vista de alumnos, control de accesos, cambios…).],
  [Clave limitada], [Token de Moodle restringido por funciones, permisos, IP y fecha.],
  [Capacidad], [Permiso concreto de Moodle dentro de un rol.],
  [Contexto], [Nivel donde se asigna un rol en Moodle: sitio, categoría o curso.],
)
