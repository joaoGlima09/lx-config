#!/bin/bash

# Script para instalar Pyenv 
# Atualizado em: 02-03-2025

# Atualizar o sistema
sudo apt update && sudo apt upgrade -y

# Instalando dependências para Pyenv
echo "Instalando dependências para Pyenv..."
sudo apt install -y \
    make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
    libncurses5-dev libncursesw5-dev xz-utils tk-dev \
    libffi-dev liblzma-dev python3-openssl git

# Instalando Pyenv para o usuário atual
echo "Instalando Pyenv..."
curl -fsSL https://pyenv.run | bash

# Adicionando Pyenv ao shell do usuário atual
echo "Adicionando Pyenv ao shell..."
if [[ -n "$ZSH_VERSION" ]]; then
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
    echo 'eval "$(pyenv init --path)"' >> ~/.zshrc
    echo 'eval "$(pyenv init -)"' >> ~/.zshrc
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
    source ~/.zshrc
else
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
    source ~/.bashrc
fi

echo "Pyenv instalado com sucesso para o usuário $USER!"

# Reiniciar o terminal
echo "Reiniciando o terminal..."
exec $SHELL
