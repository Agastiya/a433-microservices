#!/bin/bash
 
# Melakukan build docker image
docker build . -t ghcr.io/agastiya/order-service:latest
 
# melakukan login ke GitHub Packages dengan password yang sudah diset sebelumnya (via terminal)
echo $PASSWORD_DOCKER_HUB | docker login --username agastiya --password-stdin ghcr.io
 
# melakukan push image ke GitHub Packages
docker push ghcr.io/agastiya/order-service:latest