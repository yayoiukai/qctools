#!/bin/bash
docker-compose build
docker-compose up -d db
sleep 2
docker-compose run web python manage.py migrate || exit 1
docker-compose up -d
echo ">> Application is running <<"
echo "http://${DOCKER_HOST:-localhost}:8000" | sed 's/tcp:\/\///g' | sed 's/:[0-9]+//'
