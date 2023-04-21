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

# Copy files and folders
cp -r {.zshrc,.p10k.zsh,.oh-my-zsh} $HOME
cp -r .config/{nvim,nvim} $HOME/.config

# Install terminal stuff
sudo apt-get -y install fzf bat lsd

tput cnorm
