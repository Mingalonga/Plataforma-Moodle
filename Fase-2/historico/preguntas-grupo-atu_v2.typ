// Preguntas para Grupo ATU · fuente Typst
// Compilar: python3 -c "import typst; typst.compile('preguntas-grupo-atu.typ', output='Preguntas_Grupo-ATU_Plataforma-Moodle_v2.pdf')"

#let azul = rgb("#1f3a5f")
#let gris = rgb("#5b6470")
#let linea = rgb("#c9ced6")
#let version = "v2"

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
    [#texto \ #text(9pt, fill: gris)[#motivo]],
  )
]

#align(center)[
  #v(0.3cm)
  #text(9.5pt, fill: gris, tracking: 0.5pt)[FICHA DE PROYECTO 01 · PROYECTO DE PRÁCTICAS]
  #v(0.2cm)
  #text(18pt, weight: "bold", fill: azul)[Preguntas para Grupo ATU]
  #v(0.1cm)
  #text(11pt, fill: gris)[Plataforma centralizada para los entornos Moodle · Carlos García Rallo · noviembre de 2026]
]

#v(0.4cm)

El proyecto estudia la viabilidad de una herramienta interna para que el Departamento de Pedagogía y e-learning gestione las doce aulas virtuales Moodle desde un único punto, sin tener que entrar y salir de cada una. Informática se encargaría de la implementación. Estas preguntas permitirían ajustar los requisitos y estudiar la viabilidad con datos reales. Bastan respuestas aproximadas y en ningún caso se necesitan datos personales ni contraseñas.

= Departamento de Pedagogía y e-learning

#pregunta(1, [¿Qué tareas realizáis en las aulas (crear cursos, matricular, dar de alta usuarios, revisar informes, copias de cursos…) y cuáles se repiten más?], [Para decidir a qué páginas de gestión debe llevar la plataforma.])
#pregunta(2, [¿Cuántas personas gestionáis las aulas, en cuántas trabaja cada una y cuánto tiempo se dedica hoy a entrar y salir de ellas?], [Para medir el problema y comparar después con la plataforma.])
#pregunta(3, [¿Tenéis una cuenta distinta en cada aula? ¿Con qué permisos?], [Determina si tendría sentido un acceso único para el personal.])
#pregunta(4, [¿Qué os gustaría ver de todas las aulas a la vez? ¿Bastaría con consultarlo o querríais también hacer cambios desde la plataforma?], [Define cuánto debe conectarse la plataforma con Moodle.])

= Informática

#pregunta(5, [¿Qué versión de Moodle tiene cada aula y dónde está alojada?], [Los indicios apuntan a una versión sin actualizaciones de seguridad, lo que condiciona cualquier conexión.])
#pregunta(6, [¿Se podrían activar los servicios web de Moodle, al menos en modo de solo lectura? ¿Existe un aula o un entorno de pruebas?], [Las pruebas de conexión nunca se harían sobre las aulas reales.])
#pregunta(7, [¿Existe un directorio común para el personal (por ejemplo, Microsoft 365)? ¿Hay normas internas de seguridad para herramientas internas?], [Para la identificación del personal y los requisitos de seguridad.])
#pregunta(8, [¿Qué parte del proyecto podría asumir Informática (instalación, permisos, claves de acceso, mantenimiento) y con qué disponibilidad?], [Necesario para repartir tareas y para el estudio de viabilidad.])

= Viabilidad

#pregunta(9, [¿Quién decidiría si el proyecto es viable, con qué criterios (coste, plazo, seguridad, esfuerzo) y con qué presupuesto orientativo?], [Para orientar el estudio de viabilidad a lo que se va a valorar.])

#v(0.5cm)
#line(length: 100%, stroke: 0.6pt + linea)
#text(9pt, fill: gris)[Sustituye a la versión 1 (16 preguntas pensadas para el alumnado y la atención al usuario). Las respuestas se pueden enviar por correo o tratar en una conversación breve de 20 a 30 minutos. Documentación del proyecto: #link("https://github.com/Mingalonga/Plataforma-Moodle")[github.com/Mingalonga/Plataforma-Moodle]]
