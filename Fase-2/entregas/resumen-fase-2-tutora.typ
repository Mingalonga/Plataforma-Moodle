// Resumen de la Fase 2 para la tutora · fuente Typst
// Compilar: python3 -c "import typst; typst.compile('resumen-fase-2-tutora.typ', output='Resumen_Fase-2_Plataforma-Moodle_v3.pdf')"  (o: typst compile ...)

#let azul = rgb("#1f3a5f")
#let gris = rgb("#5b6470")
#let linea = rgb("#c9ced6")
#let version = "v3"

#set document(title: "Resumen de la Fase 2 — Plataforma centralizada Moodle", author: "Carlos García Rallo")
#set page(
  paper: "a4",
  margin: (x: 2.3cm, top: 2.4cm, bottom: 2.2cm),
  footer: context {
    if counter(page).get().first() > 1 [
      #set text(8pt, fill: gris)
      Plataforma centralizada Moodle · Resumen de la Fase 2 (#version)
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

// ---------- Portada ----------
#page(footer: none)[
  #v(5.5cm)
  #text(9.5pt, fill: gris, tracking: 0.5pt)[FICHA DE PROYECTO 01 · PROYECTO DE PRÁCTICAS]
  #v(0.4cm)
  #text(24pt, weight: "bold", fill: azul)[Plataforma centralizada para los entornos \ Moodle pertenecientes a Grupo ATU]
  #v(0.5cm)
  #text(13pt, fill: gris)[Fase 2 — Requisitos \ Resumen para la revisión del hito «Requisitos aprobados»]
  #v(1fr)
  #line(length: 100%, stroke: 0.6pt + linea)
  #v(0.2cm)
  #grid(columns: (3.2cm, 1fr), row-gutter: 0.55em,
    text(fill: gris)[Organización], [Grupo ATU],
    text(fill: gris)[Alumno], [Carlos García Rallo],
    text(fill: gris)[Tutora], [],
    text(fill: gris)[Fecha], [5 de noviembre de 2026],
    text(fill: gris)[Versión], [Resumen #version (documentación de la fase en versión 0.3). Sustituye al v2 del 4 de noviembre],
    text(fill: gris)[Estado], [Pendiente de revisión],
  )
  #v(1.5cm)
]

// ---------- Contenido ----------
= 1. Qué ha cambiado con las respuestas de Grupo ATU

El Departamento de Pedagogía y e-learning e Informática han respondido a las nueve preguntas. Confirman el enfoque de gestión interna y concretan lo que se pide:

#nota[Lo que pide el departamento.][Ver a los *alumnos de forma global y por aula*, hacer *controles de accesos* y gestionar *cambios globales o individuales* desde un mismo espacio, con un *estudio de viabilidad real*. Consultar con un enlace no es suficiente: quieren «ir más allá». El alumnado y el profesorado no son usuarios de la plataforma.]

Además:
- Gestionan las aulas *entre 20 y 30 personas*, cada aula por separado y *con roles distintos* en cada una.
- La versión más actualizada es *Moodle 4.1.18*, y no todas las aulas tienen la misma.
- Informática podría dar un *perfil de prueba*, pero *después de tener un plano* de qué hacer y cómo. La herramienta corporativa es *Microsoft 365* y hay normas de seguridad internas.
- Informática tiene poco tiempo: pide un documento *breve, claro y directo*, con un *dosier de respaldo aparte*. Decidirán Informática y Dirección, tras la valoración del departamento.

En sus palabras, el encargo es hacer *«los planos de una casa»* en la que quieren meter ciertas habitaciones.

= 2. Resumen

#nota[Resultado de la fase (versión 0.3)][
- 18 escenarios de uso, cinco de ellos nuevos sobre la gestión del alumnado.
- 22 requisitos de funcionamiento: 15 imprescindibles, 5 convenientes y 2 para el futuro, además de 7 exclusiones expresas.
- 39 requisitos de calidad sobre accesibilidad, seguridad, rendimiento y mantenimiento.
- 47 pruebas definidas, cada una relacionada con la necesidad y el requisito que comprueba.
]

= 3. Qué haría la plataforma

#table(columns: (0.5fr, 1.2fr, 0.7fr),
  [Bloque], [Contenido], [Prioridad],
  [*Base*], [Acceso solo para el personal autorizado y con roles. Lista de las doce aulas con un nombre propio que las distinga y accesos directos a su gestión.], [Imprescindible. Siempre viable, pero el departamento lo considera insuficiente],
  [*Consulta*], [*Ver a los alumnos* de cada aula y de todas a la vez (en qué aulas y cursos está una persona, su estado y su último acceso). *Control de accesos*: cuentas inactivas, que nunca han entrado o suspendidas. Buscar cursos y ver el estado técnico de cada aula.], [Imprescindible lo pedido; el resto, conveniente. Necesita conexión de lectura con Moodle],
  [*Cambios*], [*Cambios individuales* (suspender o reactivar una cuenta, matricular, cambiar el rol) y *globales* (la misma operación en varias personas o aulas a la vez), siempre con vista previa, confirmación, registro y forma de deshacer.], [Imprescindible. Necesita conexión de escritura limitada, aprobada por Informática],
  [*Acceso único*], [Entrar en la plataforma y en las aulas con la cuenta de Microsoft 365.], [Conveniente],
)

#nota[Cómo se compagina con los límites de la ficha.][Todo lo que lea o cambie datos de las aulas se especifica y se *demuestra en aulas de prueba sin datos reales*; nunca se tocan las aulas reales. Llevarlo a ellas dependerá del estudio de viabilidad y de la decisión de Informática y Dirección.]

#pagebreak(weak: true)
= 4. Requisitos de calidad imprescindibles

#table(columns: (0.55fr, 1.45fr),
  [Calidad], [Requisito y valor de referencia],
  [Eficiencia], [El 90 % de las tareas llega a la página de gestión en 3 acciones y 20 segundos o menos. Un mismo cambio en 5 aulas se hace en menos de la cuarta parte del tiempo actual.],
  [Accesibilidad], [WCAG 2.2 nivel AA; uso completo con teclado y lector de pantalla.],
  [Seguridad], [Identificación robusta, preferiblemente con la cuenta corporativa. *Nadie puede hacer desde la plataforma lo que no podría hacer en el aula con su cuenta.* Claves de conexión por aula, con lectura y escritura separadas, custodiadas por Informática. Cumplimiento de las normas internas de Grupo ATU. Registro de entradas, consultas y cambios.],
  [Privacidad], [Los datos del alumnado se consultan cuando hacen falta y no se guarda copia permanente; solo los campos necesarios.],
  [Mantenimiento], [Funciona con aulas en versiones distintas de Moodle y sigue funcionando tras actualizarlas. Guía de operación y reparto de tareas entre el departamento e Informática.],
  [Continuidad], [Si la plataforma falla, las aulas se siguen gestionando como hoy; recuperación en un día laborable.],
)

Los valores numéricos son propuestas razonadas y se ajustarán con el departamento y con Informática.

= 5. Comprobación

Cada requisito se relaciona con la necesidad de la que procede y con la prueba que lo comprobará. Se añade una necesidad expresada por la organización: *gestionar el alumnado y sus accesos en todas las aulas, con cambios globales o individuales, desde un único punto*. Por ejemplo, el escenario «suspender en las tres aulas a una trabajadora que ha dejado la empresa cliente» lleva a los requisitos de cambios globales y de vista previa, que se comprueban en dos aulas de prueba, incluido el caso de que una de ellas no responda.

= 6. Supuestos principales y preguntas abiertas

- *La incógnita principal:* que Informática pueda activar en cada aula la conexión que ofrece Moodle (servicios web), de lectura y de escritura limitada. Es lo que debe contestar la viabilidad.
- «Controles de accesos» se interpreta como revisar y gestionar quién entra en las aulas; «cambios globales», como aplicar la misma operación a varias personas o aulas. Se confirmará con el departamento.
- Los datos del alumnado se consultan con la misma finalidad con la que el departamento ya los gestiona en cada aula.

= 7. Cuestiones para la revisión

#nota[][
+ ¿Se valida que el núcleo pase a ser la vista de alumnos, el control de accesos y los cambios desde la plataforma, demostrado en aulas de prueba?
+ Para responder a Informática, propongo un *documento ejecutivo de viabilidad* breve (los «planos») y un *dosier de respaldo* independiente. ¿Le parece adecuado?
]

= 8. Documentación de soporte

La documentación completa está en el repositorio del proyecto: #link("https://github.com/Mingalonga/Plataforma-Moodle/tree/main/Fase-2")[#text(fill: azul)[github.com/Mingalonga/Plataforma-Moodle/tree/main/Fase-2]]

#table(columns: (0.7fr, 1.3fr),
  [Documento], [Contenido],
  [00 Plan de la fase], [Método, tareas y criterios de finalización],
  [01 Supuestos de partida], [Lo indicado por la tutora, las respuestas de la organización y los supuestos],
  [02 Usuarios y escenarios], [Perfiles y situaciones de uso],
  [03 Requisitos funcionales], [Qué debe hacer la plataforma, con criterios de aceptación y bloques de viabilidad],
  [04 Requisitos no funcionales], [Accesibilidad, seguridad, rendimiento y mantenimiento],
  [05 Trazabilidad], [Relación entre necesidades, requisitos y pruebas],
  [06 Especificación], [Entregable 02],
)

= Glosario

#table(columns: (0.55fr, 1.45fr),
  [Término], [Significado],
  [Acceso directo], [Enlace que lleva a una página concreta de gestión de un aula.],
  [Cambio individual], [Operación sobre una persona en un aula, por ejemplo, suspender su cuenta.],
  [Cambio global], [La misma operación aplicada a varias personas o a varias aulas en una sola orden.],
  [Control de accesos], [Revisión de quién entra en las aulas: cuentas inactivas, que nunca han entrado o suspendidas.],
  [Servicios web de Moodle], [Conexión que ofrece Moodle para que otro programa consulte o cambie datos del aula sin entrar en ella.],
  [Clave de servicio], [Credencial que Informática da a la plataforma para usar los servicios web de un aula, limitada a ciertas funciones.],
  [Aula de pruebas], [Copia de Moodle sin datos reales, donde se puede probar sin riesgo.],
  [Vista previa], [Pantalla que muestra qué se va a cambiar, dónde y a cuántas personas antes de confirmar.],
  [Criterio de aceptación], [Condición comprobable que indica si un requisito se cumple.],
  [Trazabilidad], [Relación que permite seguir cada requisito desde la necesidad que lo origina hasta la prueba que lo comprueba.],
  [MoSCoW], [Método de priorización: imprescindible, conveniente, futuro y excluido.],
  [WCAG 2.2], [Pautas internacionales de accesibilidad web.],
)
