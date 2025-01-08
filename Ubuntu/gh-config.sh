#!/bin/bash

# Script para configurar GitHub CLI e Git
# Criado em: 2025-01-08

# Solicitar nome e e-mail do usuário
read -p "Digite o seu usuário (GitHub): " NAME
read -p "Digite o seu e-mail (GitHub): " EMAIL

# Validar se os campos foram preenchidos
if [[ -z "$NAME" || -z "$EMAIL" ]]; then
  echo "Erro: Nome e e-mail são obrigatórios."
  exit 1
fi

# Adicionar repositório e instalar GitHub CLI
echo "Adicionando repositório do GitHub CLI..."
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /usr/share/keyrings/githubcli-archive-keyring.gpg > /dev/null
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

# Atualizar pacotes e instalar gh
echo "Instalando GitHub CLI..."
sudo apt update -y && sudo apt install gh -y

# Configurar autenticação do GitHub CLI
echo "Iniciando autenticação no GitHub...."
gh auth login

# Configurar Git com as informações fornecidas
echo "Configurando Git com o usuário: $NAME e e-mail: $EMAIL"
git config --global user.name "$NAME"
git config --global user.email "$EMAIL"

# Confirmar sucesso
echo "Configuração concluída! Teste o GitHub CLI com: gh --version !"
