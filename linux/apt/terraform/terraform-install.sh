#!/bin/bash

# Script para instalar Terraform
# Atualizado em: 04-03-2025

# Atualizar o sistema
sudo apt update && sudo apt upgrade -y

# Instalando dependências necessárias
sudo apt install -y gnupg software-properties-common curl

# Adicione a chave GPG HashiCorp (dona do Terraform)
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg -y

# Adicione o repositório oficial do HashiCorp
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# Atualize novamente o Apt
sudo apt update

# Instalar o terraform
sudo apt install terraform -y
echo "Terraform instalado com sucesso, verifique se a instalação ocorreu de forma correta"