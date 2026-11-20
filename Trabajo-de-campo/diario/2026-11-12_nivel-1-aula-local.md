# Diario · 12 de noviembre de 2026 · Nivel 1: aula Moodle en local

- **Horario:** 16:15 a 19:05 (unas 2 h 50 min, con pausas para descargas)
- **Equipo:** portátil personal con Pop!_OS (Linux)
- **Objetivo:** tener funcionando en mi ordenador un aula Moodle 4.1.18, la misma versión que la más actualizada de Grupo ATU, sin depender de Informática.
- **Resultado:** conseguido. Aula «Aula 1 de prueba» en `http://localhost:8000`, con sesión de administrador.

## Qué he hecho

1. **Instalar Docker** (`docker.io`, `docker-compose-v2`) y añadir mi usuario al grupo `docker` para no tener que usar `sudo`. Comprobado con `docker run hello-world`.
2. **Crear la carpeta de laboratorio** `~/moodle-lab`, separada del repositorio, y descargar [moodle-docker](https://github.com/moodlehq/moodle-docker), el entorno oficial que usan los desarrolladores de Moodle.
3. **Descargar Moodle 4.1.18** con `git clone -b v4.1.18 --depth 1` en `~/moodle-lab/aula1` (unos 65 MB comprimidos).
4. **Configurar el entorno** con tres variables (`MOODLE_DOCKER_WWWROOT`, `MOODLE_DOCKER_DB=pgsql`, `MOODLE_DOCKER_PHP_VERSION=8.1`) y copiar la plantilla `config.php` dentro de Moodle. He leído el `config.php` por bloques para entender qué configura.
5. **Levantar los contenedores** con `bin/moodle-docker-compose up -d`: servidor web (Apache + PHP 8.1), base de datos (PostgreSQL 17), atrapacorreos (Mailpit) y dos auxiliares de pruebas (Selenium y exttests).
6. **Instalar Moodle** desde la terminal con `admin/cli/install_database.php`. Terminó con «Installation completed successfully».
7. **Entrar** en `http://localhost:8000` como administrador.

El script [`laboratorio/entorno-aula1.sh`](../laboratorio/entorno-aula1.sh) recoge las variables para no tener que escribirlas cada vez.

## Problemas y dudas

| Qué pasó | Causa | Solución |
|---|---|---|
| Docker solo funcionaba con `sudo` | Añadirse al grupo `docker` no se aplica hasta cerrar sesión | Cerrar sesión y volver a entrar |
| Error de `bash` al pegar `require_once(...)` | Era una línea de PHP del `config.php`, no un comando | Ninguna; no cambió nada |
| Se descargaron Selenium y exttests (casi 1 GB más) | La receta base de moodle-docker los incluye siempre | Se dejan; no molestan |
| La portada no pedía usuario y contraseña | En Moodle la portada es pública por defecto (`forcelogin` desactivado) | Entrar con «Log in». Pregunta abierta: ¿las aulas de ATU lo tienen activado? |
| Las primeras capturas mostraban mis pestañas del navegador | Captura de pantalla completa | Usar la captura de Firefox (Ctrl + Mayús + S) |

## Qué he aprendido

- La diferencia entre **imagen** (plantilla) y **contenedor** (copia en marcha), y por qué Docker es más ligero que una máquina virtual.
- Que **Docker Compose** levanta varios contenedores conectados a partir de una receta, y que dentro de esa red se encuentran por su nombre (`db`, `mailpit`).
- Cómo se conecta un puerto de mi ordenador con uno del contenedor (`127.0.0.1:8000 -> 80`) y que la base de datos queda cerrada hacia fuera.
- Que Moodle necesita que se entre por la URL exacta de su `wwwroot`, lo que servirá para poner una segunda aula en otro puerto.
- Que Moodle es un núcleo más cientos de plugins (la instalación los va creando uno a uno) y que la portada vacía ya hace 16 consultas a la base de datos.
- Que el entorno de laboratorio tiene la depuración activada y sin política de contraseñas, algo que nunca se haría en un aula real.

## Evidencias

- [TC-01](../capturas/TC-01_aula1_panel-administrador_2026-11-12.png): panel del administrador tras iniciar sesión.
- [TC-02](../capturas/TC-02_aula1_informacion-depuracion_2026-11-12.png): información de rendimiento y caché que muestra el modo de depuración.

## Ayuda de la IA en esta sesión

Claude me ha dado los comandos de uno en uno y me ha explicado qué hacía cada uno, qué significaban las salidas y los errores. Los comandos los he ejecutado yo y las comprobaciones las he hecho yo en el navegador. Este borrador del diario lo ha redactado Claude a partir de la sesión y yo lo he revisado.

## Siguiente paso

Nivel 2: crear cursos y alumnos ficticios en el aula 1 y montar una segunda aula en otro puerto.
