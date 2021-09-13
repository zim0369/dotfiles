# ~/.bashrc

export LANG=en_US.UTF-8

# URxvt content erased workaround
for (( i=1; i<=$LINES; i++ )); do echo; done; clear

# Bash Prompt
PS1="\[\e[1;33m\]   [\u@\w] \n >> "

# VI MODE
set -o vi

# Aliases
alias ls='ls --color=auto'
alias x="exit"
alias l="ls" 
alias ll="ls -la" 
alias c="clear" 
alias v='vim'
alias sv='sudo vim'
alias brc="vim ~/.bashrc"
alias vrc="vim ~/.vimrc"
alias zrc="vim ~/.zshrc"
alias sbrc="source ~/.bashrc"
alias svrc="source ~/.vimrc"
alias szrc="source ~/.zshrc"
alias cf="cd /opt/dwm && vim config.def.h"
alias td="vim ~/.todo.txt" 
alias pacman="sudo pacman" 
alias torr='transmission-cli -w ~/torrents -D -u 30' 
alias dragon="dragon-drag-and-drop" 

alias suspend='systemctl suspend && slock'
alias poweroff='systemctl poweroff'
alias reboot='systemctl reboot'

. "$HOME/.cargo/env"

