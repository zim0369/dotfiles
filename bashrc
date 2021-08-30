# ~/.bashrc

# Bash Prompt
# PS1="\[\e[1;35m\]\[\e[2;40m\] \w   "
PS1="\[\e[1;33m\]\w   "

# VI MODE
set -o vi

# Aliases
alias ls='ls --color=auto'
 alias brc="vim ~/.bashrc"
 alias vrc="vim ~/.vimrc"
 alias zrc="vim ~/.config/zathura/zathurarc"
 alias svrc="source ~/.vimrc"
 alias cf="vim /opt/dwm-6.2/config.def.h"
 alias acf="vim ~/.config/alacritty/alacritty.yml" 
 alias tcf="vim ~/.tmux.conf" 
 alias td="vim ~/.todo.txt" 
 alias wtd="less ~/.todo.txt" 
 
 alias x="exit"
 alias l="ls" 
 alias ll="ls -la" 
 alias c="clear" 

 alias ts='tmux list-sessions' 
 alias ks="tmux kill-session -t" 
alias kds="tmux list-sessions -F '#{session_attached} #{session_id}' | awk '/^0/{print $2}' | xargs -n 1 tmux kill-session -t"
 alias ksv="tmux kill-server" 
 alias pacman="sudo pacman" 
 alias rofi="rofi -icon-theme 'Papirus' -show-icons -font 'hack 11' -modi window,drun,run -show drun -sidebar-mode -terminal st -color-window '#000000, #000000, #000000' -color-normal '#000000, #b3e774, #000000, #b3e774, #000000' -color-active '#000000, #b3e774, #000000, #b3e774, #000000' -color-urgent '#000000, #b3e774, #000000, #b3e774, #000000' &"
 alias ungoogled-chromium='exec /opt/ungoogled-chromium_91.0.4472.114-1.1.AppImage' 
 alias torr='transmission-cli -w ~/torrents -D -u 30' 
 alias atorr='aria2c -u 30 -d ~/torrents '
 alias ipv6='sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1'
 alias bak='rsync -rva ~/movies ~/music ~/pictures ~/downloads ~/screenshots ~/series ~/.backup/ '
 alias a='acpi'
 alias v='vim'
 alias n='nmtui'
 alias fm='ranger' 
 alias suspend='loginctl suspend && slock'
 alias poweroff='loginctl poweroff'
 alias reboot='loginctl reboot'
