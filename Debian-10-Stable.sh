#!/bin/bash

# Script de pós-instalação do Debian Buster Stable;

URL_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
DIRETORIO_TEMP="$HOME/After-Install"

adcionar_repositorios (){
  mv $DIRETORIO_TEMP/sources.list -f /etc/apt/
}

remover_locks (){
  sudo rm /var/lib/dpkg/lock-frontend
  sudo rm /var/cache/apt/archives/lock
}

atualizar_repositórios (){
  sudo apt update
  sudo apt dist-upgrade -y
  sudo apt autoremove -y
  sudo apt autoclean
}

adicionar_arquitetura_i386 (){
  sudo dpkg --add-architecture i386
}

baixar_instalar_deb (){
  wget "$URL_CHROME" -P "$DIRETORIO_TEMP"
  sudo dpkg -i $DIRETORIO_TEMP/*.deb
  sudo apt -f install -y
}
