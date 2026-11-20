// Resumen de la Fase 2 para la tutora · fuente Typst
// Compilar: python3 -c "import typst; typst.compile('resumen-fase-2-tutora.typ', output='Resumen_Fase-2_Plataforma-Moodle_v2.pdf')"  (o: typst compile ...)

#let azul = rgb("#1f3a5f")
#let gris = rgb("#5b6470")
#let linea = rgb("#c9ced6")
#let version = "v2"

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
    text(fill: gris)[Fecha], [4 de noviembre de 2026],
    text(fill: gris)[Versión], [Resumen #version (documentación de la fase en versión 0.2). Sustituye al v1 del 3 de noviembre],
    text(fill: gris)[Estado], [Pendiente de revisión],
  )
  #v(1.5cm)
]

// ---------- Contenido ----------
= 1. Cambio de enfoque

Siguiendo sus indicaciones, el proyecto se orienta a la *gestión interna* de las aulas. La plataforma será una herramienta para que el *Departamento de Pedagogía y e-learning* gestione las doce aulas desde un único punto, sin tener que entrar y salir de cada una. El alumnado no la usará, porque ya entra en su curso con la URL que se le facilita. *Informática* se encargaría de la implementación y de la parte técnica, y antes de nada se estudiará si es viable.

#nota[Qué ha cambiado.][La versión anterior de este resumen (v1) describía un catálogo de aulas para el alumnado. Ese enfoque se ha sustituido; se conserva en el histórico del repositorio. El análisis de las aulas de la Fase 1 sigue siendo válido: doce direcciones, sin acceso común, cinco aulas con el mismo título y una versión de Moodle probablemente sin soporte. Ahora se mira desde el punto de vista de quien las gestiona.]

= 2. Resumen

La Fase 2 describe con precisión qué debe hacer la plataforma, cómo debe comportarse y cómo se comprobará que lo cumple. No decide todavía la solución técnica, que se elegirá en la Fase 3 comparando alternativas.

#nota[Resultado de la fase][
- 13 escenarios de uso del personal de gestión, de Informática y, para consultas, del servicio de atención al usuario.
- 18 requisitos de funcionamiento: 10 imprescindibles, 4 convenientes y 4 para el futuro, además de 6 exclusiones expresas.
- 34 requisitos de calidad sobre accesibilidad, seguridad, rendimiento y mantenimiento.
- 36 pruebas definidas, cada una relacionada con la necesidad y el requisito que comprueba.
]

= 3. Qué haría la plataforma

Los requisitos se agrupan en tres bloques según cuánto dependen de que sea viable conectar la plataforma con Moodle:

#table(columns: (0.55fr, 1.1fr, 0.75fr),
  [Bloque], [Contenido], [Prioridad],
  [*Base*], [Acceso solo para el personal autorizado, con permisos según el rol. Lista de las doce aulas con un nombre propio que las distinga, su estado y sus responsables. *Accesos directos a la gestión de cada aula* (cursos, usuarios, matriculaciones, informes), indicando siempre en qué aula se entra. Búsqueda y mantenimiento de la lista por el departamento.], [Imprescindible. Siempre viable: no necesita tocar las aulas],
  [*Consulta*], [Ver datos de varias aulas a la vez sin entrar en ellas (cursos activos, número de matrículas), buscar un curso en todas las aulas y conocer el estado técnico de cada una.], [Conveniente, si es viable],
  [*Acciones*], [Crear cursos o matricular desde la plataforma, entrar una sola vez en todas las aulas, buscar a una persona en todas ellas.], [Futuro, si se justifica],
)

#nota[Exclusiones.][No habrá portal para el alumnado. No se modificarán las aulas reales ni se guardarán contraseñas. La plataforma no sustituye a Moodle: la gestión completa se sigue haciendo en cada aula. Cualquier prueba de conexión con Moodle se hará en un aula de pruebas, nunca en las reales.]

#pagebreak(weak: true)
= 4. Requisitos de calidad imprescindibles

#table(columns: (0.55fr, 1.45fr),
  [Calidad], [Requisito y valor de referencia],
  [Eficiencia], [En las pruebas, el 90 % de las tareas llega a la página de gestión correcta en 3 acciones y 20 segundos o menos, y más rápido que hoy. Siempre queda claro en qué aula se está actuando.],
  [Accesibilidad], [Pautas WCAG 2.2 nivel AA; uso completo con teclado y lector de pantalla; uso en ordenador y tableta y consulta desde el móvil.],
  [Seguridad], [Identificación con doble factor; permisos mínimos por rol; ninguna contraseña de las aulas guardada; claves de conexión, si las hay, custodiadas por Informática; plataforma no accesible al público; registro de entradas y cambios.],
  [Privacidad], [Ningún dato personal del alumnado guardado; en la consulta, solo cifras agregadas.],
  [Continuidad], [Si la plataforma falla, las aulas se siguen gestionando como hoy; recuperación en un día laborable.],
  [Mantenimiento], [El departamento da de alta un aula en 15 minutos o menos con la guía; reparto escrito de tareas entre el departamento e Informática; copias de seguridad.],
)

Los valores numéricos son propuestas razonadas, ya que no se dispone de datos. Se ajustarán con la información del departamento y de Informática.

= 5. Comprobación

Cada requisito se relaciona con la necesidad de la que procede y con la prueba que lo comprobará. Por ejemplo, la necesidad «gestionar cualquier aula desde un único punto» da lugar a los accesos directos, que se comprueban con una prueba con tareas: personal del departamento, o personas con un perfil parecido, llega a una tarea de gestión con la plataforma y por el camino actual, y se comparan el tiempo y los pasos. Todas las necesidades del nuevo enfoque quedan cubiertas, y los requisitos imprescindibles y convenientes tienen al menos una prueba.

= 6. Supuestos principales

- Cada persona del departamento tiene una cuenta distinta en cada aula y debe entrar en cada una por separado.
- Informática podría activar en las aulas la conexión de solo lectura que ofrece Moodle (servicios web). Si no fuera posible, la plataforma se quedaría en el bloque base.
- Basta con cifras agregadas; no hace falta guardar datos del alumnado.
- El proyecto termina con el estudio de viabilidad, un prototipo y una recomendación; la implantación real correspondería a Informática.

= 7. Cuestiones para la revisión

#nota[][
+ ¿Es correcta esta interpretación del enfoque?
+ ¿Se validan los requisitos imprescindibles (bloque base) y que la consulta y las acciones dependan de la viabilidad?
+ Cuando indicó «y ya estaría, por así decirlo, lo del tema de entorno de pruebas», ¿se refería a que el alumnado no necesita nada más, o a que el proyecto puede contar con un aula de pruebas?
+ ¿Sería posible una conversación breve con alguien del departamento y de Informática? Las preguntas, reducidas a nueve, están preparadas.
]

= 8. Documentación de soporte

La documentación completa está en el repositorio del proyecto: #link("https://github.com/Mingalonga/Plataforma-Moodle/tree/main/Fase-2")[#text(fill: azul)[github.com/Mingalonga/Plataforma-Moodle/tree/main/Fase-2]]

#table(columns: (0.7fr, 1.3fr),
  [Documento], [Contenido],
  [00 Plan de la fase], [Método, tareas y criterios de finalización],
  [01 Supuestos de partida], [Lo indicado por la tutora y los supuestos, con su efecto],
  [02 Usuarios y escenarios], [Perfiles y situaciones de uso],
  [03 Requisitos funcionales], [Qué debe hacer la plataforma, con criterios de aceptación],
  [04 Requisitos no funcionales], [Accesibilidad, seguridad, rendimiento y mantenimiento],
  [05 Trazabilidad], [Relación entre necesidades, requisitos y pruebas],
  [06 Especificación], [Entregable 02],
)

= Glosario

#table(columns: (0.55fr, 1.45fr),
  [Término], [Significado],
  [Acceso directo], [Enlace que lleva a una página concreta de gestión de un aula, por ejemplo, a su gestión de cursos.],
  [Escenario de uso], [Situación concreta en la que una persona utiliza la plataforma para conseguir algo.],
  [Requisito funcional], [Algo que la plataforma debe hacer.],
  [Requisito no funcional], [Cómo debe hacerlo: accesible, seguro, rápido, fácil de mantener.],
  [Criterio de aceptación], [Condición comprobable que indica si un requisito se cumple.],
  [Trazabilidad], [Relación que permite seguir cada requisito desde la necesidad que lo origina hasta la prueba que lo comprueba.],
  [Servicios web de Moodle], [Conexión que ofrece Moodle para que otro programa consulte o cambie datos del aula sin entrar en ella.],
  [Aula de pruebas], [Copia de Moodle sin datos reales, donde se puede probar sin riesgo.],
  [Doble factor], [Identificación que, además de la contraseña, pide una segunda comprobación, como un código en el móvil.],
  [MoSCoW], [Método de priorización: imprescindible, conveniente, futuro y excluido.],
  [WCAG 2.2], [Pautas internacionales de accesibilidad web.],
)
