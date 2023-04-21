# Fix the Java Problem
export _JAVA_AWT_WM_NONREPARENTING=1

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Oh My Zsh installation path
export ZSH="$HOME/.oh-my-zsh"

export PATH=~/.local/bin:/snap/bin:/usr/sandbox/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:/opt/go/bin/:/opt/kerbrute/:/opt/ghidra/:/opt/nvim/bin:$PATH

# Zsh theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
    sudo
)


# Save type histort for completion and easier life
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt histignorealldups sharehistory

# Functions
function settarget() {
		ip_address=$1
		machine_name=$2

		echo "$ip_address $machine_name" > ~/.config/bin/target
}

function cleartarget() {
	echo '' > ~/.config/bin/target
}


# Custom alias
alias vi="/opt/nvim/bin/nvim"
alias cat="bat"
alias catn="/bin/cat"
alias ls="lsd"
alias l="lsd -l"
alias la="lsd -a"
alias lla="lsd -la"
alias lt="lsd --tree"
alias icat="kitty +kitten icat"


# Loads oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Loads p10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Loads fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
