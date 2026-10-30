// Resumen de la Fase 1 para la tutora · fuente Typst
// Compilar: python3 -m typst compile resumen-fase-1-tutora.typ  (o: typst compile ...)

#let azul = rgb("#1f3a5f")
#let gris = rgb("#5b6470")
#let linea = rgb("#c9ced6")
#let version = "v5"

#set document(title: "Resumen de la Fase 1 — Plataforma centralizada Moodle", author: "Carlos García Rallo")
#set page(
  paper: "a4",
  margin: (x: 2.3cm, top: 2.4cm, bottom: 2.2cm),
  footer: context {
    if counter(page).get().first() > 1 [
      #set text(8pt, fill: gris)
      Plataforma centralizada Moodle · Resumen de la Fase 1 (#version)
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
  #text(24pt, weight: "bold", fill: azul)[Plataforma centralizada para \ los entornos Moodle]
  #v(0.5cm)
  #text(13pt, fill: gris)[Fase 1 — Descubrimiento \ Resumen para la revisión del hito «Alcance preliminar validado»]
  #v(1fr)
  #line(length: 100%, stroke: 0.6pt + linea)
  #v(0.2cm)
  #grid(columns: (3.2cm, 1fr), row-gutter: 0.55em,
    text(fill: gris)[Alumno], [Carlos García Rallo],
    text(fill: gris)[Tutora], [],
    text(fill: gris)[Fecha], [30 de octubre de 2026],
    text(fill: gris)[Versión], [Resumen #version (documentación de la fase en versión 0.7)],
    text(fill: gris)[Estado], [Pendiente de revisión],
  )
  #v(1.5cm)
]

// ---------- Contenido ----------
= 1. Resumen

Grupo ATU dispone de al menos doce aulas virtuales Moodle, cada una con su propia dirección web y su propio acceso. El proyecto estudia la viabilidad de un punto de acceso común desde el que cada usuario localice su aula y llegue a ella con seguridad.

#nota[Conclusiones de la fase][
- Las doce aulas comparten servicio de atención al usuario y responsable de datos, lo que indica un mismo operador.
- No existe ningún punto que las reúna: ni las aulas ni la web corporativa enlazan a las demás, y no aparecen en buscadores.
- Cinco aulas de marcas distintas se presentan con el mismo nombre, lo que facilita la confusión.
- Falta un dato clave: cuántos usuarios tienen realmente dificultades para encontrar su aula.
- Se propone como primera versión un catálogo con buscador y acceso directo a cada aula, sin tratar datos personales.
]

= 2. Metodología

Análisis de información pública, sin acceso a las aulas, sin credenciales y sin datos personales. No se ha contactado todavía con la organización, por lo que perfiles y necesidades son hipótesis pendientes de confirmar. Cada afirmación de la documentación indica si está comprobada o es un supuesto, y se conservan todas las versiones.

#table(columns: (auto, 1fr, 0.75fr),
  [], [Paso], [Resultado],
  [1], [Estudio de la ficha y del encargo], [Plan de fase y registro de preguntas],
  [2], [Observación de la página de entrada de las doce aulas], [Inventario y capturas],
  [3], [Revisión de la web corporativa de Grupo ATU], [Sin enlaces a las aulas],
  [4], [Análisis de actores, necesidades, problemas y riesgos], [Mapa de actores y registro de riesgos],
  [5], [Propuesta de alcance], [Diagnóstico inicial (entregable 01)],
)

= 3. Inventario de aulas

#table(columns: (auto, 0.9fr, 1.3fr),
  [N.º], [Aula (marca)], [Observaciones],
  [1], [Campus Virtual – ATU], [Diseño distinto y siete idiomas; posible aula principal.],
  [2], [Centre Learning], [Su nombre lo repiten otras cuatro aulas.],
  [3], [ATU Asesoría de Formación], [—],
  [4], [ATU Index Business Intelligent], [En inglés, sin datos de ayuda, registro abierto y textos de plantilla sin completar.],
  [5], [Takin], [—],
  [6], [Club Aventura ATU], [—],
  [7], [ATU Tecnología Digital], [Incluye un bloque comercial con poco contraste.],
  [8], [Grupo Almería Formación], [Se presenta como «Centre Learning».],
  [9], [ATU Seguridad y Salud], [—],
  [10], [Tierra Más Ecológica (sociedad cooperativa)], [Se presenta como «Centre Learning».],
  [11], [MoveOut], [Se presenta como «Centre Learning».],
  [12], [Estudi\@ Formación Profesional], [Se presenta como «Centre Learning».],
)

Todas usan Moodle, acceso con usuario y contraseña propios de cada aula y el mismo servicio de atención al usuario. Ninguna permite entrar con una cuenta común.

#nota[Indicio técnico.][Los datos de las páginas sugieren que las aulas usan una versión de Moodle sin actualizaciones de seguridad desde diciembre de 2025. Debe confirmarlo la administración de las aulas; no se han realizado pruebas de seguridad.]

= 4. Actores y necesidades

#table(columns: (0.8fr, 1.2fr),
  [Actor], [Necesidad principal],
  [Alumnado], [Encontrar su aula y tener la certeza de que es la correcta.],
  [Profesorado y tutores], [Un enlace único y fiable para el alumnado.],
  [Empresas clientes], [Saber a qué aula dirigir a sus trabajadores.],
  [Atención al usuario], [Una relación actualizada de aulas.],
  [Administración de las aulas], [No tener que modificar las aulas existentes.],
  [Gestión del catálogo (nueva función)], [Un procedimiento sencillo de altas, cambios y bajas.],
  [Dirección], [Datos para decidir sobre la inversión.],
)

= 5. Problemas detectados

+ No hay un punto de entrada común; la web corporativa se orienta a captar alumnado nuevo.
+ Las aulas no aparecen en buscadores (puede ser intencionado).
+ Varias aulas no se distinguen por su nombre.
+ La configuración no es homogénea entre aulas; algunas páginas de acceso mezclan inglés y español.
+ Cada aula exige usuario y contraseña propios.
+ La web organiza la oferta en nueve áreas temáticas y las aulas por marcas, sin correspondencia entre ambas.

#nota[Limitación.][No se dispone de datos que permitan medir cuántos usuarios se ven afectados, por ejemplo consultas al servicio de atención por no encontrar el aula.]

= 6. Riesgos principales

- Apoyar el proyecto en supuestos por falta de datos de la organización.
- Desactualización del catálogo si no hay una persona responsable.
- Ampliar el alcance (por ejemplo, acceso único a todas las aulas) sin necesidad demostrada.
- Tratamiento innecesario de datos personales.
- Accesibilidad insuficiente para parte del alumnado.

= 7. Alcance preliminar propuesto

#table(columns: (0.55fr, 1.45fr),
  [Prioridad], [Contenido],
  [*Imprescindible*], [Catálogo de aulas con nombre y descripción; buscador; acceso directo a cada aula indicando el cambio de sitio; diseño accesible y adaptado a móvil; procedimiento de mantenimiento; sin datos personales ni contraseñas.],
  [*Conveniente*], [Filtros (por ejemplo, por área formativa); comprobación periódica de enlaces; página de ayuda.],
  [*Futuro, si se justifica*], [Vista personalizada «mis aulas»; acceso único a todas las aulas; información de cursos.],
  [*Fuera de alcance*], [Modificar o unificar las aulas existentes; gestionar matrículas o contenidos.],
)

La solución técnica se decidirá en la Fase 3 comparando alternativas, incluida la de no desarrollar.

= 8. Cuestiones para la revisión

#nota[][
+ ¿Se valida el problema y el objetivo, con la limitación indicada sobre la falta de datos?
+ ¿Se valida la primera versión propuesta y dejar el acceso único como evolución futura?
+ ¿Es posible obtener la información de la organización indicada en el apartado 10?
]

*Preguntas prioritarias para la organización:* responsables de cada aula y de la decisión; relación entre Grupo ATU y las marcas; cómo acceden hoy los usuarios y si hay incidencias por no encontrar el aula; usuarios con cuenta en varias aulas; quién mantendría el catálogo; finalidad del aula 4.

= 9. Documentación de soporte

La documentación completa, con versiones, cambios y evidencias, está en el repositorio del proyecto: #link("https://github.com/Mingalonga/Plataforma-Moodle/tree/main/Fase-1")[#text(fill: azul)[github.com/Mingalonga/Plataforma-Moodle/tree/main/Fase-1]]

#table(columns: (0.7fr, 1.3fr),
  [Documento], [Contenido],
  [00 Plan de la fase], [Tareas y criterios de finalización],
  [01 Registro de preguntas], [Preguntas de la ficha con respuesta provisional, preguntas pendientes y supuestos],
  [02 Fuentes y método], [Procedimiento de observación y fuentes consultadas],
  [03 Inventario], [Ficha de cada aula],
  [04 Actores y perfiles], [Personas implicadas y sus necesidades],
  [05 Situación actual], [Necesidades, problemas y guion de entrevista],
  [06 Riesgos], [Registro inicial de riesgos],
  [07 Alcance preliminar], [Propuesta de alcance],
  [08 Diagnóstico inicial], [Entregable 01],
  [Seguimiento, cambios, histórico y evidencias], [Revisiones, versiones anteriores y capturas],
)

= 10. Antes de iniciar la Fase 2

Si se valida la Fase 1, la Fase 2 (requisitos) ganaría solidez con la siguiente información de la organización. No es imprescindible: sin ella se continuará trabajando con supuestos, indicados como tales.

#table(columns: (0.55fr, 1.45fr),
  [Qué se necesita], [Detalle],
  [Contacto con la organización], [Una conversación breve (20–30 minutos) con alguna de estas personas: responsable del servicio de atención al usuario (CAU), responsable técnico de las aulas Moodle y persona que impulsa o aprobaría el proyecto.],
  [Datos del servicio de atención], [Cifras aproximadas y sin datos personales: consultas mensuales del tipo «no sé cuál es mi aula» o «no encuentro la dirección», consultas más frecuentes y existencia de alumnado con cursos en varias aulas.],
  [Finalidad], [Confirmar y medir el problema principal, que hoy se basa en observación externa, y fijar objetivos verificables para los requisitos.],
)

Las preguntas para cada entrevista ya están preparadas (documento 05 del repositorio).

= Glosario

#table(columns: (0.55fr, 1.45fr),
  [Término], [Significado],
  [Moodle], [Plataforma de código abierto para aulas virtuales.],
  [Aula virtual], [Cada una de las instalaciones Moodle donde se imparten los cursos.],
  [Marca], [Nombre comercial y logotipo con que se presenta cada aula (por ejemplo, Takin o MoveOut), aunque todas las gestione Grupo ATU.],
  [Catálogo], [Relación organizada de aulas con su descripción y enlace.],
  [Acceso único (SSO)], [Identificarse una vez para acceder a varias aulas.],
  [Primera versión (MVP)], [Versión mínima que permite comprobar si la propuesta funciona.],
  [MoSCoW], [Método de priorización: imprescindible, conveniente, futuro y fuera de alcance.],
  [WCAG 2.2], [Pautas internacionales de accesibilidad web.],
  [Repositorio], [Espacio en GitHub donde se guarda el proyecto con su historial de versiones.],
)
