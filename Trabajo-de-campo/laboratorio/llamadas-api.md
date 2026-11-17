# Llamadas a la API REST de Moodle (laboratorio)

El token **nunca** se escribe aquí ni en ningún archivo del repositorio. Se guarda fuera, en `~/moodle-lab/token-aula1.txt` (permisos `600`), y se carga en la terminal con:

```bash
TOKEN=$(cat ~/moodle-lab/token-aula1.txt)
```

Base de todas las llamadas (aula 1): `http://localhost:8000/webservice/rest/server.php`

| Opción | Para qué |
|---|---|
| `curl -s` | Sin barra de progreso. Ojo: también oculta los errores |
| `curl -g` | Trata `[ ]` como texto (necesario con `criteria[0][key]`) |
| `python3 -m json.tool --no-ensure-ascii` | Ordena el JSON y muestra bien las tildes |
| `\| less` | Leer salidas largas (`q` para salir) |

## Comprobar la conexión

```bash
curl -s "http://localhost:8000/webservice/rest/server.php?wstoken=$TOKEN&wsfunction=core_webservice_get_site_info&moodlewsrestformat=json" | python3 -m json.tool --no-ensure-ascii
```

## Cursos del aula

```bash
curl -s "http://localhost:8000/webservice/rest/server.php?wstoken=$TOKEN&wsfunction=core_course_get_courses&moodlewsrestformat=json" | python3 -m json.tool --no-ensure-ascii | less
```

## Matriculados de un curso (por `id` de curso)

```bash
curl -s "http://localhost:8000/webservice/rest/server.php?wstoken=$TOKEN&wsfunction=core_enrol_get_enrolled_users&moodlewsrestformat=json&courseid=2" | python3 -m json.tool --no-ensure-ascii | less
```

## Buscar un usuario (por `username` o `email`)

```bash
curl -sg "http://localhost:8000/webservice/rest/server.php?wstoken=$TOKEN&wsfunction=core_user_get_users&moodlewsrestformat=json&criteria[0][key]=username&criteria[0][value]=marcos.vidal" | python3 -m json.tool --no-ensure-ascii
curl -sg "http://localhost:8000/webservice/rest/server.php?wstoken=$TOKEN&wsfunction=core_user_get_users&moodlewsrestformat=json&criteria[0][key]=email&criteria[0][value]=carmen.ruiz@example.com" | python3 -m json.tool --no-ensure-ascii
```

Las respuestas obtenidas el 2026-11-17 están en [`respuestas/`](respuestas/), con las claves privadas ocultas.
