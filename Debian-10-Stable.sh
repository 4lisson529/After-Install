#!/bin/bash

# Script de pós-instalação do Debian Buster Stable;

URL_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
DIRETORIO_TEMP="$HOME/Downloads/Temp"

remover_locks (){
  sudo rm /var/lib/dpkg/lock-frontend
  sudo rm /var/cache/apt/archives/lock
}

adicionar_arquitetura_i386 (){
  sudo dpkg --add-architecture i386
}

atualizar_repositórios (){
  sudo apt update
  sudo apt dist-upgrade -y
  sudo apt autoremove -y
  sudo apt autoclean
}

baixar_instalar_deb () {
  mkdir "$DIRETORIO_TEMP"
  wget "$URL_CHROME" -P "$DIRETORIO_TEMP"
  sudo dpkg -i $DIRETORIO_TEMP/*.deb
  sudo apt -f install -y
}
