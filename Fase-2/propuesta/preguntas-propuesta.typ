// Preguntas sobre la propuesta para Grupo ATU · fuente Typst
// Reúne, sin repetir, las preguntas de «Propuesta y viabilidad» v3 (apartado 7) y del dosier de respaldo v4 (apartado 13)
// Compilar desde Fase-2/propuesta: python3 -c "import typst; typst.compile('preguntas-propuesta.typ', output='Preguntas-propuesta_Grupo-ATU_Plataforma-Moodle_v3.pdf')"

#let azul = rgb("#1f3a5f")
#let gris = rgb("#5b6470")
#let linea = rgb("#c9ced6")
#let version = "v3"

#set document(title: "Preguntas para Grupo ATU — Plataforma centralizada Moodle", author: "Carlos García Rallo")
#set page(
  paper: "a4",
  margin: (x: 2.3cm, top: 2.4cm, bottom: 2.2cm),
  footer: context {
    if counter(page).get().first() > 1 [
      #set text(8pt, fill: gris)
      Plataforma centralizada Moodle · Preguntas para Grupo ATU (#version)
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

#let pregunta(n, texto, motivo) = block(breakable: false, above: 0.9em, below: 0.4em)[
  #grid(columns: (1.4em, 1fr), column-gutter: 0.3em,
    text(weight: "bold", fill: azul)[#n.],
    texto,
  )
]

#align(center)[
  #v(0.3cm)
  #text(9.5pt, fill: gris, tracking: 0.5pt)[FICHA DE PROYECTO 01 · PROYECTO DE PRÁCTICAS]
  #v(0.2cm)
  #text(18pt, weight: "bold", fill: azul)[Preguntas sobre la propuesta]
  #v(0.1cm)
  #text(11pt, fill: gris)[Plataforma centralizada para los entornos Moodle · Carlos García Rallo · noviembre de 2026]
]

#v(0.4cm)

= Departamento de Pedagogía y e-learning

#pregunta(1, [¿Los módulos de la propuesta (vista de alumnos, control de accesos, cambios individuales, cambios globales e inventario de aulas) cubren lo que necesitáis y con esas prioridades?], [])
#pregunta(2, [Por «controles de accesos» he entendido revisar las cuentas inactivas, las que nunca han entrado y las suspendidas, y poder suspenderlas o reactivarlas. ¿Es correcto?], [])
#pregunta(3, [Por «cambios globales» he entendido aplicar la misma operación a varias personas o a varias aulas a la vez. ¿Es correcto? ¿Qué cambios globales os serían más útiles (por ejemplo, suspender a una persona en todas las aulas o matricular a un grupo en el mismo curso de varias aulas)?], [])
#pregunta(4, [¿Las matriculaciones se hacen siempre de forma manual o también por cohortes, autoinscripción u otros métodos?], [])

= Informática

#pregunta(5, [¿Consideráis viable la propuesta con las condiciones indicadas, en especial activar los servicios web de Moodle con claves limitadas de lectura y, por separado, de escritura?], [])
#pregunta(6, [¿Están las aulas conectadas a Microsoft 365 para la identificación del personal?], [])

= Dirección

#pregunta(7, [Como responsable del tratamiento, ¿admite Grupo ATU, con el visto bueno de su Delegado de Protección de Datos, que el departamento consulte desde la herramienta los datos del alumnado de todas las aulas?], [])
#pregunta(8, [Si el departamento e Informática valoran bien la propuesta, ¿se autoriza seguir adelante con la validación?], [])
