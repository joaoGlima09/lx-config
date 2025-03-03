# Script para instalar Pyenv no Windows
# Atualizado em: 03-03-2025

# Altera a política de execução para permitir a execução do script
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force

# Baixa e executa o script de instalação do pyenv-win
Invoke-WebRequest -UseBasicParsing -Uri "https://raw.githubusercontent.com/pyenv-win/pyenv-win/master/pyenv-win/install-pyenv-win.ps1" -OutFile "./install-pyenv-win.ps1"
&"./install-pyenv-win.ps1"

# Restaura a política de execução para o modo restrito
Set-ExecutionPolicy -ExecutionPolicy Restricted -Scope Process -Force

# Mensagem de conclusão
Write-Host "Instalação do pyenv-win concluída!"