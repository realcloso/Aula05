#!/bin/bash

# Nome da rede
NETWORK_NAME="minharede-net"

# Verifica se a rede já existe
if docker network ls | grep -w "$NETWORK_NAME" > /dev/null; then
  echo "A rede '$NETWORK_NAME' já existe. Nada será feito."
else
  # Cria a rede bridge personalizada
  docker network create \
    --driver bridge \
    $NETWORK_NAME

  # Verifica se a criação foi bem-sucedida
  if [ $? -eq 0 ]; then
    echo "✅ Rede '$NETWORK_NAME' criada com sucesso!"
  else
    echo "❌ Falha ao criar a rede '$NETWORK_NAME'."
  fi
fi
