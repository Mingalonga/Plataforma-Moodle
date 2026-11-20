// Guía de la Fase 2 para el alumno · fuente Typst
// Compilar: python3 -c "import typst; typst.compile('guia-fase-2-alumno.typ', output='Guia-alumno_Fase-2_Plataforma-Moodle_v1.pdf')"  (o: typst compile ...)

#let azul = rgb("#1f3a5f")
#let gris = rgb("#5b6470")
#let linea = rgb("#c9ced6")
#let version = "v1"

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
  #text(13pt, fill: gris)[Qué se ha hecho, por qué y cómo defenderlo]
  #v(1fr)
  #line(length: 100%, stroke: 0.6pt + linea)
  #v(0.2cm)
  #grid(columns: (3.2cm, 1fr), row-gutter: 0.55em,
    text(fill: gris)[Para], [Carlos García Rallo (uso interno, no es para entregar)],
    text(fill: gris)[Fecha], [3 de noviembre de 2026],
    text(fill: gris)[Basada en], [Documentación de la Fase 2, versión 0.1],
  )
  #v(1.5cm)
]

#outline(title: [Contenido], depth: 1)

#pagebreak()

= 1. Qué es la Fase 2 y por qué importa

En la Fase 1 averiguamos *qué pasa*: hay doce aulas Moodle dispersas, nadie las reúne y la gente puede perderse. En la Fase 2 decidimos *qué tiene que hacer la plataforma* para resolverlo, con tanta precisión que luego se pueda comprobar si lo hace o no. Todavía no elegimos *cómo* construirla (eso es la Fase 3).

Según la ficha:

#table(columns: (0.5fr, 1.5fr),
  [Concepto], [Lo que dice la ficha],
  [Trabajo principal], [Definir usuarios, escenarios de uso, requisitos funcionales y no funcionales, prioridades y criterios de aceptación.],
  [Evidencia], [Documento de requisitos trazable.],
  [Hito], [Requisitos aprobados (por la tutora).],
  [Entregable], [02 — Especificación: requisitos priorizados, escenarios de uso, criterios de aceptación y trazabilidad.],
  [Peso en la nota], [El criterio «Requisitos y trazabilidad» vale un 15 %. Valora claridad, que se puedan verificar, la priorización y la conexión entre necesidades, requisitos y pruebas.],
)

Además, la ficha dice que el prototipo (Fase 6) debe cubrir los requisitos imprescindibles, y que el resto debe quedar «planificado, justificado o descartado de manera expresa». Por eso cada requisito tiene una prioridad y los descartes están escritos.

#caja[Lo más importante que debes saber.][La organización no ha contestado y la tutora no ha validado la Fase 1. Por eso todo se apoya en *supuestos escritos*. Esto no es un fallo si se dice claramente: la ficha valora que «la propuesta reconoce sus límites» y penaliza «no distinguir los supuestos de los hechos». Nuestra defensa es que cada supuesto está identificado y sabemos qué requisitos cambiarían si fallara.]

= 2. Dónde está cada cosa

Todo está en la carpeta `Fase-2/` del repositorio. Orden recomendado de lectura:

#table(columns: (0.7fr, 1.3fr, 0.6fr),
  [Documento], [Qué contiene], [Léelo si…],
  [06 Especificación], [El resumen de todo: el entregable 02], [Solo tienes 10 minutos],
  [01 Supuestos], [Los 14 supuestos y su efecto], [Te preguntan «¿y esto de dónde sale?»],
  [02 Escenarios], [13 situaciones de uso contadas como historias], [Quieres entender para quién es cada requisito],
  [03 Funcionales], [18 requisitos con sus criterios de aceptación], [Quieres el detalle de qué hace la plataforma],
  [04 No funcionales], [30 requisitos de calidad con valores], [Te preguntan por accesibilidad, seguridad o rendimiento],
  [05 Trazabilidad], [Tablas que conectan todo y los 33 casos de prueba], [Te preguntan cómo se comprobará algo],
  [00 Plan], [Método, tareas y criterios de salida], [Te preguntan cómo has trabajado],
)

También están el `registro-seguimiento.md` (con la respuesta de la tutora y la decisión de seguir), el `CHANGELOG.md` y la carpeta `entregas/` con el PDF para la tutora y esta guía.

= 3. Conceptos clave

== Requisito funcional y no funcional

- *Funcional:* algo que la plataforma *hace*. Ejemplo: «buscar un aula escribiendo parte de su nombre».
- *No funcional:* *cómo* lo hace o qué cualidades tiene. Ejemplo: «la página carga en 2,5 segundos o menos en un móvil» o «se puede usar solo con el teclado».

Regla útil: si puedes describirlo como una acción del usuario, es funcional; si es un adjetivo (rápido, seguro, accesible, mantenible), es no funcional.

== Prioridad MoSCoW

#table(columns: (0.45fr, 1.55fr),
  [Letra], [Significado en este proyecto],
  [M (Must)], [Imprescindible. Sin esto la plataforma no resuelve el problema. Entra en el prototipo.],
  [S (Should)], [Conveniente. Aporta mucho pero se puede vivir sin ello al principio. Queda planificado.],
  [C (Could)], [Futuro. Solo si se cumplen condiciones que hoy no sabemos (por ejemplo, que exista una cuenta común).],
  [W (Won't)], [Descartado en este proyecto, con el motivo escrito.],
)

Usamos MoSCoW porque ya lo usamos en la Fase 1 y la ficha pide «un método que puedas explicar». Es el más fácil de explicar.

== Criterio de aceptación

Es la condición que permite decir *sí o no* a «¿se cumple este requisito?», sin opiniones. Para los funcionales usamos el formato *Dado / Cuando / Entonces*:

#caja[Ejemplo (RF-03, buscador).][*Dado* el aula «Tierra Más Ecológica», *cuando* alguien busca «ECOLÓGICA» o «ecologica», *entonces* aparece en los resultados. Si no aparece, el requisito no se cumple. No hay discusión posible.]

Para los no funcionales, el criterio es un *valor medible* y un *método*: «2,5 segundos o menos, medido con una herramienta de rendimiento en modo móvil».

== Trazabilidad

Es poder seguir el hilo de cada requisito *hacia atrás* (¿qué necesidad lo justifica?) y *hacia delante* (¿qué prueba lo comprobará?). Ejemplo completo:

#caja[Un hilo de principio a fin.][
*Problema PR-03* (cinco aulas se llaman igual) → *necesidad N-03* (distinguir un aula de otra) → *escenario ES-03* (Marta entra en un aula y duda si es la suya) → *requisito RF-02* (cada aula muestra marca, nombre propio, logotipo y dominio, y no hay dos nombres iguales) → *caso de prueba CP-F-02* (revisar el catálogo real y comprobar que no hay nombres repetidos y que el dominio coincide).
]

La ficha valora esto expresamente: «las decisiones pueden rastrearse hasta requisitos, evidencias o restricciones concretas».

== Identificadores

Cada cosa tiene un código para poder citarla: SF (supuesto), ES (escenario), RF (requisito funcional), RNF-UX/SEG/REN/MAN (no funcional por grupo: usabilidad, seguridad, rendimiento, mantenimiento), W (descartado), CP (caso de prueba). De la Fase 1 se reutilizan N (necesidad), PR (problema), PU (perfil de usuario), AL (alcance), RS (riesgo) y P (pregunta).

= 4. Los 14 supuestos, uno a uno

Un supuesto es algo que damos por bueno *para poder avanzar*, sabiendo que puede ser falso. Para cada uno: qué suponemos, por qué es razonable y qué pasaría si fuera falso.

#table(columns: (auto, 0.9fr, 0.8fr, 0.9fr),
  [ID], [Qué suponemos], [Por qué], [Si es falso…],
  [SF-01], [El problema es encontrar el aula, no gestionar cursos], [Es lo que plantea la ficha y lo que observamos], [Habría que añadir funciones (ver cursos, avisos) y revisar prioridades],
  [SF-02], [No hay una cuenta común para todas las aulas], [Ninguna aula ofrece entrar con Google, Microsoft u otra cuenta común], [Se podría ofrecer «mis aulas» antes],
  [SF-03], [El catálogo puede ser público], [Solo enseña lo que ya es público: nombre y página de entrada], [Habría que poner un acceso con usuario y la plataforma trataría datos personales],
  [SF-04], [Todas las marcas pueden salir juntas], [Todas son de Grupo ATU (lo confirmaste tú)], [Habría que separar el catálogo por marcas],
  [SF-05], [Alguien de la empresa mantendrá el catálogo], [Sin eso nada funciona a largo plazo], [Ninguna solución sería sostenible; saldría en la conclusión de viabilidad],
  [SF-06], [Las aulas cambian pocas veces al año], [Las doce parecen estables], [La gestión debería ser más ágil y la comprobación de enlaces más frecuente],
  [SF-07], [El idioma principal es el español], [Público hispanohablante; solo el aula 4 está en inglés], [Habría que hacer la plataforma en varios idiomas],
  [SF-08], [Mucha gente entra desde el móvil], [Formación online y para el empleo], [No cambia la prioridad (la ficha lo exige), pero sí el peso de las pruebas],
  [SF-09], [Poca carga: cientos de visitas al día], [Doce aulas de un grupo de formación], [Habría que revisar el alojamiento en la Fase 3],
  [SF-10], [La primera versión no se conecta con Moodle], [Indicio de Moodle sin soporte; menos riesgo], [Se podría valorar traer datos de cursos],
  [SF-11], [Se busca por marca y, si encaja, por área formativa], [Las aulas tienen marca; la web usa 9 áreas], [El filtro sería solo por marca],
  [SF-12], [Se puede mostrar el contacto común del servicio de atención (CAU)], [Ya está publicado en las aulas], [Se pondría el canal que diga la empresa],
  [SF-13], [La referencia de accesibilidad es WCAG 2.2 AA], [Lo pide el prompt inicial; es el estándar habitual], [Se ajustaría a la norma que aplique],
  [SF-14], [Sin cookies de seguimiento ni analítica], [Menos datos personales, sin banner de consentimiento], [La analítica tendría que seguir la política de la empresa],
)

#caja[Cómo defenderlo.][«No he inventado datos: he escrito qué supongo, por qué, y qué requisitos revisaría si me equivoco. La matriz de trazabilidad (sección 5 del documento 05) lo dice supuesto por supuesto.»]

= 5. Los 13 escenarios

Un escenario es una pequeña historia: una persona concreta, en una situación concreta, quiere conseguir algo. Sirven para que los requisitos no salgan de la nada. Los nombres (Lucía, Antonio…) son inventados y no corresponden a personas reales.

#table(columns: (auto, 0.9fr, 1.1fr),
  [ID], [Escenario], [Por qué está],
  [ES-01], [Encontrar el aula sabiendo la marca], [Es el caso más común y el núcleo del problema],
  [ES-02], [Encontrarla sin saber la marca], [La web organiza por áreas y las aulas por marcas (PR-08)],
  [ES-03], [Distinguir aulas con el mismo nombre], [Cinco aulas se llaman «Centre Learning» (PR-03)],
  [ES-04], [Entrar desde el móvil], [Lo pide la ficha («adaptable a dispositivos»)],
  [ES-05], [Alumno con cursos en varias aulas], [Muestra el límite: sin cuenta común no hay «mis aulas»],
  [ES-06], [Profesor que comparte un enlace], [Justifica tener un enlace fijo por aula (RF-14)],
  [ES-07], [Empresa cliente que informa a su plantilla], [Grupo ATU trabaja con empresas],
  [ES-08], [El CAU atiende «no sé cuál es mi aula»], [El CAU es común a todas las aulas],
  [ES-09], [Dar de alta un aula nueva], [La ficha pide estudiar cómo se incorporan cambios],
  [ES-10], [Cambiar, poner en mantenimiento o retirar un aula], [Lo mismo, y no perder el historial],
  [ES-11], [Detectar un enlace roto], [El mayor riesgo es que el catálogo se quede viejo (RS-01)],
  [ES-12], [Usar la plataforma con lector de pantalla], [Lo pide la ficha («necesidades de acceso»)],
  [ES-13], [La plataforma se cae], [Lo pide la ficha («continuidad»): si se cae, las aulas deben seguir funcionando],
)

Hay tres escenarios *descartados* a propósito: entrar una vez en todas las aulas, ver cursos o notas desde la plataforma, y recuperar contraseñas. Están escritos para que se vea que se pensaron y por qué se dejan fuera.

= 6. Los requisitos funcionales, uno a uno

== Imprescindibles (entran en el prototipo)

#table(columns: (auto, 0.9fr, 1.1fr),
  [ID], [Qué hace], [Por qué y cómo se comprueba],
  [RF-01], [Muestra la lista de aulas sin pedir usuario], [No existe ningún sitio que las reúna (PR-01). Se comprueba que salen todas las visibles y ninguna oculta.],
  [RF-02], [Identifica cada aula: marca, nombre propio, logotipo, dominio e idioma si no es español], [Cinco aulas se llaman igual y una está en inglés. Se comprueba que no hay nombres repetidos.],
  [RF-03], [Buscador por parte del nombre, palabras clave o dominio, sin importar mayúsculas ni tildes], [La gente recuerda trozos («centre», «ecológica»). Se prueba con búsquedas concretas.],
  [RF-04], [Lleva a la página de entrada del aula avisando de que se sale y a qué dominio], [Que nadie crea que ya ha iniciado sesión (RS-05). Nunca pide contraseñas.],
  [RF-05], [Si no hay resultados, dice qué hacer y da el contacto del CAU], [Que nadie se quede sin salida (ES-02).],
  [RF-06], [Alta y modificación de aulas sin programar, con campos obligatorios y solo dominios autorizados], [El catálogo tiene que poder mantenerse. Lo de los dominios evita que alguien cuele un enlace falso (RS-02).],
  [RF-07], [Ocultar o retirar un aula sin borrarla], [Aulas que cierran, o marcas que no deban salir con otras. Se puede deshacer.],
  [RF-08], [Registro de cada cambio: quién, cuándo y qué], [Detectar errores o manipulaciones y poder volver atrás.],
  [RF-09], [Avisa de las aulas que llevan más de 90 días sin revisar], [Evitar que el catálogo se quede viejo sin que nadie lo note.],
)

== Convenientes (planificados)

- *RF-10 Filtros* por marca y, si se confirma su relación con las aulas, por área formativa.
- *RF-11 Comprobación automática de enlaces*: como mucho una vez al día por aula, solo cargando la página pública. No es intrusivo, que es un límite de la ficha. En las pruebas se usará una dirección nuestra, nunca un aula real.
- *RF-12 Página de ayuda* con preguntas frecuentes y el contacto del CAU.
- *RF-13 Vista para el CAU* con el estado de cada aula y a quién escalar. Si esos contactos son internos, esta vista no puede ser pública.
- *RF-14 Enlace fijo por aula*, que sigue funcionando aunque el aula cambie de dirección.

== Futuros (solo si se cumplen condiciones)

«Mis aulas» (RF-15), acceso único a todas (RF-16), datos de cursos desde Moodle (RF-17) y estadísticas de uso (RF-18). No tienen criterios de aceptación porque no se van a construir ahora; cada uno dice qué condición tendría que cumplirse.

== Descartados

W-01 tocar las aulas · W-02 unificarlas en un solo Moodle · W-03 tratar contraseñas · W-04 matrículas o contenidos · W-05 arreglar la versión de Moodle (se avisa a la empresa, pero no es nuestro trabajo).

= 7. Los requisitos no funcionales

La ficha pide cuatro grupos, cada uno con su forma de comprobarlo. Aquí van los valores importantes y *de dónde sale cada número*, porque es lo primero que te pueden preguntar.

== Usabilidad y accesibilidad (8 requisitos)

- *WCAG 2.2 AA:* el estándar internacional de accesibilidad web. AA es el nivel que se suele exigir. No decimos que se cumpla hasta probarlo.
- *Desde 320 píxeles de ancho y con zoom al 200 %:* 320 px es el ancho de los móviles más pequeños, y el 200 % lo pide la propia WCAG. Se comprueba con una matriz de dispositivos.
- *80 % encuentra su aula sin ayuda en menos de 1 minuto:* es una propuesta nuestra [R]. Encontrar un enlace en una lista con buscador debería costar segundos; el margen hasta 1 minuto y el 80 % dejan sitio a personas con menos soltura. Se mide con 5 a 8 personas: en usabilidad se suele decir que con unas cinco personas ya aparecen la mayoría de los problemas.
- *Teclado y lector de pantalla:* se prueba con NVDA (Windows, gratis) o VoiceOver (Mac o iPhone).
- *Lenguaje claro, idioma declarado, consistencia y respeto a las marcas.*

== Seguridad y privacidad (9 requisitos)

- *Sin datos personales, sin contraseñas, sin cookies de seguimiento:* es la decisión más importante. Si no tratamos datos personales, nos ahorramos casi todas las obligaciones del RGPD y casi todo el riesgo.
- *Solo HTTPS* y *solo dominios autorizados* para los enlaces: evita que alguien convierta el catálogo en una trampa que lleve a una página falsa (phishing).
- *Solo personas autorizadas cambian el catálogo*, y ninguna clave en el repositorio.
- *Doble revisión de los cambios de dirección* (conveniente) y *cabeceras de seguridad* (conveniente).
- *Información legal visible*, coherente con la de las aulas.

== Rendimiento y disponibilidad (6 requisitos)

- *2,5 segundos en el móvil:* es el umbral que Google considera «bueno» para que aparezca el contenido principal (métrica LCP). Es una referencia pública y fácil de medir.
- *Búsqueda en menos de 1 segundo:* propuesta nuestra; con una docena de aulas, debería ser instantáneo.
- *Soportar 10 veces el pico supuesto:* margen de seguridad sobre una carga que no conocemos.
- *99,5 % de disponibilidad al mes:* unas 3,6 horas de caída al mes como máximo. Es un objetivo modesto, adecuado para un servicio que no es crítico, porque las aulas siguen funcionando sin él.
- *Si la plataforma se cae, las aulas siguen accesibles:* la plataforma solo enlaza, no se interpone. Es un requisito de diseño muy importante y fácil de defender.
- *Recuperación en 1 día laborable* sin perder más que el último cambio.

== Mantenimiento (7 requisitos)

- *Alta de un aula en 15 minutos por alguien no técnico* siguiendo la guía. Se prueba con una persona ajena al proyecto («prueba de transferencia», que la ficha pide).
- *Guía de operación, copias con versiones, responsable designado y revisión cada 90 días.*
- *Componentes de terceros con licencia revisada*: es un límite de la ficha.
- *2 horas al mes o menos* de mantenimiento: supuesto que se validará en la Fase 5 (viabilidad).
- *Que otra persona pueda continuar el proyecto*: la ficha lo pone como indicador de trabajo excelente.

= 8. Trazabilidad y pruebas

El documento 05 tiene cinco tablas:

+ *Necesidad → escenario → requisito → prueba.* Las 10 necesidades de la Fase 1 están cubiertas. La única «débil» es N-04 (ver juntas todas tus aulas), que solo tiene requisitos futuros, porque depende de una cuenta común que no consta. Está justificado.
+ *Problema → requisito.* Los 8 problemas tienen respuesta. Dos (configuración distinta entre aulas y versión de Moodle) solo se señalan, porque arreglarlos supondría tocar las aulas.
+ *Requisito → prueba.* 33 casos de prueba en cinco tipos: funcionales (14), usabilidad y accesibilidad (5), seguridad (4), rendimiento (5) y mantenimiento (5). Los 44 requisitos imprescindibles y convenientes tienen al menos una prueba.
+ *Comprobación de cobertura*, con el recuento anterior.
+ *Si cae un supuesto*: qué requisitos revisar.

Las pruebas *solo se definen* ahora. Se ejecutan en la Fase 7. Todas las de seguridad y rendimiento se hacen contra *nuestra* plataforma, nunca contra las aulas reales.

= 9. Decisiones mías que debes conocer

Para que no te pillen por sorpresa, estas son las cosas en las que fui un paso más allá de lo que había en la Fase 1. Todas son razonables, pero son *propuestas*, no datos:

- *Todos los números* (80 %, 1 minuto, 2,5 s, 1 s, 99,5 %, 1 día, 15 minutos, 90 días, 2 h/mes, 5 a 8 personas). Si alguno no te convence, se cambia en un minuto.
- *Separé en varios requisitos* algunas capacidades del alcance de la Fase 1. Por ejemplo, el procedimiento de mantenimiento (AL-05) son ahora RF-06 a RF-09. No cambia el alcance, solo lo detalla.
- *Añadí dos cosas que no estaban como tales en la Fase 1:* el mensaje de «sin resultados» como imprescindible (RF-05) y el enlace fijo por aula (RF-14, conveniente). Las dos salen de los escenarios.
- *La caída de la plataforma no debe impedir entrar en las aulas* (RNF-REN-05). Condiciona la Fase 3: descarta soluciones que se pongan «en medio» del acceso.
- *Catálogo público*: lo propongo para no tratar datos personales. Si la empresa quiere que sea privado, cambia bastante (SF-03).

= 10. Preguntas que te puede hacer la tutora

#table(columns: (0.8fr, 1.2fr),
  [Pregunta], [Respuesta posible],
  [¿Por qué has seguido sin mi visto bueno?], [Porque me pediste que te fuera informando y la ficha dice que una revisión «no implica que el trabajo esté terminado». Lo he dejado registrado, y la Fase 2 no cambia el alcance de la Fase 1, solo lo concreta. Si corriges algo, se aplica sin rehacerlo todo.],
  [¿De dónde salen estos números?], [Unos son referencias públicas (2,5 s de Google, WCAG) y otros son propuestas razonadas. Todos están marcados como tales y se ajustarán con datos reales.],
  [¿Cómo sabes que el problema existe?], [No lo sé con certeza, y lo digo. Por eso hay una prueba con usuarios (CP-UX-01) que dará la primera medida real, y la analítica como requisito futuro.],
  [¿Por qué no un acceso único a todas las aulas?], [Porque no hay necesidad demostrada, no consta una cuenta común y supondría tocar las aulas y tratar datos personales. Queda como futuro con sus condiciones.],
  [¿Qué es un criterio de aceptación?], [Una condición que permite decir sí o no a si se cumple un requisito, sin opiniones. Por ejemplo: si busco «ecologica» sin tilde, tiene que salir «Tierra Más Ecológica».],
  [¿Qué es la trazabilidad?], [Poder seguir cada requisito desde el problema que lo origina hasta la prueba que lo comprueba. Puedo enseñarte un ejemplo completo.],
  [¿Cómo has priorizado?], [Con MoSCoW, igual que en la Fase 1. Imprescindible es lo mínimo para resolver el problema; el resto queda planificado, condicionado o descartado con motivo.],
)

= 11. Qué viene ahora

+ *Informar a la tutora* con el resumen de la Fase 2 (el PDF de `entregas/`).
+ *Si llegan respuestas de la empresa*, se actualizan los supuestos y, si hace falta, los requisitos. Cada cambio queda en el registro.
+ *Fase 3 — Alternativas:* comparar al menos dos formas de resolverlo (la ficha exige incluir la opción de no desarrollar nada), con criterios y pesos fijados *antes* de puntuar. Las opciones apuntadas en la Fase 1 son: no hacer nada y mejorar lo existente, una página estática de enlaces, una aplicación web con gestión, usar la web corporativa o una herramienta ya contratada, integrar con Moodle, acceso único o una combinación por etapas. Los requisitos de esta fase son la vara de medir: la opción elegida debe cumplir los imprescindibles.
