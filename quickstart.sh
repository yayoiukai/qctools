#!/bin/bash
docker-compose build
docker-compose up -d
sleep 2
docker-compose run web python manage.py migrate
echo ">> Application is running <<"
echo $DOCKER_HOST | sed 's/tcp:\/\//http:\/\//g'
