# Fix the Java Problem
export _JAVA_AWT_WM_NONREPARENTING=1

# Fix HDPI on Linux
export GDK_SCALE=2
export QT_SCALE_FACTOR=2

export GDK_SCALE=2
$ export QT_SCALE_FACTOR=2

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Plugins
plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
  sudo
)

# Oh My Zsh installation path
export ZSH="$HOME/.oh-my-zsh"

export PATH=~/.local/bin:/snap/bin:/usr/sandbox/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:/opt/go/bin/:/opt/kerbrute/:/opt/ghidra/:/opt/nvim/bin:$PATH

# Zsh theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Save type histort for completion and easier life
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt histignorealldups sharehistory

# Loads oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Loads p10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Loads fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Functions
function settarget() {
        ip_address=$1
        machine_name=$2

        echo "$ip_address $machine_name" > ~/.config/bin/target
}

function cleartarget() {
    echo '' > ~/.config/bin/target
}

function mkt () {
    mkdir {nmap,content,exploits}
}

function extractPorts(){
    ports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
    ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u | head -n 1)"
    echo -e "\n[*] Extracting information...\n" > extractPorts.tmp
    echo -e "\t[*] IP Address: $ip_address"  >> extractPorts.tmp
    echo -e "\t[*] Open ports: $ports\n"  >> extractPorts.tmp
    echo $ports | tr -d '\n' | xclip -sel clip
    echo -e "[*] Ports copied to clipboard\n"  >> extractPorts.tmp
    cat extractPorts.tmp
  rm extractPorts.tmp
}

function cleanDocker () {
  docker rm $(docker ps -a -q) --force 2>/dev/null
  docker rmi $(docker images -q) --force 2>/dev/null
  docker network rm $(docker network ls -q) 2> /dev/null
  docker volume rm $(docker volume ls -q) 2>/dev/null
}

# Custom alias
alias vi='/opt/nvim/bin/nvim'
alias cat='bat'
alias catn='/bin/cat'
alias ls='lsd'
alias l='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
alias lt='lsd --tree'
alias icat='kitty +kitten icat'
