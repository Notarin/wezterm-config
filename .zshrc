# Get operating system information.
source /etc/os-release

# oh-my-zsh installation path.
ZSH=/home/$USER/.oh-my-zsh/

# https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="darkblood"

# oh-my-zsh plugins.
plugins=(zoxide)

# Make required files/directories if they do not exist.
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi
if [[ ! -f ~/.path ]]; then
  touch ~/.path
fi
if [[ ! -f ~/.localrc ]]; then
  touch ~/.localrc
fi

# Sourcing oh-my-zsh, functions, and plugins.
source $ZSH/oh-my-zsh.sh
source ~/.zshfunctions
source ~/.path
source ~/.localrc

# alises.
alias ipconfig="ip addr"
alias iwconfig="ip addr"
alias which_window="xprop"
alias ls="exa"
alias l="exa --long"
alias la="exa --long -a"
alias img="viu"
alias hex="hexyl"
alias cat="bat --style=full --pager=never"
alias bat="bat --pager=never -p"
alias calc="eva"
alias cp="xcp"
alias kssh="kitty +kitten ssh"
alias c="clear && ( cd ~ ; source .zshrc )"
alias q="exit"
alias wiki="wiki-tui"
alias pw="packwiz"
alias fix-arch-keys="sudo pacman -Sy archlinux-keyring && sudo pacman -Su"
alias cd="z"

# Fuck support
eval $(thefuck --alias)

# Commands to run at startup.
clear
neofetch
echo "Updating dotfiles..."
( cd ~ ; git pull )

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/notarin/compute-archlinux-image-builder/google-cloud-sdk/path.zsh.inc' ]; then . '/home/notarin/compute-archlinux-image-builder/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/notarin/compute-archlinux-image-builder/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/notarin/compute-archlinux-image-builder/google-cloud-sdk/completion.zsh.inc'; fi


