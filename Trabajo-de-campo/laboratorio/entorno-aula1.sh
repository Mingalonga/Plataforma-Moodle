#!/usr/bin/env bash
# Variables de entorno para manejar el aula de prueba 1 con moodle-docker.
# Uso (desde cualquier carpeta):  source ~/Plataforma-Moodle/Trabajo-de-campo/laboratorio/entorno-aula1.sh
# "source" hace que las variables se queden en la terminal actual.

export MOODLE_DOCKER_WWWROOT=~/moodle-lab/aula1   # código de Moodle 4.1.18
export MOODLE_DOCKER_DB=pgsql                     # base de datos PostgreSQL
export MOODLE_DOCKER_PHP_VERSION=8.1              # la última versión de PHP que admite Moodle 4.1

cd ~/moodle-lab/moodle-docker
echo "Entorno del aula 1 cargado. Estás en $(pwd)"
echo "Encender: bin/moodle-docker-compose start   |   Apagar: bin/moodle-docker-compose stop"
