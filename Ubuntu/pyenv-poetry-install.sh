#!/bin/bash

# Script para instalar Pyenv e Poetry
# Criado em: 2025-01-05

# Atualizar o sistema
sudo apt update && sudo apt upgrade -y


# Função para verificar se um comando está disponível
command_exists() {
    command -v "$1" &> /dev/null
}

# Instalando Pyenv
if ! command_exists pyenv; then
    echo "Instalando Pyenv..."
    curl -fsSL https://pyenv.run | bash
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
    echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(pyenv init - bash)"' >> ~/.bashrc
    echo "Pyenv instalado. Recarregando ambiente..."
    source ~/.bashrc
else
    echo "Pyenv já está instalado."
fi

# Instalando dependências para Pyenv
echo "Instalando dependências para Pyenv..."
sudo apt install -y \
    make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
    libncurses5-dev libncursesw5-dev xz-utils tk-dev \
    libffi-dev liblzma-dev python3-openssl git

# Instalando Python com Pyenv
read -p "Insira uma versão do Python para instalar com Pyenv: " PYTHON_VERSION
if pyenv versions | grep -q "$PYTHON_VERSION"; then
    echo "A versão $PYTHON_VERSION já está instalada no Pyenv."
else
    pyenv install "$PYTHON_VERSION"
    pyenv global "$PYTHON_VERSION"
    echo "Python $PYTHON_VERSION instalado e definido como padrão."
fi

# Instalando Poetry
if ! command_exists poetry; then
    echo "Instalando Poetry..."
    curl -sSL https://install.python-poetry.org | python3 -
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
    poetry completions bash >> ~/.bash_completion
    echo "Poetry instalado com sucesso. Recarregue o shell ou execute: source ~/.bashrc"
else
    echo "Poetry já está instalado."
fi

echo "Script concluído! 🚀 Recarregue o terminal para aplicar as alterações."