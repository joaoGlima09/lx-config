#!/bin/bash

# Script para instalar Poetry 
# Atualizado em: 02-03-2025

# Atualizar o sistema
sudo apt update && sudo apt upgrade -y

# Instalando Poetry
echo "Instalando Poetry..."
curl -sSL https://install.python-poetry.org | python3 -
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
poetry completions bash >> ~/.bash_completion
echo "Poetry instalado com sucesso. Recarregue o shell ou execute: source ~/.bashrc"

# Reiniciar o terminal
echo "Reiniciando o terminal..."
exec $SHELL
