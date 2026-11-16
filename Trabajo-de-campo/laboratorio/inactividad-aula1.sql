-- Simula inactividad en el aula 1 (solo laboratorio, datos ficticios).
-- Uso: dentro de psql del aula 1 (bin/moodle-docker-compose exec db psql -U moodle moodle)
-- lastaccess es una marca de tiempo Unix (segundos desde 1970-01-01 UTC); 0 = nunca ha entrado.

-- Ver el estado antes y después (solo lectura):
SELECT id, username, suspended, lastaccess, to_timestamp(lastaccess) FROM m_user ORDER BY id;

-- Inactivos más de 90 días:
UPDATE m_user SET lastaccess = extract(epoch from now() - interval '120 days')::bigint WHERE username = 'bruno.diaz';
UPDATE m_user SET lastaccess = extract(epoch from now() - interval '200 days')::bigint WHERE username = 'david.moreno';
UPDATE m_user SET lastaccess = extract(epoch from now() - interval '400 days')::bigint WHERE username = 'lucia.romero';
-- En el límite (por debajo de 90 días), para probar la frontera:
UPDATE m_user SET lastaccess = extract(epoch from now() - interval '60 days')::bigint WHERE username = 'fernando.gil';
