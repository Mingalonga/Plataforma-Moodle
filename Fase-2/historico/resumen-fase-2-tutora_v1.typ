// Resumen de la Fase 2 para la tutora · fuente Typst
// Compilar: python3 -c "import typst; typst.compile('resumen-fase-2-tutora.typ', output='Resumen_Fase-2_Plataforma-Moodle_v1.pdf')"  (o: typst compile ...)

#let azul = rgb("#1f3a5f")
#let gris = rgb("#5b6470")
#let linea = rgb("#c9ced6")
#let version = "v1"

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
    text(fill: gris)[Fecha], [3 de noviembre de 2026],
    text(fill: gris)[Versión], [Resumen #version (documentación de la fase en versión 0.1)],
    text(fill: gris)[Estado], [Pendiente de revisión],
  )
  #v(1.5cm)
]

// ---------- Contenido ----------
= 1. Resumen

La Fase 2 traduce el diagnóstico de la Fase 1 en una descripción precisa de lo que debería hacer la plataforma, cómo debería comportarse y cómo se comprobará que lo cumple. No decide todavía la solución técnica, que se elegirá en la Fase 3 comparando alternativas.

#nota[Resultado de la fase][
- 13 escenarios de uso que describen situaciones reales de alumnado, profesorado, empresas, atención al usuario y mantenimiento.
- 18 requisitos de funcionamiento: 9 imprescindibles, 5 convenientes y 4 para el futuro, además de 5 exclusiones expresas.
- 30 requisitos de calidad sobre accesibilidad, seguridad, rendimiento y mantenimiento.
- 33 pruebas definidas. Cada requisito se relaciona con la necesidad de la que procede y con la prueba que lo comprobará.
]

#nota[Punto de partida.][La organización no ha respondido todavía a las preguntas de la Fase 1. Para avanzar se han fijado 14 supuestos explícitos, y en cada uno se indica qué requisitos habría que revisar si no se confirmara.]

= 2. Metodología

#table(columns: (auto, 1fr, 0.8fr),
  [], [Paso], [Resultado],
  [1], [Fijar los supuestos de partida], [14 supuestos con su efecto],
  [2], [Describir situaciones de uso a partir de los perfiles de la Fase 1], [13 escenarios],
  [3], [Redactar los requisitos con prioridad y criterio de aceptación], [48 requisitos],
  [4], [Relacionar necesidades, requisitos y pruebas], [Matriz de trazabilidad y 33 pruebas],
  [5], [Reunir todo en la especificación], [Entregable 02],
)

La prioridad se asigna con el método MoSCoW, el mismo que en la Fase 1. Cada requisito imprescindible tiene un criterio de aceptación que permite decir, sin interpretación, si se cumple o no.

= 3. Escenarios de uso

#table(columns: (0.6fr, 1.4fr),
  [Grupo], [Situaciones descritas],
  [Encontrar el aula], [Conociendo la marca; sin conocerla; distinguiendo aulas con el mismo nombre; desde el móvil; con lector de pantalla o solo con teclado.],
  [Orientar a otros], [Alumnado con cursos en varias aulas; profesorado que comparte un enlace; empresa cliente que informa a su plantilla; atención al usuario ante «no sé cuál es mi aula».],
  [Mantener], [Alta de un aula nueva; cambio, mantenimiento o retirada; enlace que deja de funcionar; caída de la propia plataforma.],
)

#pagebreak(weak: true)
= 4. Requisitos imprescindibles

Constituyen la primera versión que se construirá como prototipo.

#table(columns: (0.55fr, 1.45fr),
  [Ámbito], [Requisito],
  [Consulta], [Catálogo público de las aulas, sin necesidad de identificarse. Cada aula se identifica por su marca, un nombre propio, su logotipo y la dirección a la que lleva.],
  [Búsqueda], [Buscador que encuentra el aula aunque se escriba solo una parte del nombre, sin tener en cuenta mayúsculas ni tildes. Si no hay resultados, indica qué hacer y cómo contactar con atención al usuario.],
  [Acceso], [Paso directo a la página de entrada de cada aula, avisando de que se sale a otro sitio.],
  [Mantenimiento], [Altas, cambios y retiradas sin necesidad de programar; registro de cada cambio; aviso de las aulas sin revisar en 90 días.],
)

#table(columns: (0.55fr, 1.45fr),
  [Calidad], [Requisito y valor de referencia],
  [Accesibilidad], [Pautas WCAG 2.2 nivel AA; uso completo con teclado y lector de pantalla; adaptación a cualquier pantalla desde el móvil.],
  [Facilidad de uso], [Al menos el 80 % de las personas de prueba encuentra su aula sin ayuda y en menos de un minuto.],
  [Seguridad y privacidad], [Sin datos personales, contraseñas, cookies de seguimiento ni rastreadores; conexión cifrada; solo se admiten direcciones de dominios autorizados.],
  [Rendimiento y continuidad], [Carga en el móvil en 2,5 segundos o menos; si la plataforma falla, las aulas siguen accesibles por su dirección; recuperación en un día laborable.],
  [Mantenimiento], [Una persona sin conocimientos técnicos da de alta un aula en 15 minutos o menos con la guía; copias y responsable designado.],
)

Los valores numéricos son propuestas razonadas, ya que no se dispone de datos de uso. Se ajustarán cuando la organización los facilite.

= 5. Otros requisitos

#table(columns: (0.55fr, 1.45fr),
  [Prioridad], [Contenido],
  [*Conveniente*], [Filtros por marca y área formativa; comprobación periódica de enlaces; página de ayuda; vista para atención al usuario; enlace estable para cada aula.],
  [*Futuro, si se justifica*], [Vista personalizada «mis aulas»; acceso único a todas las aulas; información de cursos procedente de Moodle; estadísticas de uso.],
  [*Excluido*], [Modificar o unificar las aulas; gestionar contraseñas, matrículas o contenidos; resolver la versión de Moodle de las aulas.],
)

#pagebreak(weak: true)
= 6. Comprobación

Cada requisito se relaciona con la necesidad de la que procede y con la prueba que lo comprobará. Por ejemplo, la necesidad «saber qué aula le corresponde» da lugar al requisito del buscador, que se comprueba con una prueba con usuarios: tienen que encontrar su aula sin ayuda. Todas las necesidades de la Fase 1 quedan cubiertas, y los requisitos imprescindibles y convenientes tienen al menos una prueba. Las pruebas se realizarán en la Fase 7: funcionales, con usuarios, de accesibilidad, en distintos dispositivos, de seguridad y de mantenimiento.

= 7. Supuestos principales

- El problema principal es encontrar el aula, no gestionar contenidos.
- No existe una cuenta común para todas las aulas.
- El catálogo puede ser público, porque solo muestra lo que ya es público en cada aula.
- Una persona de la organización se encargará de mantener el catálogo.
- La primera versión no se conecta con Moodle.

= 8. Cuestiones para la revisión

#nota[][
+ ¿Se considera adecuado continuar con supuestos explícitos mientras no haya respuesta de la organización?
+ ¿Se validan los requisitos imprescindibles como contenido de la primera versión?
+ ¿Se consideran razonables los valores de referencia propuestos?
]

= 9. Documentación de soporte

La documentación completa está en el repositorio del proyecto: #link("https://github.com/Mingalonga/Plataforma-Moodle/tree/main/Fase-2")[#text(fill: azul)[github.com/Mingalonga/Plataforma-Moodle/tree/main/Fase-2]]

#table(columns: (0.7fr, 1.3fr),
  [Documento], [Contenido],
  [00 Plan de la fase], [Método, tareas y criterios de finalización],
  [01 Supuestos de partida], [Supuestos y efecto de cada uno],
  [02 Usuarios y escenarios], [Perfiles y situaciones de uso],
  [03 Requisitos funcionales], [Qué debe hacer la plataforma, con criterios de aceptación],
  [04 Requisitos no funcionales], [Accesibilidad, seguridad, rendimiento y mantenimiento],
  [05 Trazabilidad], [Relación entre necesidades, requisitos y pruebas],
  [06 Especificación], [Entregable 02],
)

= Glosario

#table(columns: (0.55fr, 1.45fr),
  [Término], [Significado],
  [Escenario de uso], [Situación concreta en la que una persona utiliza la plataforma para conseguir algo.],
  [Requisito funcional], [Algo que la plataforma debe hacer (por ejemplo, buscar un aula).],
  [Requisito no funcional], [Cómo debe hacerlo: accesible, seguro, rápido, fácil de mantener.],
  [Criterio de aceptación], [Condición comprobable que indica si un requisito se cumple.],
  [Trazabilidad], [Relación que permite seguir cada requisito desde la necesidad que lo origina hasta la prueba que lo comprueba.],
  [Supuesto], [Hipótesis de trabajo que se da por buena mientras no se confirme.],
  [MoSCoW], [Método de priorización: imprescindible, conveniente, futuro y excluido.],
  [WCAG 2.2], [Pautas internacionales de accesibilidad web.],
  [Lector de pantalla], [Programa que lee en voz alta el contenido de la pantalla a personas ciegas o con baja visión.],
)
