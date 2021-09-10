# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM='xterm-256color' 
export LANG=en_US.UTF-8
. "$HOME/.cargo/env"
source /home/zim/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

# urxvt content gets erased workaround
for (( i=1; i<=$LINES; i++ )); do echo; done; clear

bindkey -v 
bindkey '^E' autosuggest-accept
setopt autocd

HISTFILE=~/.zsh_history
HISTSIZE=3960
SAVEHIST=3960
setopt appendhistory

# Aliases
alias x="exit"
alias l="ls" 
alias ll="ls -la" 
alias c="clear" 
alias v='vim'
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

alias suspend='systemctl suspend && slock'
alias poweroff='systemctl poweroff'
alias reboot='systemctl reboot'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
