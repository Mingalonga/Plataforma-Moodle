// Documento ejecutivo de viabilidad («los planos») · fuente Typst
// Compilar desde Fase-2/planos: python3 -c "import typst; typst.compile('documento-ejecutivo.typ', output='Planos_Documento-ejecutivo_Plataforma-Moodle_v1.pdf')"

#import "estilo.typ": *
#set document(title: "Gestión centralizada de las aulas Moodle — Documento ejecutivo", author: "Carlos García Rallo")
#show: plantilla.with(pie: [Gestión centralizada de las aulas Moodle · Documento ejecutivo (v1)], portada: false)

#text(9pt, fill: gris, tracking: 0.5pt)[GRUPO ATU · DEPARTAMENTO DE PEDAGOGÍA Y E-LEARNING · INFORMÁTICA · DIRECCIÓN]
#v(0.1cm)
#text(19pt, weight: "bold", fill: azul)[Gestión centralizada de las aulas Moodle]
#v(-0.2cm)
#text(12pt, fill: gris)[Documento ejecutivo: qué se propone, si es viable y qué decisión se pide]
#v(0.1cm)
#text(9pt, fill: gris)[Carlos García Rallo · 5 de noviembre de 2026 · versión 1 · El detalle está en el dosier de respaldo, que se lee aparte.]
#line(length: 100%, stroke: 0.6pt + linea)

#nota[En una frase.][Una *herramienta interna* desde la que el Departamento de Pedagogía y e-learning puede *ver a los alumnos de todas las aulas, controlar sus accesos y hacer cambios individuales o globales*, sin entrar y salir de cada aula. Se conecta a cada aula por la *vía oficial que Moodle ya incluye* (servicios web), con permisos limitados que decide Informática. *Es viable técnicamente*; falta comprobarlo en un aula de prueba.]

= 1. Las «habitaciones» de la casa

#table(columns: (0.95fr, 1.75fr, 0.55fr),
  [Habitación], [Qué permite], [Prioridad],
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

= 3. ¿Es viable?

#nota[Conclusión preliminar: sí, con cuatro condiciones.][Moodle 4.1 (la versión más actualizada en Grupo ATU es la 4.1.18) incluye de serie las funciones necesarias para leer usuarios y matrículas, suspender y reactivar, matricular y cambiar roles. No hace falta instalar nada en las aulas. Esta conclusión se basa en la documentación de Moodle y se *confirmará en un aula de prueba* antes de cualquier decisión de implantación.]

#block(breakable: false)[
#table(columns: (auto, 1.6fr, 0.9fr),
  [], [Condición], [Quién],
  [1], [Activar los servicios web en cada aula, con un usuario y una clave *limitados a las funciones necesarias* (lectura y, por separado, escritura).], [Informática],
  [2], [Facilitar un *aula o perfil de prueba* sin datos reales para validar el prototipo.], [Informática],
  [3], [Decidir si se autoriza la *escritura* (cambios) o solo la lectura en una primera etapa.], [Informática y Dirección],
  [4], [Confirmar que la consulta de datos del alumnado desde la herramienta cumple la protección de datos (misma finalidad que hoy).], [Responsable del tratamiento],
)]

*Lo que haría Informática en cada aula* (orientativo, alrededor de 1 hora por aula): activar los servicios web y el protocolo REST, crear un usuario de servicio con un rol limitado, crear un servicio con solo las funciones necesarias, generar la clave, restringirla a la dirección IP del servidor de la herramienta y ponerle fecha de caducidad.

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
+ *Departamento de Pedagogía y e-learning:* ¿son estas las habitaciones y las prioridades correctas? En especial, ¿«controles de accesos» y «cambios globales» significan lo que se describe aquí?
+ *Informática:* ¿se puede habilitar un *aula o perfil de prueba* con los servicios web activados, para validar los niveles A y B?
+ *Dirección:* ¿se autoriza continuar con el prototipo en el aula de prueba?
]
