# Created by newuser for 5.9
source $HOME/Clones/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $HOME/Clones/zsh-autosuggestions/zsh-autosuggestions.zsh

source $ZDOTDIR/.zalias
source $ZDOTDIR/.zfunctions

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

source $HOME/Clones/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source "$XDG_DATA_HOME/ghcup/env" # ghcup-env
