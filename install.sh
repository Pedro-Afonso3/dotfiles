#!/bin/bash

echo "📦 Instalando dotfiles do Hyprland..."

# Cores
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

# Função para criar link simbólico
link_file() {
    local src="$1"
    local dest="$2"
    
    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        echo "⚠️  Backup: $dest -> $dest.backup"
        mv "$dest" "$dest.backup"
    fi
    
    ln -sf "$src" "$dest"
    echo -e "${GREEN}✓${NC} Linked $src -> $dest"
}

# Hyprland
echo -e "\n${BLUE}Configurando Hyprland...${NC}"
mkdir -p ~/.config/hypr
link_file "$PWD/configs/hypr/hyprland.conf" ~/.config/hypr/hyprland.conf

# Waybar
echo -e "\n${BLUE}Configurando Waybar...${NC}"
mkdir -p ~/.config/waybar
for file in configs/waybar/*; do
    link_file "$PWD/$file" ~/.config/waybar/$(basename "$file")
done

# Shell
echo -e "\n${BLUE}Configurando ZSH...${NC}"
link_file "$PWD/zshrc" ~/.zshrc

echo -e "\n${GREEN}✅ Instalação completa!${NC}"
echo "Recomendado: reboot para aplicar todas as configurações."