# My dotfiles

# 1. Fonts
Para instalar las fuentes, descargamos nuestra fuente preferida (en mi caso Hack Nerd Font):
https://www.nerdfonts.com/font-downloads

Y copiamos el contenido del archivo zip en: `/usr/local/share/fonts`

# 1. Kitty
Para instalar la [**kitty**](https://github.com/kovidgoyal/kitty) primero descargamos el **binary bundle** de la ultima versión en el repositorio de GitHub. Y copiamos el bundle en el directorio`/opt`.

A continuación la instalamos con apt también:
```bash
sudo apt install kitty -y
```


# 2. zsh & oh-my-zsh
Para instalar zsh simplemente hacemos:
```bash
sudo apt install zsh -y
```

Y para instalar oh-my-zsh:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Y para tener la misma config en el usurario root:
```bash
sudo chmod -R 755 $HOME/.oh-my-zsh
sudo chown -R root:root $HOME/.oh-my-zsh
cd /root
sudo rm -rf .zshrc .zshrc.pre-oh-my-zsh* .oh-my-zsh
sudo ln -s $HOME/{.zshrc,.zshrc.pre-oh-my-zsh,.oh-my-zsh} .
sudo usermod --shell /usr/bin/zsh root
```

Ademas instalamos ciertas dependencias:
* [bat](https://github.com/sharkdp/bat) .deb github
* [lsd](https://github.com/lsd-rs/lsd) - .deb github
* [fzf](https://github.com/junegunn/fzf) 
```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

# 3. Nvim
Primero desinstalamos el neovim actual:
```bash
sudo apt remove neovim -y
```

Instalamos npm y tree-sitter-cli:
```bash
sudo apt install npm -y
npm install tree-sitter-cli@0.18.3
```

Despues descargamos la ultima versión  **SOPORTADA por NvChad** del [repositorio de github](https://github.com/neovim/neovim/releases/tag/stable). Y copiamos el contenido en el directorio /opt.

A continuación eliminamos la configuración actual y descargamos la configuración de [NvChad](https://nvchad.com).
```bash
rm -rf ~/.config/nvim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
```

Y para tener la misma config en el usurario root:
```bash
cd /root/.config
sudo rm -rf nvim
sudo ln -s $HOME/.config/nvim .
```


# 4. Bspwm & Sxhkd
Primero instalamos las dependencias:
```bash
sudo apt install build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev -y
```

Despues hacemos un update del sistema:
```bash
sudo apt update
```

Clonamos el repositorio git de **bspwm**, hacemos un make y lo instalamos:
```bash
git clone https://github.com/baskerville/bspwm.git
cd bspwm
make
sudo make install
sudo apt-get install bspwm -y
```

Clonamos el repositiorio git de **sxhkd** y hacemos un make:
```bash
git clone https://github.com/baskerville/sxhkd.git
cd sxhkd
make
sudo make install
```

# 5. Polybar
Primero instalamos las dependencias:
```bash
sudo apt install cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libuv1-dev libnl-genl-3-dev -y
```

Clonamos el repositiorio, hacemos un build y un make:
```bash
git clone --recursive https://github.com/polybar/polybar
cd polybar
mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install
```

# 6. Picom & Feh
Primero instalamos las dependencias:
```bash
sudo apt install meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev -y
```

Clonamos el repositiorio, hacemos un build y lo instalamos:
```bash
git clone https://github.com/ibhagwan/picom.git
cd picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install
```

Para instalar feh simpelmente hacemos:
```bash
sudo apt install feh -y
```

# 7. Rofi 
Para instalar rofi simplemente hacemos:
```bash
sudo apt install rofi -y
```

# 8. Ranger
Para instalar ranger simplemente hacemos:
```bash
sudo apt install ranger
```
