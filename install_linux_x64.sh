#!/bin/bash

#######################################
# Preload
#######################################

set -e

sudo echo "Sudo confirmed"

#######################################
# Required tools
#######################################

sudo apt install curl -y
sudo apt install git -y


#######################################
# Step 1: Install fonts
#######################################

sudo cp fonts/* /usr/local/share/fonts


#######################################
# Step 2: Install kitty
#######################################

# Create install folder
kitty_path="/opt/kitty"
sudo mkdir $kitty_path
cd $kitty_path

# Download bundle
curl -s "https://api.github.com/repos/kovidgoyal/kitty/releases/latest" | grep "browser_download_url.*-x86_64.txz" | cut -d '"' -f 4 | xargs sudo curl -L -o kitty.txz 1>/dev/null

# Unpack it
sudo tar -xf kitty.txz
sudo rm kitty.txz

# Return to folder
cd -

# Also install with apt
sudo apt install kitty -y

# Copy config
rm -rf $HOME/.config/kitty 2>/dev/null
cp -r .config/kitty $HOME/.config


#######################################
# Step 3: Install certain tools
#######################################

sudo apt install bat -y
sudo apt install lsd -y
sudo apt install fzf -y


#######################################
# Step 4: Zsh & OhMyZsh
#######################################

# Install Zsh
sudo apt install zsh -y

# Set as default
sudo chsh -s /usr/bin/zsh $USER

# Install OhMyZsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install OhMyZsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k

# Add files
rm $HOME/.zshrc 2>/dev/null
cp .zshrc $HOME
cp .p10k.zsh $HOME


#######################################
# Step 4: Nvim
#######################################

# Go to install folder
cd /opt

# Download bundle
curl -s "https://api.github.com/repos/neovim/neovim/releases/latest" | grep "browser_download_url.*linux-x86_64.tar.gz" | cut -d '"' -f 4 | xargs sudo curl -L -o nvim.tar.gz 1>/dev/null

# Unpack it
sudo tar -xzf nvim.tar.gz
sudo rm nvim.tar.gz

# Rename folder
sudo mv nvim* nvim

# Return to folder
cd -

# Install npm and tree-sitter-cli
sudo apt install npm -y
npm install tree-sitter-cli@0.18.3

# Install NvChad
git clone https://github.com/NvChad/starter ~/.config/nvim
