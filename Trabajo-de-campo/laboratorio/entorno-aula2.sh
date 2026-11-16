#!/usr/bin/env bash
# Variables de entorno para manejar el aula de prueba 2 (Moodle 4.1.2) con moodle-docker.
# Uso, en una terminal distinta de la del aula 1:
#   source ~/Plataforma-Moodle/Trabajo-de-campo/laboratorio/entorno-aula2.sh

export COMPOSE_PROJECT_NAME=aula2                 # proyecto aparte: contenedores, red y base de datos propios
export MOODLE_DOCKER_WWWROOT=~/moodle-lab/aula2   # código de Moodle 4.1.2
export MOODLE_DOCKER_DB=pgsql
export MOODLE_DOCKER_PHP_VERSION=8.1
export MOODLE_DOCKER_WEB_PORT=8001                # http://localhost:8001

cd ~/moodle-lab/moodle-docker
echo "Entorno del aula 2 cargado (http://localhost:8001). Estás en $(pwd)"
echo "Encender: bin/moodle-docker-compose start   |   Apagar: bin/moodle-docker-compose stop"
