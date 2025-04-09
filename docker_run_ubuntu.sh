#!/bin/bash

# Nome do container
CONTAINER_NAME="ubuntu_dev"

# Verifica se o container já existe
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "O container '$CONTAINER_NAME' já existe. Parando e removendo..."
    docker stop $CONTAINER_NAME >/dev/null
    docker rm $CONTAINER_NAME >/dev/null
fi

# Executa novo container Ubuntu
docker run -dit \
  --name $CONTAINER_NAME \
  -v $(pwd)/ubuntu_home:/home/devuser \
  --hostname ubuntu-container \
  ubuntu:22.04 \
  bash

# Verifica se o container foi criado com sucesso
if [ $? -eq 0 ]; then
  echo "✅ Container '$CONTAINER_NAME' iniciado com sucesso!"
  echo "Para acessar: docker exec -it $CONTAINER_NAME bash"
else
  echo "❌ Falha ao iniciar o container '$CONTAINER_NAME'."
fi
