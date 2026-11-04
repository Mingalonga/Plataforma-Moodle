# 02 — Usuarios y escenarios de uso

| Campo | Valor |
|---|---|
| Versión | 0.1 |
| Fecha | 2026-11-03 |
| Estado | Revisión del propietario |
| Redacción | Claude (roles Analista y UX), a petición del alumno |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |

## 1. Usuarios

Se usan los siete perfiles de la Fase 1 ([documento 04](../Fase-1/04-mapa-actores-perfiles.md#4-perfiles-de-usuario-hipótesis)). Siguen siendo **hipótesis**: ninguno se ha validado con usuarios reales (P-U01).

| Perfil | Quién | Qué necesita de la plataforma | Tipo |
|---|---|---|---|
| PU-01 | Alumno/a de un solo campus | Encontrar su campus y llegar a la página de acceso con seguridad | Usuario final |
| PU-02 | Alumno/a de varios campus | Ver en un sitio en qué campus está cada curso | Usuario final |
| PU-03 | Profesor/a o tutor/a | Un enlace estable que compartir con el alumnado | Usuario final |
| PU-04 | Contacto de una empresa cliente | Saber qué campus corresponde a la formación contratada | Usuario final |
| PU-05 | Agente del CAU / tutoría virtual | Una lista fiable de campus, con estado y a quién escalar | Soporte |
| PU-06 | Gestor/a del catálogo (perfil nuevo) | Dar de alta, cambiar, ocultar y revisar campus con poco esfuerzo | Mantenimiento |
| PU-07 | Administrador/a de un campus | Avisar de cambios sin tener que tocar su Moodle | Mantenimiento |

Además, la ficha pide tener en cuenta las **necesidades de acceso** («distintas capacidades»): en todos los escenarios de usuario final se asume que puede haber personas que usen lector de pantalla, solo teclado, ampliación o un móvil pequeño (ES-12).

## 2. Escenarios de uso

Cada escenario describe una situación concreta, sin decidir pantallas ni tecnología. Los pasos dicen *qué* hace la persona, no *dónde pulsa*.

### ES-01. Encontrar el campus conociendo la marca

- **Perfil:** PU-01 · **Necesidades:** N-01, N-02 · **Base:** [S]
- **Contexto:** Lucía empieza un curso. En el correo de bienvenida aparecía «Centre Learning», pero lo ha borrado y no recuerda la dirección. Buscar en Google no sirve porque los campus no se indexan (PR-02).
- **Pasos:** entra en la plataforma central → escribe «centre» → ve los campus que coinciden → elige el suyo → sale a la página de acceso de su campus.
- **Resultado esperado:** llega a la página de acceso correcta sin ayuda, sabiendo en todo momento a qué sitio va.

### ES-02. Encontrar el campus sin conocer la marca

- **Perfil:** PU-01 · **Necesidades:** N-01 · **Problemas:** PR-08 · **Base:** [S]
- **Contexto:** Antonio sabe que hace «un curso de agricultura ecológica», pero no qué marca lo imparte. (Ejemplo ilustrativo: no se sabe qué cursos imparte cada campus.)
- **Pasos:** escribe «agricultura» o «ecológica» → la plataforma le muestra los campus relacionados → si no hay coincidencias, le indica cómo pedir ayuda.
- **Resultado esperado:** encuentra su campus o, si no, sabe a quién preguntar.
- **Nota:** depende de que cada campus tenga palabras clave o área (SF-11).

### ES-03. Distinguir dos campus con el mismo título

- **Perfil:** PU-01 · **Necesidades:** N-03 · **Problemas:** PR-03 · **Base:** H-01 [O]
- **Contexto:** cinco campus se llaman «AULA VIRTUAL CENTRE LEARNING». Marta entra en uno y duda de si es el suyo.
- **Pasos:** busca su marca en la plataforma → ve el logotipo, el nombre de la marca y el dominio de destino → comprueba que coincide con lo que tiene en su correo.
- **Resultado esperado:** puede distinguir su campus de los demás por algo más que el título.

### ES-04. Entrar desde el móvil

- **Perfil:** PU-01 · **Necesidades:** N-02, N-08 · **Base:** SF-08 [S]
- **Contexto:** Javier abre la plataforma desde el enlace de un mensaje, con el móvil y datos móviles.
- **Pasos:** la página carga rápido → busca su campus → pulsa para ir a él.
- **Resultado esperado:** todo se lee y se usa sin ampliar ni desplazarse en horizontal.

### ES-05. Alumno de varios campus

- **Perfil:** PU-02 · **Necesidades:** N-04 · **Base:** [S]
- **Contexto:** Rosa hace un curso en dos marcas distintas.
- **Pasos:** busca cada campus por separado y entra en cada uno con sus propias credenciales.
- **Resultado esperado:** encuentra los dos. La plataforma **no** le muestra «sus» campus de forma personalizada, porque no hay identidad común (SF-02); eso queda como evolución futura (RF-15).

### ES-06. Compartir el enlace de un campus

- **Perfil:** PU-03, PU-04 · **Necesidades:** N-01, N-02 · **Base:** [S]
- **Contexto:** un tutor quiere dar a su grupo un enlace que no cambie aunque cambie la dirección del campus.
- **Pasos:** busca el campus → copia el enlace de su ficha en la plataforma → lo comparte.
- **Resultado esperado:** el enlace lleva siempre a la información actualizada de ese campus.

### ES-07. Orientar a los trabajadores de una empresa cliente

- **Perfil:** PU-04 · **Necesidades:** N-01 · **Base:** [S]
- **Contexto:** la responsable de formación de una empresa debe indicar a la plantilla dónde hacer el curso contratado.
- **Pasos:** busca por marca o tipo de formación → copia el enlace del campus (ES-06).
- **Resultado esperado:** envía a la plantilla un enlace correcto sin consultar al CAU.

### ES-08. Atender «no sé cuál es mi campus» en el CAU

- **Perfil:** PU-05 · **Necesidades:** N-05 · **Base:** soporte común [O]; necesidad [S]
- **Contexto:** llama un alumno que no sabe a qué campus entrar.
- **Pasos:** el agente consulta el catálogo → ve qué campus están activos, si alguno está en mantenimiento y a quién escalar → indica al alumno el campus o le envía el enlace de su ficha.
- **Resultado esperado:** resuelve la consulta con información actualizada y sin preguntar a los administradores.

### ES-09. Dar de alta un campus nuevo

- **Perfil:** PU-06, PU-07 · **Necesidades:** N-06 · **Base:** [R]
- **Contexto:** se abre un nuevo campus para una marca.
- **Pasos:** el administrador avisa a la persona gestora → esta añade el campus con los datos obligatorios → la plataforma comprueba que la dirección pertenece a un dominio permitido → el cambio queda registrado → el campus aparece en el catálogo.
- **Resultado esperado:** el alta se hace en pocos minutos, sin programar y sin tocar el Moodle.

### ES-10. Cambiar, poner en mantenimiento o retirar un campus

- **Perfil:** PU-06, PU-07 · **Necesidades:** N-06, N-10 · **Base:** [R]
- **Contexto:** un campus cambia de dirección, entra en mantenimiento o se cierra.
- **Pasos:** la persona gestora actualiza la dirección, marca el estado o lo oculta → el cambio queda registrado con fecha y autor.
- **Resultado esperado:** los usuarios ven la información correcta; un campus retirado no se borra, se oculta, para poder recuperarlo y para conservar el historial.

### ES-11. Detectar un enlace roto

- **Perfil:** PU-06 · **Necesidades:** N-06, N-10 · **Riesgo:** RS-01 · **Base:** [R]
- **Contexto:** un campus deja de responder o cambia de dirección sin avisar.
- **Pasos:** la comprobación periódica detecta que no responde → avisa a la persona gestora → esta revisa y corrige o marca el campus en mantenimiento.
- **Resultado esperado:** el error se detecta antes de que lo comuniquen los usuarios.

### ES-12. Usar la plataforma con lector de pantalla o solo con teclado

- **Perfil:** cualquier usuario final · **Necesidades:** N-08 · **Base:** Ficha 01, «Experiencia de uso» [D]
- **Contexto:** Pedro es ciego y usa un lector de pantalla.
- **Pasos:** recorre la página con el teclado → el lector anuncia el buscador, el número de resultados y el nombre de cada campus → sabe que el enlace le lleva a otro sitio.
- **Resultado esperado:** completa ES-01 en las mismas condiciones que cualquier otra persona.

### ES-13. La plataforma central no está disponible

- **Perfil:** cualquier usuario final, PU-05 · **Necesidades:** N-10 · **Base:** Ficha 01, «Continuidad» [D]
- **Contexto:** la plataforma cae o se está actualizando.
- **Pasos:** el usuario que ya conoce su campus entra directamente por su dirección; el CAU usa la copia del catálogo para orientar; la persona responsable restaura el servicio con el procedimiento documentado.
- **Resultado esperado:** la caída **no impide** entrar en ningún campus (la plataforma no se interpone en el acceso) y el servicio se recupera en el plazo fijado (RNF-REN-06).

## 3. Escenarios descartados en esta fase

| Escenario | Motivo | Dónde queda |
|---|---|---|
| Entrar una sola vez y acceder a todos los campus (inicio de sesión único) | No hay necesidad demostrada ni identidad común (P-N02, SF-02) | RF-16, *Could* |
| Ver cursos, notas o avisos de los campus en la plataforma | Exige integrar con Moodle; indicio de versión sin soporte (SF-10) | RF-17, *Could* |
| Recuperar la contraseña de un campus desde la plataforma | La plataforma nunca trata credenciales de los campus (RS-04) | W-03, *Won't* |

## 4. Control de versiones

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| 0.1 | 2026-11-03 | Claude (Analista / UX) | Primera versión: 13 escenarios y 3 descartados |
