#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

function ctrl_c() {
    echo -e "\n\n${redColour}[!] Exiting...${endColour}\n"
    tput cnorm && exit 1
}

# Ctrl+C
trap ctrl_c INT

tput civis

# Zsh
sudo apt-get install zsh
rm -rf $HOME/.zshrc
cp -r {.zshrc,.p10k.zsh} $HOME
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Kitty
rm -rf $HOME/.conig/kitty
cp -r .config/kitty $HOME/.config

# Nvim
rm -rf $HOME/.config/nvim
git clone https://github.com/NvChad/NvChad $HOME/.config/nvim --depth 1

# Others
sudo apt-get install fzf bat lsd -y

tput cnorm
