#!/bin/bash

docker build . -t item-app:v1

docker images

docker tag item-app:v1 ghcr.io/agastiya/item-app:v1

docker login --username agastiya --password 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 ghcr.io

docker push ghcr.io/agastiya/item-app:v1
