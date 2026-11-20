// Preguntas para Grupo ATU · fuente Typst
// Compilar: python3 -c "import typst; typst.compile('preguntas-grupo-atu.typ', output='Preguntas_Grupo-ATU_Plataforma-Moodle_v1.pdf')"

#let azul = rgb("#1f3a5f")
#let gris = rgb("#5b6470")
#let linea = rgb("#c9ced6")
#let version = "v1"

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

El proyecto estudia la viabilidad de un punto de acceso común a las doce aulas virtuales Moodle de Grupo ATU. Hasta ahora se ha trabajado solo con información pública. Las siguientes preguntas permitirían confirmar el problema, ajustar los requisitos y comparar soluciones con datos reales. Bastan respuestas aproximadas, y en ningún caso se necesitan datos personales.

= Organización y decisión

#pregunta(1, [¿Quién impulsa el proyecto, quién decidiría su implantación y quién podría ser la persona de contacto?], [Para validar el alcance con quien decide.])
#pregunta(2, [Si la plataforma se pusiera en marcha, ¿qué persona o departamento mantendría la lista de aulas (altas, cambios y bajas)?], [Sin una persona responsable, ninguna solución es sostenible.])
#pregunta(3, [¿Hay marcas o aulas que no deban aparecer juntas públicamente? ¿Con qué imagen se presentaría la plataforma y se pueden usar los logotipos de cada marca?], [Condiciona la organización del catálogo y su diseño.])
#pregunta(4, [¿Existen más aulas Moodle u otras plataformas de formación además de las doce identificadas? ¿Con qué frecuencia se crean, cambian o retiran?], [Para dimensionar el catálogo y su mantenimiento.])

= Usuarios y atención al usuario

#pregunta(5, [¿Recibe el servicio de atención consultas del tipo «no sé cuál es mi aula» o «no encuentro la dirección»? ¿Cuántas al mes, aproximadamente?], [Es el dato que confirma y mide el problema.])
#pregunta(6, [¿Cómo llegan hoy los usuarios a su aula (correo de bienvenida, enlace de la empresa, buscador…)?], [Para saber dónde falla el recorrido actual.])
#pregunta(7, [¿Hay usuarios con cursos en varias aulas? ¿Usan el mismo usuario y contraseña o cuentas distintas?], [Indica si tendría sentido un acceso común en el futuro.])
#pregunta(8, [¿Cuántos usuarios activos hay aproximadamente y desde qué dispositivos entran (ordenador o móvil)?], [Para fijar los objetivos de rendimiento y las pruebas.])

= Alcance esperado

#pregunta(9, [¿Se espera solo un punto de acceso a las aulas, o también ver información de los cursos o entrar una sola vez en todas?], [Cambia por completo la complejidad de la solución.])
#pregunta(10, [¿La lista de aulas puede ser pública o debe verla solo quien se identifique?], [Si es privada, la plataforma tendría que tratar datos personales.])

= Aspectos técnicos

#pregunta(11, [¿Qué versión de Moodle tiene cada aula y dónde está alojada (servidor propio, proveedor…)?], [Los indicios apuntan a una versión sin actualizaciones de seguridad, lo que limita cualquier integración.])
#pregunta(12, [¿Existe un directorio de usuarios común (por ejemplo, Microsoft 365) o cada aula gestiona sus propias cuentas?], [Determina si es viable un acceso único.])
#pregunta(13, [¿Hay un dominio o alojamiento disponible para la plataforma, o herramientas ya contratadas que convenga reutilizar (web corporativa, gestor de contenidos)?], [Influye en las alternativas y en el coste.])
#pregunta(14, [¿Existe un entorno de pruebas o un aula de pruebas que se pudiera usar más adelante?], [Las pruebas nunca se harán sobre las aulas reales.])

= Recursos y normativa

#pregunta(15, [¿Hay un presupuesto orientativo o un coste mensual máximo aceptable? ¿Qué conocimientos técnicos tiene el personal que la mantendría?], [Necesario para el estudio de viabilidad.])
#pregunta(16, [¿Existe una política corporativa de accesibilidad, privacidad o cookies que la plataforma deba seguir?], [Para ajustar los requisitos legales.])

#v(0.5cm)
#line(length: 100%, stroke: 0.6pt + linea)
#text(9pt, fill: gris)[Las respuestas se pueden enviar por correo o tratar en una conversación breve de 20 a 30 minutos. Documentación del proyecto: #link("https://github.com/Mingalonga/Plataforma-Moodle")[github.com/Mingalonga/Plataforma-Moodle]]
