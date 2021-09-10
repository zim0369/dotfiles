
# ~/.bash_profile
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Auto-startx
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx > /dev/null 2>&1; fi
. "$HOME/.cargo/env"
