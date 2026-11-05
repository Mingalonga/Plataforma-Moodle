// Propuesta y viabilidad (documento breve para decidir) · fuente Typst
// Compilar desde Fase-2/propuesta: python3 -c "import typst; typst.compile('propuesta-viabilidad.typ', output='Propuesta-viabilidad_Plataforma-Moodle_v2.pdf')"

#import "estilo.typ": *
#set document(title: "Gestión centralizada de las aulas Moodle — Propuesta y viabilidad", author: "Carlos García Rallo")
#show: plantilla.with(pie: [Gestión centralizada de las aulas Moodle · Propuesta y viabilidad (v2)], portada: false)

#text(9pt, fill: gris, tracking: 0.5pt)[GRUPO ATU · DEPARTAMENTO DE PEDAGOGÍA Y E-LEARNING · INFORMÁTICA · DIRECCIÓN]
#v(0.1cm)
#text(19pt, weight: "bold", fill: azul)[Gestión centralizada de las aulas Moodle]
#v(-0.2cm)
#text(12pt, fill: gris)[Propuesta y viabilidad]
#v(0.1cm)
#text(9pt, fill: gris)[Carlos García Rallo · 5 de noviembre de 2026 · versión 2 · El detalle está en el dosier de respaldo, que se lee aparte.]
#line(length: 100%, stroke: 0.6pt + linea)

Se propone una *herramienta interna* desde la que el Departamento de Pedagogía y e-learning pueda *ver a los alumnos de todas las aulas, controlar sus accesos y hacer cambios individuales o globales* sin entrar y salir de cada aula. La herramienta se conectaría a cada aula por la *vía oficial que Moodle ya incluye* (los servicios web), con los permisos limitados que decida Informática, y según la documentación de Moodle *es viable técnicamente*.

= 1. Módulos de la herramienta

#table(columns: (0.95fr, 1.75fr, 0.55fr),
  [Módulo], [Qué permite], [Prioridad],
  [*Vista de alumnos*], [Ver el alumnado de un aula o buscar a una persona y ver en qué aulas y cursos está, su estado y su último acceso.], [Imprescindible],
  [*Control de accesos*], [Listar cuentas que no entran desde hace más de 90 días, que nunca han entrado o que están suspendidas, por aula y curso.], [Imprescindible],
  [*Cambios individuales*], [Suspender o reactivar una cuenta, matricular o desmatricular, cambiar el rol en un curso.], [Imprescindible],
  [*Cambios globales*], [La misma operación sobre varias personas o varias aulas en una sola orden (p. ej., suspender a una persona en las tres aulas en las que está).], [Imprescindible],
  [*Inventario y accesos directos*], [Las doce aulas en una lista, con enlaces a su gestión para lo que la herramienta no haga.], [Imprescindible],
  [Acceso con Microsoft 365], [Entrar con la cuenta corporativa, sin otra contraseña.], [Conveniente],
  [Cambios de ajustes e indicadores], [Cambiar ajustes de cursos en varias aulas; gráficos de evolución.], [Futuro],
)

Fuera: acceso para alumnado o profesorado, diseño y programación de las aulas, unificar las aulas y sustituir a Moodle.

= 2. Cómo funcionaría

#align(center)[
  #pieza(ancho: 3.3cm)[*Personal del DPE* \ entra con su cuenta (Microsoft 365)]
  #flecha()
  #pieza(ancho: 4.6cm)[*Herramienta de gestión* (interna) \ vista previa · confirmación · registro · permisos por persona y aula]
  #flecha(t: [clave limitada \ por aula])
  #pieza(ancho: 3.6cm)[*Servicios web de Moodle* \ aula 1 · aula 2 · … · aula 12]
]

- *No se tocan las aulas:* la herramienta usa la puerta oficial de Moodle; no cambia su código ni su diseño.
- *Nunca se guardan contraseñas* de las aulas ni copias permanentes de los datos del alumnado.
- *Nadie puede hacer desde la herramienta lo que no podría hacer en el aula con su cuenta.*
- *Todo cambio tiene vista previa, confirmación, registro y forma de deshacer.*

= 3. Viabilidad

== Conclusión preliminar

*Sí es viable técnicamente.* Moodle 4.1 (la versión más actualizada en Grupo ATU es la 4.1.18) incluye de serie las funciones necesarias para leer usuarios y matrículas, suspender y reactivar cuentas, matricular y cambiar roles. No hace falta instalar nada en las aulas ni modificar su código. Esta conclusión se basa en la documentación de Moodle; antes de implantar nada, habría que confirmarla en un entorno de prueba.

== Condiciones para que sea viable en Grupo ATU

Que sea posible técnicamente no basta: también depende de decisiones que corresponden a Grupo ATU. La propuesta solo sería viable si se cumplen estas cuatro condiciones:

#block(breakable: false)[
#table(columns: (auto, 1.6fr, 0.9fr),
  [], [Condición], [Quién],
  [1], [Activar los servicios web en cada aula, con un usuario y una clave *limitados a las funciones necesarias* (lectura y, por separado, escritura).], [Informática],
  [2], [Validar la herramienta en un *aula o perfil de prueba* sin datos reales antes de usarla en las aulas reales.], [Informática, una vez aceptada la propuesta],
  [3], [Decidir si se autoriza la *escritura* (cambios) o solo la lectura en una primera etapa.], [Informática y Dirección],
  [4], [Confirmar que la consulta de datos del alumnado desde la herramienta cumple la protección de datos (misma finalidad que hoy).], [Responsable del tratamiento],
)]

== Qué supondría para Informática

En cada aula (orientativo, alrededor de 1 hora por aula): activar los servicios web y el protocolo REST, crear un usuario de servicio con un rol limitado, crear un servicio con solo las funciones necesarias, generar la clave, restringirla a la dirección IP del servidor de la herramienta y ponerle fecha de caducidad.

= 4. Opciones por niveles

#table(columns: (0.9fr, 1.5fr, 1.15fr, 1.15fr),
  [Nivel], [Qué incluye], [A favor], [En contra],
  [*A. Consulta*], [Inventario, vista de alumnos y control de accesos. Solo lectura.], [Riesgo mínimo; ya ahorra entrar en doce aulas para mirar.], [Los cambios se siguen haciendo aula por aula.],
  [*B. + Cambios individuales*], [A + suspender, reactivar, matricular y cambiar rol, de uno en uno.], [Cubre el día a día sin entrar en el aula.], [Requiere claves de escritura.],
  [*C. + Cambios globales*], [B + la misma operación en varias personas o aulas.], [Es lo que pide el departamento; el mayor ahorro.], [Un error afecta a más personas: exige vista previa y registro.],
  [*D. + Microsoft 365*], [C + entrar con la cuenta corporativa en la herramienta y en las aulas.], [Menos contraseñas; bajas centralizadas.], [Cambia la identificación de cada aula.],
)

#nota[Recomendación.][Validar *A y B en un aula de prueba*; con resultados, pasar a *C*. Dejar *D* para cuando las anteriores funcionen. Así se avanza por etapas, cada una útil por sí sola y reversible.]

= 5. Riesgos principales y cómo se controlan

#table(columns: (1fr, 1.6fr),
  [Riesgo], [Control],
  [Un cambio global equivocado], [Vista previa, confirmación reforzada (más de un aula o más de 10 personas), registro y deshacer.],
  [Robo o mal uso de una clave], [Una clave por aula, solo con las funciones necesarias, restringida por IP, con caducidad y revocable; custodiada por Informática.],
  [Datos personales del alumnado], [Se leen al consultar, sin copia permanente; acceso por rol y registro de cada consulta.],
  [Versiones distintas de Moodle y actualizaciones], [La herramienta detecta qué permite cada aula y desactiva lo que no esté disponible; se vuelve a probar tras actualizar.],
  [Moodle 4.1 ya no recibe actualizaciones de seguridad (desde diciembre de 2025)], [No lo resuelve el proyecto, pero conviene tenerlo en cuenta: abrir servicios web en un Moodle sin soporte exige restringir por IP y limitar funciones.],
)

= 6. Esfuerzo orientativo

#block(breakable: false)[
#table(columns: (1.4fr, 1fr),
  [Tarea], [Esfuerzo orientativo],
  [Configuración de servicios web por aula (Informática)], [≈ 1 h por aula, ≈ 12 h en total],
  [Aula o perfil de prueba (Informática)], [≈ 2 a 4 h],
  [Prototipo de los niveles A y B en el aula de prueba (alumno)], [Dentro del proyecto de prácticas],
  [Mantenimiento en funcionamiento normal (DPE e Informática)], [≤ 8 h al mes],
  [Licencias], [Sin coste de licencias: Moodle y sus servicios web son de serie],
)]

Son estimaciones razonadas, no medidas; se ajustarán con la prueba.

= 7. Decisión que se pide

#nota[][
+ *Departamento de Pedagogía y e-learning:* ¿los módulos del apartado 1 cubren lo que necesitáis y con esas prioridades? Para «controles de accesos» se ha entendido revisar las cuentas inactivas, sin acceso o suspendidas y poder suspenderlas o reactivarlas; para «cambios globales», aplicar la misma operación a varias personas o aulas a la vez. ¿Es correcto?
+ *Informática:* ¿consideráis viable la propuesta con las condiciones del apartado 3, en especial activar los servicios web con claves limitadas?
+ *Dirección:* si el departamento e Informática la valoran bien, ¿se autoriza seguir adelante con la validación?
]
