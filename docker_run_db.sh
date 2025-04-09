#!/bin/bash

# Nome do container
CONTAINER_NAME="meu_db"

# Verifica se o container já existe
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "O container '$CONTAINER_NAME' já existe. Parando e removendo..."
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

# Executa novo container MySQL
docker run -d \
  --name $CONTAINER_NAME \
  --network minharede-net \
  -e MYSQL_ROOT_PASSWORD=password \
  -e MYSQL_DATABASE=banco_local \
  -e MYSQL_USER=user \
  -e MYSQL_PASSWORD=senha_segura \
  -p 3306:3306 \
  -v $(pwd)/data/mysql:/var/lib/mysql \
  mysql:8.0

echo "Container '$CONTAINER_NAME' iniciado com sucesso!"
