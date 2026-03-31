#!/bin/bash
echo "📦 Instalando pacotes..."

# Pacotes oficiais
sudo pacman -S --needed - < pacman.txt

# Pacotes AUR
yay -S --needed - < aur.txt