# Trabajo de campo: ¿hasta dónde llego programando la plataforma yo solo?

## El encargo

El 12 de noviembre de 2026 la tutora propuso, como alternativa al estudio de viabilidad, valorar si podría programar yo mismo, desde cero o casi, algo con las mismas funciones o algunas de las ventajas de la propuesta (por ejemplo, la gestión centralizada de todas las aulas). Pidió expresamente que no fuera un informe generado por IA, sino trabajo de campo: investigar, practicar y comprobar hasta dónde puedo llegar de manera individual.

## Cómo lo interpreto

- **No** se trata de programar un Moodle propio (un LMS completo). Para una persona sola no es viable en el tiempo de las prácticas.
- **Sí** se trata de programar yo la herramienta de gestión centralizada descrita en la propuesta de la Fase 2, probándola contra aulas Moodle de prueba montadas en mi ordenador, sin tocar las aulas reales de Grupo ATU.

*Pendiente de confirmar con la tutora.*

## Niveles

Cada nivel se apoya en el anterior. El resultado del estudio será el último nivel alcanzado y lo que faltaría para los siguientes.

| Nivel | Objetivo | Estado |
|---|---|---|
| 1 | Montar en local un aula Moodle 4.1.18 (la misma versión que Grupo ATU) con Docker | Hecho (2026-11-12) |
| 2 | Crear datos ficticios (cursos, alumnos, matrículas) y una segunda aula | Pendiente |
| 3 | Activar los servicios web y hacer las primeras llamadas a mano | Pendiente |
| 4 | Script que junte los alumnos de varias aulas y detecte cuentas inactivas | Pendiente |
| 5 | Pequeña web con inicio de sesión que muestre esa vista centralizada | Pendiente |
| 6 | Cambios reales (suspender, reactivar, matricular) con vista previa, confirmación y registro | Pendiente |
| 7 | Acceso con Microsoft 365, permisos por persona y aula | Pendiente |

## Cómo se documenta

- [`diario/`](diario/): una entrada por sesión de trabajo, con fecha, horas, qué he hecho, qué ha fallado, qué he aprendido y el siguiente paso.
- [`capturas/`](capturas/): capturas de pantalla, numeradas `TC-NN_aula_que-muestra_fecha.png`. Solo la página, sin pestañas del navegador ni datos personales.
- [`laboratorio/`](laboratorio/): scripts y configuración que uso para montar el entorno de pruebas.

## Uso de inteligencia artificial

Trabajo con un asistente de IA (Claude) como apoyo: me explica cada paso y cada comando, me ayuda a resolver errores y redacta borradores de código y de documentación que yo reviso. Las instalaciones, pruebas y decisiones las hago yo en mi ordenador. Cada entrada del diario indica qué parte se ha hecho con ayuda de la IA, porque medir hasta dónde llego trabajando así forma parte del propio estudio.

## Reglas

Las mismas del repositorio: ni contraseñas reales, ni tokens, ni datos personales. Las aulas de prueba solo contienen datos ficticios y las contraseñas que aparecen (`test`) son de laboratorio local.
