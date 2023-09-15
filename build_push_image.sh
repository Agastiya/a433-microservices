#!/bin/bash

# Melakukan build docker image
docker build . -t item-app:v1

# Menampilkan list images
docker images

# Mengubah nama image agar sesuai dengan format GitHub Packages
docker tag item-app:v1 ghcr.io/agastiya/item-app:v1

# melakukan login ke GitHub Packages dengan password yang sudah diset sebelumnya (via terminal)
echo $PASSWORD_DOCKER_HUB | docker login --username agastiya --password-stdin ghcr.io

# melakukan push image ke GitHub Packages
docker push ghcr.io/agastiya/item-app:v1