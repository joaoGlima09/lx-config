#!/bin/bash

# Script para criar um repositório no GitHub e fazer o primeiro commit
# Criado em: 2025-01-08

# Verificar se o GitHub CLI está instalado
if ! command -v gh &> /dev/null; then
    echo "Erro: GitHub CLI (gh) não está instalado."
    echo "Instale-o com: https://cli.github.com/"
    exit 1
fi

# Solicitar informações do usuário
read -p "Nome do repositório: " REPO_NAME
read -p "Descrição do repositório (opcional): " REPO_DESC
read -p "É um repositório privado? (y/n): " IS_PRIVATE

# Configurar visibilidade do repositório
if [[ "$IS_PRIVATE" == "y" || "$IS_PRIVATE" == "Y" ]]; then
    VISIBILITY="private"
else
    VISIBILITY="public"
fi

# Criar repositório no GitHub
echo "Criando o repositório no GitHub..."
gh repo create "$REPO_NAME" --description "$REPO_DESC" --"$VISIBILITY" --confirm

if [[ $? -ne 0 ]]; then
    echo "Erro ao criar o repositório no GitHub."
    exit 1
fi

# Inicializar o repositório local
echo "Inicializando o repositório local..."
git init
git branch -M main

# Adicionar README.md como arquivo inicial
echo "Criando README.md..."
echo "# $REPO_NAME" > README.md
git add README.md

# Fazer o primeiro commit
echo "Fazendo o primeiro commit..."
git commit -m "Initial commit"

# Conectar ao repositório remoto
echo "Conectando ao repositório remoto..."
git remote add origin "https://github.com/$(gh auth status | grep -oP '(?<=account )\S+')/$REPO_NAME.git"

# Fazer push para o repositório remoto
echo "Enviando para o GitHub..."
git push -u origin main

echo "Repositório criado e pronto no GitHub!!! 🎉"
