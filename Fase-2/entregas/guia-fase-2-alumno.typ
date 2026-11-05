// Guía de la Fase 2 para el alumno · fuente Typst
// Compilar: python3 -c "import typst; typst.compile('guia-fase-2-alumno.typ', output='Guia-alumno_Fase-2_Plataforma-Moodle_v3.pdf')"  (o: typst compile ...)

#let azul = rgb("#1f3a5f")
#let gris = rgb("#5b6470")
#let linea = rgb("#c9ced6")
#let version = "v3"

#set document(title: "Guía de la Fase 2 para el alumno — Plataforma centralizada Moodle", author: "Carlos García Rallo")
#set page(
  paper: "a4",
  margin: (x: 2.3cm, top: 2.4cm, bottom: 2.2cm),
  footer: context {
    if counter(page).get().first() > 1 [
      #set text(8pt, fill: gris)
      Plataforma centralizada Moodle · Guía de la Fase 2 para el alumno (#version)
      #h(1fr)
      #counter(page).display("1 / 1", both: true)
    ]
  },
)
#set text(font: "Carlito", size: 10.5pt, lang: "es", fill: rgb("#1d232b"))
#set par(justify: true, leading: 0.62em, spacing: 0.9em)
#set list(indent: 0.4em, body-indent: 0.5em, spacing: 0.55em)
#set enum(indent: 0.4em, body-indent: 0.5em, spacing: 0.55em)

#show heading.where(level: 1): it => {
  set text(13pt, weight: "bold", fill: azul)
  block(above: 1.5em, below: 0.7em, sticky: true)[#it.body]
}
#show heading.where(level: 2): it => {
  set text(11pt, weight: "bold", fill: azul)
  block(above: 1.1em, below: 0.5em, sticky: true)[#it.body]
}

#set table(
  stroke: (x, y) => (top: if y == 0 { 0pt } else { 0.4pt + linea }, bottom: 0.8pt + azul.lighten(40%)),
  inset: (x: 5pt, y: 4.5pt),
  align: left + top,
)
#show table.cell.where(y: 0): set text(weight: "bold", fill: azul, size: 9.5pt)
#show table: set text(size: 9.5pt)
#show table: set par(justify: false)

#let nota(titulo, cuerpo) = block(
  width: 100%, inset: (x: 10pt, y: 8pt), stroke: (left: 2pt + azul), fill: rgb("#f4f6f9"),
  breakable: false,
)[#text(weight: "bold")[#titulo] #cuerpo]

#let caja(titulo, cuerpo) = block(
  width: 100%, inset: (x: 10pt, y: 8pt), stroke: (left: 2pt + azul), fill: rgb("#f4f6f9"),
  breakable: true,
)[#text(weight: "bold")[#titulo] #cuerpo]

// ---------- Portada ----------
#page(footer: none)[
  #v(5.5cm)
  #text(9.5pt, fill: gris, tracking: 0.5pt)[FICHA DE PROYECTO 01 · DOCUMENTO DE TRABAJO DEL ALUMNO]
  #v(0.4cm)
  #text(24pt, weight: "bold", fill: azul)[Guía de la Fase 2: \ Requisitos]
  #v(0.5cm)
  #text(13pt, fill: gris)[Qué se ha hecho, por qué y cómo defenderlo \ Versión 3: respuestas de Grupo ATU]
  #v(1fr)
  #line(length: 100%, stroke: 0.6pt + linea)
  #v(0.2cm)
  #grid(columns: (3.2cm, 1fr), row-gutter: 0.55em,
    text(fill: gris)[Para], [Carlos García Rallo (uso interno, no es para entregar)],
    text(fill: gris)[Fecha], [5 de noviembre de 2026],
    text(fill: gris)[Basada en], [Documentación de la Fase 2, versión 0.3. Sustituye a la guía v2],
  )
  #v(1.5cm)
]

#outline(title: [Contenido], depth: 1)

#pagebreak()

= 1. Qué han respondido y qué significa

Grupo ATU contestó el 5 de noviembre. La mayoría de las respuestas confirman lo que ya suponíamos; *la pregunta 4 lo cambia casi todo*.

#table(columns: (0.9fr, 1.1fr),
  [Lo que dijeron], [Lo que significa para el proyecto],
  [*P1.* El DPE hace «todo» en Moodle, salvo diseño y programación], [Confirmado. El diseño y la programación de las aulas quedan fuera (W-07).],
  [*P2.* Entre 20 y 30 personas], [Más usuarios de los que suponíamos (5 a 20). Más importancia de los roles y permisos.],
  [*P3.* Cada aula por separado, en su URL; cada persona con roles distintos «para salvaguardar los peligros»], [Confirmado. Nueva regla de oro: *la plataforma no puede dar más permisos de los que cada persona tiene en cada aula* (RNF-SEG-12).],
  [*P4.* Ver alumnos de forma global e independiente, controles de accesos, cambios globales o individuales; «si solo fuera un hipervínculo sería suficiente, pero queremos ir más allá»; «esta sí es la parte en la que queremos que trabajes»], [*El cambio principal.* Lo que en la v2 era «futuro» (cambios desde la plataforma, buscar personas) pasa a *imprescindible*. Los accesos directos dejan de ser el núcleo.],
  [*P5.* La más actualizada es la 4.1.18; no todas son iguales y cambian], [La plataforma debe funcionar con versiones distintas a la vez (RNF-MAN-09).],
  [*P6.* Perfil de prueba sí, pero «sin antes tener un plano de trazabilidad no sería viable»], [Primero el plano, después la prueba. No vas a tocar nada real hasta entonces.],
  [*P7.* Microsoft 365; hay normas («consúltalo en la sede»)], [El acceso con la cuenta corporativa sube a conveniente (RF-16). Hay que buscar las normas en la sede (P-G09).],
  [*P8.* Informática puede asumirlo todo o delegar; poco tiempo; «no van a leer 20 páginas»; dosier aparte], [La forma del entregable: *documento breve y directo + dosier independiente*.],
  [*P9.* El DPE valora pros y contras; luego Informática y Dirección deciden], [El documento breve tiene que servir a ese recorrido: pros y contras claros al principio.],
)

#caja[La frase clave.][«Te estamos pidiendo que nos hagas *los planos de una casa* en la que queremos meter ciertas habitaciones.» Traducido: no quieren que construyas la casa, sino el proyecto completo (qué habitaciones, cómo se conectan, qué hace falta para construirlas y si es viable). Las «habitaciones» son la vista de alumnos, el control de accesos y los cambios globales o individuales.]

= 2. Qué documentos han cambiado

#table(columns: (0.9fr, 1.1fr),
  [Documento], [Cambio],
  [Fase 1: registro de preguntas (0.10)], [Respuestas registradas. P-G01, P-G03, P-G04 y P-G05 resueltas; otras en parte. Nuevas P-G07 (qué es «controles de accesos»), P-G08 (qué cambios globales) y P-G09 (normas en la sede).],
  [Fase 2: supuestos (0.3)], [Nuevos datos DO-01 a DO-09. SF-12 («solo cifras») cae. Nuevos SF-15 a SF-18.],
  [Fase 2: escenarios (0.3)], [ES-03 cambia; nuevos ES-14 a ES-18.],
  [Fase 2: requisitos funcionales (0.3)], [RF-15 y RF-17 suben a *Must*; RF-16 a *Should*; nuevos RF-19 a RF-22 y W-07. *Se mantienen los números de la v2.*],
  [Fase 2: no funcionales (0.3)], [De 34 a 39. Nuevos sobre permisos por aula, normas internas, cambios globales y versiones distintas.],
  [Fase 2: trazabilidad (0.3)], [Nueva necesidad N-16; de 36 a 47 pruebas.],
  [Fase 2: plan y especificación (0.3)], [Tareas T13 a T15 y riesgos RP-11 y RP-12.],
  [Entregas], [Resumen para la tutora v3 y esta guía v3. Las preguntas v3 no cambian: ya están respondidas.],
)

= 3. La idea en una frase (actualizada)

#caja[][Una *herramienta interna* para el DPE que, desde un único sitio, permita *ver a los alumnos* de todas las aulas, *controlar sus accesos* y *hacer cambios individuales o globales* en ellas, siempre con vista previa, confirmación y registro, y sin dar a nadie más permisos de los que ya tiene en cada aula. Todo, primero, como *plano* y *estudio de viabilidad*; después, si se aprueba, lo construye Informática.]

Ya no es solo un «panel de mandos» con enlaces: es un *centro de gestión* que habla con las doce aulas.

== Los cuatro bloques

#table(columns: (0.5fr, 1fr, 0.7fr),
  [Bloque], [Qué incluye], [¿Qué necesita de Moodle?],
  [Base (*Must*)], [Acceso restringido y roles, inventario de aulas, accesos directos, registros.], [Nada. Siempre viable, *pero la organización ha dicho que no basta*.],
  [Consulta (*Must* / *Should*)], [*Vista de alumnos* (RF-17) y *control de accesos* (RF-19), imprescindibles; cifras, cursos y estado técnico, convenientes.], [Servicios web *de lectura*.],
  [Cambios (*Must*)], [*Cambios individuales* (RF-15), *globales* (RF-20) y su *seguridad* (RF-21). Cambiar ajustes en varias aulas queda como futuro (RF-22).], [Servicios web *con escritura limitada*, aprobada por Informática.],
  [Acceso único (*Should*)], [Entrar con la cuenta de Microsoft 365.], [Activar la identificación con Microsoft en cada aula.],
)

#caja[Ojo con la defensa de la v2.][En la v2 decíamos «si no es viable, el bloque base funciona igual». Eso sigue siendo cierto, pero *ya no es un buen argumento*: la organización ha dicho que los enlaces no le bastan. Ahora la respuesta correcta es: «el estudio de viabilidad dice, aula por aula, hasta qué bloque se puede llegar».]

= 4. Por qué es técnicamente plausible

Sin elegir todavía la solución (eso es la Fase 3), Moodle 4.1 trae de serie funciones de servicios web que cubren lo que pide el DPE. El estudio de viabilidad tiene que comprobar si están habilitadas, o si Informática las puede habilitar, en cada aula:

#table(columns: (0.9fr, 1.1fr),
  [Lo que pide el DPE], [Funciones estándar de Moodle (a comprobar)],
  [Saber la versión y qué permite cada aula], [`core_webservice_get_site_info`],
  [Ver alumnos, cursos y último acceso], [`core_user_get_users_by_field`, `core_enrol_get_enrolled_users`, `core_enrol_get_users_courses`],
  [Suspender o reactivar], [`core_user_update_users`],
  [Matricular o desmatricular], [`enrol_manual_enrol_users`, `enrol_manual_unenrol_users`],
  [Cambiar el rol], [`core_role_assign_roles`, `core_role_unassign_roles`],
)

#caja[Cómo explicarlo sin tecnicismos.][Cada aula Moodle tiene una «ventanilla» oficial (los servicios web) por la que otro programa puede pedir datos o hacer cambios, con una llave (clave de servicio) que solo abre las puertas que Informática decida. La plataforma sería quien va de ventanilla en ventanilla por ti. *Nunca* usa tus contraseñas.]

= 5. Conceptos nuevos

- *Cambio individual:* una operación sobre una persona en un aula (suspender, reactivar, matricular, cambiar el rol).
- *Cambio global:* la misma operación sobre varias personas o varias aulas en una sola orden.
- *Vista previa:* antes de aplicar nada, la plataforma enseña qué va a cambiar, dónde y a cuántas personas.
- *Confirmación reforzada:* si el cambio afecta a más de un aula o a más de 10 personas, hay que hacer un paso extra (por ejemplo, escribir el número de aulas).
- *Vuelta atrás:* la operación contraria (reactivar, volver a matricular) lanzada desde el registro.
- *Permisos por aula:* la plataforma comprueba que lo que haces lo podrías hacer entrando en el aula con tu cuenta.

= 6. Datos y supuestos

Ahora hay tres tipos: lo que dijo la tutora (DT), *lo que ha respondido la organización (DO-01 a DO-09)* y lo que seguimos suponiendo (SF). Los supuestos que más pesan ahora:

#table(columns: (auto, 0.9fr, 0.8fr, 0.9fr),
  [ID], [Qué suponemos], [Por qué], [Si es falso…],
  [SF-06], [Informática puede habilitar los servicios web], [Moodle los trae de serie; *no lo han contestado*], [No se llega a consulta ni a cambios. Es *la* incógnita],
  [SF-15], [Los datos del alumnado se pueden consultar con la misma finalidad con la que ya se gestionan, sin guardar copia], [Ya los gestionan en cada aula], [La vista global se queda en cifras],
  [SF-16], [«Controles de accesos» = revisar quién entra (inactivos, nunca entraron, suspendidos)], [Interpretación nuestra], [Se rehace RF-19 (P-G07)],
  [SF-17], [«Cambios globales» = misma operación en varias personas o aulas; primero usuarios y matrículas], [Menos riesgo que tocar ajustes], [Cambian las operaciones (P-G08)],
  [SF-18], [Cada aula admite claves limitadas, de lectura y de escritura por separado], [Funcionamiento estándar de Moodle], [Si una clave abre todo, sube el riesgo],
)

#caja[SF-12 ha caído, y está bien.][En la v2 suponíamos que bastaban cifras sin datos de alumnos. La organización ha dicho que quiere ver a los alumnos. No es un error: era un supuesto explícito con su «si es falso», y ahora lo sustituye SF-15. Eso es exactamente lo que valora la ficha.]

= 7. Escenarios nuevos

#table(columns: (auto, 1fr, 1fr),
  [ID], [Escenario], [Requisitos],
  [ES-03], [Matricular a 15 personas *desde la plataforma* (antes, en el aula)], [RF-15, RF-20, RF-21],
  [ES-14], [En qué aulas y cursos está una alumna], [RF-17],
  [ES-15], [Revisar cuentas que no han entrado en 90 días], [RF-19],
  [ES-16], [Reactivar a un alumno suspendido por error], [RF-15, RF-21],
  [ES-17], [Suspender en tres aulas a una trabajadora que ha dejado la empresa cliente], [RF-20, RF-21],
  [ES-18], [Entrar con la cuenta corporativa], [RF-16],
)

= 8. Requisitos: qué ha subido y qué es nuevo

#table(columns: (auto, 1fr, auto),
  [ID], [Requisito], [Prioridad],
  [RF-15], [Cambios individuales en un aula], [C → *M*],
  [RF-17], [Ver a los alumnos de cada aula y de todas], [C → *M*],
  [RF-16], [Entrar con la cuenta de Microsoft 365], [C → *S*],
  [RF-19], [Control de accesos], [*M* (nuevo)],
  [RF-20], [Cambios globales], [*M* (nuevo)],
  [RF-21], [Vista previa, confirmación, registro y vuelta atrás], [*M* (nuevo)],
  [RF-22], [Cambiar ajustes en varias aulas], [C (nuevo)],
  [W-07], [Diseño y programación de las aulas], [Descartado (otro departamento)],
)

Totales: 22 funcionales (15 *Must*, 5 *Should*, 2 *Could*) y 7 descartes. *Los números de la v2 se mantienen*, así que lo que ya conoces sigue llamándose igual.

*No funcionales (39):* lo más importante es que la seguridad sube otra vez: ahora la plataforma lee datos personales y hace cambios. Por eso se añaden la regla de permisos por aula (RNF-SEG-12), las normas internas de Grupo ATU (RNF-SEG-13), el registro de consultas y cambios (RNF-SEG-08 pasa a *Must*), las claves con lectura y escritura separadas (RNF-SEG-06) y que no se guarde copia de los datos del alumnado (RNF-SEG-07). También: un cambio en 5 aulas en menos de la cuarta parte del tiempo actual (RNF-UX-09) y funcionar con versiones distintas de Moodle (RNF-MAN-09).

= 9. Trazabilidad y pruebas

- 12 necesidades dentro del enfoque, todas cubiertas, con la nueva *N-16* (gestionar el alumnado y sus accesos con cambios globales o individuales). N-13 y N-16 dependen de la viabilidad.
- 47 casos de prueba: 20 funcionales, 6 de usabilidad, 8 de seguridad, 6 de rendimiento y 7 de mantenimiento.
- *Regla de oro, reforzada:* todo lo que lea o cambie datos de un aula se prueba en aulas de prueba sin datos reales; para los cambios globales y las versiones distintas hacen falta al menos dos.

= 10. Preguntas que te pueden hacer

#table(columns: (0.8fr, 1.2fr),
  [Pregunta], [Respuesta posible],
  [¿Por qué has cambiado otra vez las prioridades?], [Porque la organización ha respondido y ha dicho qué quiere. Los supuestos estaban escritos con su «si es falso», y la matriz dice qué revisar. He mantenido los números de los requisitos.],
  [¿No es peligroso hacer cambios en doce aulas desde un sitio?], [Sí, por eso hay vista previa, confirmación reforzada, registro y vuelta atrás, nunca más permisos que en el aula, claves limitadas por aula, y todo se prueba antes en aulas de prueba.],
  [¿Y los datos de los alumnos?], [Se consultan cuando hacen falta, no se guarda copia y queda registrado quién los consulta. La finalidad es la misma con la que el departamento ya los gestiona; lo confirmaría con el responsable del tratamiento.],
  [¿Es viable?], [Moodle 4.1 trae de serie las funciones necesarias. Lo que hay que comprobar es si Informática puede habilitarlas en cada aula. Eso es justo el estudio de viabilidad.],
  [¿Qué pasa si las aulas tienen versiones distintas?], [La plataforma pregunta a cada aula qué versión tiene y qué permite, y desactiva en ella lo que no esté disponible.],
  [¿Por qué no lo programas directamente?], [Porque Informática pide primero el plano, y la ficha no permite tocar las aulas reales sin autorización.],
)

= 11. Qué viene ahora (propuesta)

+ *Documento ejecutivo de viabilidad* («los planos»): 2 o 3 páginas, para el DPE, Informática y Dirección. Qué se propone, las «habitaciones», qué necesita Informática, riesgos y cómo se controlan, opciones por niveles, pros y contras, esfuerzo aproximado y la decisión que se pide.
+ *Dosier de respaldo independiente:* la especificación, la trazabilidad, las funciones de Moodle por requisito y el plan de pruebas, para quien quiera el detalle.
+ *Confirmar con el DPE* qué significan «controles de accesos» y «cambios globales» (P-G07, P-G08) y *buscar las normas de seguridad en la sede* (P-G09).
+ *Enviar a la tutora* el resumen v3.
+ Con el plano aprobado, pedir a Informática el *perfil de prueba* y pasar a comparar alternativas (Fase 3).
