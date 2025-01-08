#! /bin/bash

# Script para instalar Docker e Docker Compose
# Criado em: 2025-01-08

# Atualizar o sistema
sudo apt update && sudo apt upgrade -y

# Instalar Docker
sudo apt install docker.io -y

# Habilitar e iniciar o serviço Docker
sudo systemctl enable docker
sudo systemctl start docker

# Adicionar o usuário ao grupo Docker
sudo usermod -aG docker $USER

# Instalar a versão mais recente do Docker Compose
# Remover versão antiga (se existir)
sudo apt remove docker-compose -y

# Baixar e instalar o Docker Compose manualmente
COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | cut -d '"' -f 4)
sudo curl -L "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Verificar as versões instaladas
echo "Docker Version:"
docker --version
echo "Docker Compose Version:"
docker-compose --version

# Exibir mensagem final
echo "Script finalizado! Por favor, reinicie sua sessão para aplicar as permissões do grupo Docker."
