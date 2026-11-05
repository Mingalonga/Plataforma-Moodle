// Estilo común de los planos (documento ejecutivo, dosier y guía)
// Uso: #import "estilo.typ": *   y   #show: plantilla.with(pie: "…", portada: true)

#let azul = rgb("#1f3a5f")
#let gris = rgb("#5b6470")
#let linea = rgb("#c9ced6")
#let fondo = rgb("#f4f6f9")
#let verde = rgb("#2e6b3f")
#let ambar = rgb("#8a5a00")
#let rojo = rgb("#9b2c2c")

#let plantilla(pie: "", portada: true, doc) = {
  set page(
    paper: "a4",
    margin: (x: 2.2cm, top: 2.2cm, bottom: 2.1cm),
    footer: context {
      if not portada or counter(page).get().first() > 1 [
        #set text(8pt, fill: gris)
        #pie
        #h(1fr)
        #counter(page).display("1 / 1", both: true)
      ]
    },
  )
  set text(font: "Carlito", size: 10.5pt, lang: "es", fill: rgb("#1d232b"))
  set par(justify: true, leading: 0.62em, spacing: 0.9em)
  set list(indent: 0.4em, body-indent: 0.5em, spacing: 0.55em)
  set enum(indent: 0.4em, body-indent: 0.5em, spacing: 0.55em)
  show heading.where(level: 1): it => {
    set text(13pt, weight: "bold", fill: azul)
    block(above: 1.4em, below: 0.65em, sticky: true)[#it.body]
  }
  show heading.where(level: 2): it => {
    set text(11pt, weight: "bold", fill: azul)
    block(above: 1.1em, below: 0.5em, sticky: true)[#it.body]
  }
  set table(
    stroke: (x, y) => (top: if y == 0 { 0pt } else { 0.4pt + linea }, bottom: 0.8pt + azul.lighten(40%)),
    inset: (x: 5pt, y: 4.5pt),
    align: left + top,
  )
  show table.cell.where(y: 0): set text(weight: "bold", fill: azul, size: 9.5pt)
  show table: set text(size: 9.5pt)
  show table: set par(justify: false)
  show raw: set text(size: 8.8pt)
  doc
}

#let nota(titulo, cuerpo) = block(
  width: 100%, inset: (x: 10pt, y: 8pt), stroke: (left: 2pt + azul), fill: fondo,
  breakable: false,
)[#text(weight: "bold")[#titulo] #cuerpo]

#let caja(titulo, cuerpo) = block(
  width: 100%, inset: (x: 10pt, y: 8pt), stroke: (left: 2pt + azul), fill: fondo,
  breakable: true,
)[#text(weight: "bold")[#titulo] #cuerpo]

#let portada(etiqueta, titulo, subtitulo, datos) = page(footer: none)[
  #v(5cm)
  #text(9.5pt, fill: gris, tracking: 0.5pt)[#etiqueta]
  #v(0.4cm)
  #text(24pt, weight: "bold", fill: azul)[#titulo]
  #v(0.5cm)
  #text(13pt, fill: gris)[#subtitulo]
  #v(1fr)
  #line(length: 100%, stroke: 0.6pt + linea)
  #v(0.2cm)
  #grid(columns: (3.2cm, 1fr), row-gutter: 0.55em, ..datos)
  #v(1.5cm)
]

// Caja de un diagrama
#let pieza(cuerpo, color: azul, ancho: auto) = box(
  width: ancho, inset: (x: 7pt, y: 6pt), radius: 3pt, stroke: 0.8pt + color, fill: white,
)[#set text(9pt); #set par(justify: false); #cuerpo]
#let flecha(t: "") = box(inset: (x: 3pt))[#set text(9pt, fill: gris); #align(center)[#t \ #text(13pt)[→]]]
