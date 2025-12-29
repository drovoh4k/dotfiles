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

Despues descargamos la ultima versión  **SOPORTADA por [NvChad](https://nvchad.com)** del [repositorio de github](https://github.com/neovim/neovim/releases/tag/stable). Y copiamos el contenido en el directorio /opt.

Y para tener la misma config en el usurario root:
```bash
cd /root/.config
sudo rm -rf nvim
sudo ln -s $HOME/.config/nvim .
```
