
# ~/.bash_profile
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Auto-startx
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi
. "$HOME/.cargo/env"
