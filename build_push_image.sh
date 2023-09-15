#!/bin/bash

docker build . -t item-app:v1

docker images

docker tag item-app:v1 ghcr.io/agastiya/item-app:v1

echo $PASSWORD_DOCKER_HUB | docker login --username agastiya --password-stdin ghcr.io

docker push ghcr.io/agastiya/item-app:v1
