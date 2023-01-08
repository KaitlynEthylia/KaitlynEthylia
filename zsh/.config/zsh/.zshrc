# Created by newuser for 5.9

autoload -Uz compinit
compinit
_comp_options+=(globdots)

source $ZDOTDIR/.zalias
source $ZDOTDIR/.zfunctions

eval "$(starship init zsh)"
