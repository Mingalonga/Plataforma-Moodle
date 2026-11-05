// Guía de la Fase 2 para el alumno · fuente Typst
// Compilar: python3 -c "import typst; typst.compile('guia-fase-2-alumno.typ', output='Guia-alumno_Fase-2_Plataforma-Moodle_v2.pdf')"  (o: typst compile ...)

#let azul = rgb("#1f3a5f")
#let gris = rgb("#5b6470")
#let linea = rgb("#c9ced6")
#let version = "v2"

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
  #text(13pt, fill: gris)[Qué se ha hecho, por qué y cómo defenderlo \ Versión 2: enfoque de gestión interna]
  #v(1fr)
  #line(length: 100%, stroke: 0.6pt + linea)
  #v(0.2cm)
  #grid(columns: (3.2cm, 1fr), row-gutter: 0.55em,
    text(fill: gris)[Para], [Carlos García Rallo (uso interno, no es para entregar)],
    text(fill: gris)[Fecha], [4 de noviembre de 2026],
    text(fill: gris)[Basada en], [Documentación de la Fase 2, versión 0.2. Sustituye a la guía v1],
  )
  #v(1.5cm)
]

#outline(title: [Contenido], depth: 1)

#pagebreak()

= 1. Qué ha cambiado y por qué

La tutora contestó el 4 de noviembre. En resumen, dijo cinco cosas:

#table(columns: (0.9fr, 1.1fr),
  [Lo que dijo], [Lo que significa para el proyecto],
  [«El enfoque es la gestión de las plataformas a nivel interno, para no andar saliendo y entrando en una página y otra»], [La plataforma es para *el personal que gestiona las aulas*, no para el alumnado.],
  [«Ya que estos […] lo hacen mediante una URL que se les facilita»], [El alumnado no tiene el problema de encontrar su aula. *El catálogo para el alumnado se descarta.*],
  [«Lo llevaría el Departamento de Pedagogía y e-learning»], [El *DPE* es el usuario principal y mantiene la información.],
  [«La parte de implementación […] la ejecutaría informática»], [*Informática* es el perfil técnico: instala, da permisos, custodia claves.],
  [«Antes de todo esto habría que ver […] si es viable»], [Lo que dependa de conectar con Moodle queda *condicionado a la viabilidad* (Fase 5).],
)

Hay una frase que no está clara: «y ya estaría, por así decirlo, lo del tema de entorno de pruebas». La he interpretado como que, para el alumnado, no hace falta nada más. Pero *el proyecto sí necesita un aula de pruebas* para demostrar cualquier conexión con Moodle, así que conviene preguntárselo (P-T01).

#caja[Lo más importante que debes saber.][Esto *no* es un fallo del proyecto. La ficha dice que una revisión puede cambiar el enfoque, y lo que valora es que el cambio quede registrado y justificado. Está todo: la respuesta literal en el registro de seguimiento, el cambio de alcance anotado, las versiones antiguas guardadas en `historico/` y una tabla de correspondencia entre los requisitos viejos y los nuevos.]

= 2. Qué documentos han cambiado

#table(columns: (0.9fr, 1.1fr),
  [Documento], [Cambio],
  [Fase 1: registro de preguntas (0.9)], [La respuesta de la tutora como dato. Preguntas nuevas P-T01 y P-G01 a P-G06. Las del alumnado, marcadas como «pierde relevancia».],
  [Fase 1: actores y perfiles (0.4)], [Nuevos actores: DPE (A-13) e Informática (A-14). Nuevos perfiles PU-08 a PU-10. El alumnado pasa a afectado indirecto.],
  [Fase 1: situación actual (0.3)], [Necesidades nuevas N-11 a N-15 y problema principal PR-09 (gestión dispersa).],
  [Fase 1: riesgos (0.2)], [Suben los de seguridad: la plataforma concentra accesos a doce aulas (RS-10).],
  [Fase 1: alcance (0.3) y diagnóstico (0.5)], [Alcance rehecho (AL-15 a AL-27) y registrado como cambio de alcance.],
  [Fase 1: guion de reunión (v2)], [Preguntas para el DPE, Informática y quien decida la viabilidad.],
  [Fase 2: todo el paquete (0.2)], [Rehecho. Los identificadores se han renumerado.],
  [Entregas], [Resumen para la tutora v2, esta guía v2 y preguntas v2 (de 16 a 9).],
  [Sin cambios], [El resumen de la Fase 1 (v5), porque ya está entregado. El inventario de las aulas sigue siendo válido.],
)

= 3. La idea en una frase

#caja[][Una *herramienta interna*, solo para personal autorizado, con la *lista de las doce aulas* y *accesos directos a la gestión de cada una* (cursos, usuarios, matriculaciones, informes), mantenida por el DPE e instalada por Informática. Si resulta viable, además permitiría *consultar datos de varias aulas a la vez* sin entrar en ellas.]

Piensa en ello como un «panel de mandos»: no sustituye a Moodle (la gestión se sigue haciendo en cada aula), pero te ahorra buscar la dirección, navegar por el menú y confundirte de aula.

== Los tres bloques

#table(columns: (0.5fr, 1fr, 0.6fr),
  [Bloque], [Qué incluye], [¿Necesita tocar Moodle?],
  [Base (*Must*)], [Acceso restringido y roles, inventario de aulas, accesos directos, búsqueda, mantenimiento, registros.], [*No.* Solo son enlaces y una lista. Siempre es viable.],
  [Consulta (*Should*)], [Datos agregados de varias aulas, buscar un curso en todas, estado técnico.], [*Sí, para leer.* Necesita los servicios web de Moodle activados por Informática.],
  [Acciones (*Could*)], [Crear cursos o matricular desde el panel, entrar una vez en todas, buscar personas.], [*Sí, para escribir* o cambiar la autenticación. Más riesgo.],
)

Este reparto es tu mejor defensa ante «¿y si no es viable?»: el bloque base funciona siempre. La viabilidad decide hasta dónde se llega.

= 4. Conceptos clave (repaso)

- *Requisito funcional:* algo que la plataforma *hace* («ofrecer un acceso directo a la gestión de cursos de cada aula»).
- *Requisito no funcional:* *cómo* lo hace («con doble factor», «en 2 segundos»).
- *MoSCoW:* M imprescindible (prototipo), S conveniente (aquí, si es viable), C futuro, W descartado con motivo.
- *Criterio de aceptación:* condición de sí o no. Formato *Dado / Cuando / Entonces*.
- *Trazabilidad:* poder seguir cada requisito hasta su necesidad y hasta su prueba.
- *Servicios web de Moodle:* la vía oficial de Moodle para que otro programa lea o cambie datos sin entrar en el aula. Funciona con una *clave de servicio* (token). Por eso hay requisitos sobre quién guarda esas claves.
- *Aula de pruebas:* un Moodle sin datos reales. Si la empresa no tiene, se monta uno en tu ordenador. La ficha prohíbe probar sobre las aulas reales y presentar como real algo simulado.

#caja[Un hilo de principio a fin.][
*Problema PR-09* (hay que entrar y salir de cada aula) → *necesidad N-11* (gestionar cualquier aula desde un único punto) → *escenario ES-02* (Ana tiene que crear un curso en el aula de Tierra Más Ecológica) → *requisito RF-04* (accesos directos a la gestión de cada aula) → *caso de prueba CP-UX-01* (personas del DPE hacen la tarea con la plataforma y por el camino actual, y se comparan pasos y tiempo).
]

= 5. Datos de la tutora y supuestos

Ahora se separan dos cosas: lo que *ha dicho la tutora* (DT-01 a DT-06, son datos) y lo que *suponemos* (SF-01 a SF-14). Los supuestos que más pesan:

#table(columns: (auto, 0.9fr, 0.8fr, 0.9fr),
  [ID], [Qué suponemos], [Por qué], [Si es falso…],
  [SF-02], [Las tareas que más se repiten son las típicas de Moodle: cursos, matrículas, usuarios, informes, copias], [Son las funciones de administración estándar], [Cambian los accesos directos],
  [SF-03], [Cada persona del DPE tiene una cuenta distinta en cada aula], [No se ve ningún acceso común en las aulas], [Si ya hay acceso común, el panel se centra en la lista y la consulta],
  [SF-05], [No se tocan las aulas reales; se prueba en un aula de pruebas], [Límite de la ficha], [Si no hay aula de pruebas de la empresa, se monta una propia],
  [SF-06], [Informática puede activar los servicios web en modo lectura], [Moodle los trae de serie], [El panel se queda en el bloque base],
  [SF-07], [Las aulas usan Moodle 4.1 sin soporte], [Indicio de la Fase 1], [Si están actualizadas, conectar es menos arriesgado],
  [SF-12], [Basta con cifras agregadas, sin datos del alumnado], [Menos riesgo legal (RGPD)], [Hay que justificar el tratamiento (RF-17)],
  [SF-14], [El proyecto acaba en viabilidad, prototipo y recomendación], [La implementación es de Informática], [Cambia el plan de las fases 5 a 8],
)

= 6. Usuarios y escenarios

*Usuarios:* gestor/a de e-learning del DPE (PU-08, el principal), técnico/a de Informática (PU-09), responsable del DPE (PU-10) y el CAU solo para consultar (PU-05). El alumnado, el profesorado y las empresas quedan fuera.

#table(columns: (auto, 1fr, 1fr),
  [ID], [Escenario], [Por qué está],
  [ES-01], [Vista de conjunto al empezar la jornada], [Saber qué aulas funcionan sin abrir ninguna],
  [ES-02], [Ir directamente a la gestión de cursos de un aula], [Es el núcleo del enfoque (PR-09)],
  [ES-03], [Matricular a un grupo], [Muestra el límite: la matrícula se sigue haciendo en el aula],
  [ES-04], [No confundir aulas con el mismo título], [Cinco aulas se llaman igual (PR-03)],
  [ES-05], [Saber en qué aula está un curso], [Depende de los servicios web],
  [ES-06], [Resumen de varias aulas], [Ídem; solo cifras agregadas],
  [ES-07, ES-08], [Alta, cambio o retirada de un aula], [El inventario hay que mantenerlo (DPE + Informática)],
  [ES-09, ES-10], [Aula caída y estado técnico], [Lo necesita Informática],
  [ES-11], [Altas y bajas de personal], [Una herramienta con acceso a la gestión debe controlar quién entra],
  [ES-12], [Lector de pantalla o teclado], [La ficha lo exige para cualquier usuario],
  [ES-13], [La plataforma se cae], [Si se cae, se gestiona como hoy],
)

= 7. Los requisitos funcionales

== Imprescindibles (10)

RF-01 solo entra el personal autorizado · RF-02 roles (gestión, técnico, consulta) · RF-03 inventario de aulas con nombre propio, estado y responsables · RF-04 *accesos directos a la gestión* · RF-05 búsqueda y filtros · RF-06 altas y cambios con dominios permitidos · RF-07 ocultar sin borrar · RF-08 registro de cambios · RF-09 aviso a los 90 días sin revisar · RF-10 registro de entradas y permisos.

#caja[Detalle importante de RF-04.][El acceso directo te lleva a la página de gestión del aula, pero *no te mete dentro*: si no tienes la sesión abierta en esa aula, el aula te pedirá usuario y contraseña, como hoy. Meterte dentro automáticamente sería el inicio de sesión único (RF-16, futuro), y guardar tus contraseñas para hacerlo está prohibido (W-03). Si te preguntan «¿entonces qué ahorra?», la respuesta es: buscar la dirección, navegar por el menú y equivocarte de aula. Y es la base sobre la que se añadiría lo demás.]

== Convenientes (4), si es viable

RF-11 datos agregados de varias aulas · RF-12 buscar un curso en todas · RF-13 estado técnico (versión) · RF-14 comprobar que las aulas responden.

== Futuros (4) y descartados (6)

Futuros: acciones desde el panel (RF-15), acceso único (RF-16), buscar personas (RF-17), indicadores (RF-18). Descartados: tocar las aulas reales (W-01), unificarlas (W-02), contraseñas (W-03), portal para el alumnado (W-04), hacer un «segundo Moodle» (W-05) y arreglar la versión de Moodle (W-06).

= 8. Los requisitos no funcionales (34)

Lo que más ha cambiado respecto a la v1:

- *Seguridad (11):* antes era una página pública sin datos; ahora es una herramienta que da acceso a la gestión de doce aulas. Por eso: doble factor, permisos mínimos, claves de servicio custodiadas por Informática y nunca en el repositorio, nada público y registro de quién entra.
- *Privacidad:* nada de datos del alumnado guardados; en la consulta, solo cifras.
- *Eficiencia (RNF-UX-03):* el 90 % de las tareas llega a la página de gestión en 3 acciones y 20 segundos o menos, *y más rápido que hoy*. La comparación con la forma actual es lo que demuestra el valor. Los números son propuesta nuestra [R].
- *SUS 70:* el cuestionario SUS es un estándar de 10 preguntas; 68 es la media habitual, así que 70 es «por encima de la media».
- *Dispositivos:* el ordenador pasa a ser el principal; en el móvil basta con consultar.
- *Carga de las aulas (RNF-REN-07):* si el panel consulta las aulas, que sea poco y espaciado, para no ralentizarlas.
- *Mantenimiento:* 4 h/mes entre el DPE e Informática (antes 2 h, porque ahora puede haber integración).

= 9. Trazabilidad y pruebas

- 11 necesidades dentro del enfoque, todas cubiertas. 4 fuera (N-01, N-02, N-04, N-09), con motivo.
- 36 casos de prueba: 14 funcionales, 5 de usabilidad, 6 de seguridad, 5 de rendimiento y 6 de mantenimiento.
- *Regla de oro:* todo lo que exija entrar en un aula o usar sus servicios web se prueba en el aula de pruebas, nunca en las reales.

= 10. Preguntas que te puede hacer la tutora

#table(columns: (0.8fr, 1.2fr),
  [Pregunta], [Respuesta posible],
  [¿Por qué has rehecho todo?], [Porque me indicaste que el enfoque era la gestión interna. He guardado la versión anterior y hay una tabla que dice qué pasa con cada requisito antiguo.],
  [¿Qué gana el departamento con unos enlaces?], [No tener que buscar direcciones, navegar por doce menús ni equivocarse de aula. Y es la base: si Informática activa los servicios web, se puede consultar información de todas las aulas sin entrar.],
  [¿Por qué no entrar una sola vez en todas las aulas?], [Porque exige un directorio común y cambiar la autenticación de cada aula, lo que hace Informática y depende de la versión de Moodle. Lo dejo como futuro y lo estudio en la viabilidad.],
  [¿Y si no es viable conectar con Moodle?], [El bloque base funciona igual. La viabilidad decide hasta dónde se llega, no si hay proyecto.],
  [¿Cómo vas a probarlo sin tocar las aulas?], [Con un aula de pruebas sin datos reales. Por eso le pregunto si existe una.],
  [¿Qué pasa con la seguridad?], [Es lo que más ha crecido: doble factor, permisos por rol, claves custodiadas por Informática, nada público y registro de accesos.],
)

= 11. Qué viene ahora

+ *Enviar a la tutora* el resumen v2, preguntándole si la interpretación es correcta y qué quería decir con lo del entorno de pruebas.
+ *Pedir una conversación* con el DPE y con Informática (preguntas v2 y guion de reunión v2).
+ *Fase 3 — Alternativas:* comparar al menos dos opciones, incluida la de no desarrollar nada, con criterios y pesos fijados antes de puntuar. Las apuntadas: no hacer nada y organizar mejor los accesos; una página interna en una herramienta ya contratada (por ejemplo, SharePoint); una aplicación web interna; un panel conectado a los servicios web; acceso único con el directorio corporativo; herramientas existentes para gestionar varios Moodle; unificar las aulas (solo como referencia); o una combinación por etapas.
