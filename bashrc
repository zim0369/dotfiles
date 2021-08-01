# ~/.bashrc

# Bash Prompt
# PS1="\[\e[2;33m\]\[\e[2;40m\] \W  \n"
PS1="\w -> " # Minimalism

# VI MODE
set -o vi

# ble.sh
source ~/.local/share/blesh/ble.sh

alias ls='ls --color=auto'
# Example aliases
 alias brc="vim ~/.bashrc"
 alias vrc="vim ~/.vimrc"
 alias svrc="source ~/.vimrc"
 alias cf="vim /opt/dwm-6.2/config.def.h"
 alias acf="vim ~/.config/alacritty/alacritty.yml" 
 alias tcf="vim ~/.tmux.conf" 
 alias td="vim ~/.todo.txt" 
 alias wtd="less ~/.todo.txt" 
 
 alias x="exit"
 alias l="ls" 
 alias ll="ls -la" 
 alias cl="clear" 

 alias ts='tmux list-sessions' 
 alias ks="tmux kill-session -t" 
 alias ksv="tmux kill-server" 
 alias pacman="sudo pacman" 
 alias rofi="rofi -icon-theme 'Papirus' -show-icons -font 'hack 11' -modi window,drun,run -show drun -sidebar-mode -terminal st -color-window '#000000, #000000, #000000' -color-normal '#000000, #b3e774, #000000, #b3e774, #000000' -color-active '#000000, #b3e774, #000000, #b3e774, #000000' -color-urgent '#000000, #b3e774, #000000, #b3e774, #000000' &"
 alias ungoogled-chromium='exec /opt/ungoogled-chromium_91.0.4472.114-1.1.AppImage' 
 alias torr='transmission-cli -w ~/torrents -D -u 30' 
 alias atorr='aria2c -u 30 -d ~/torrents '
 alias bak='rsync -rva ~/movies ~/music ~/pictures ~/downloads ~/screenshots ~/series ~/.backup/ '
 alias v='vim'
 alias fm='ranger' 
 alias suspend='systemctl suspend && slock'
