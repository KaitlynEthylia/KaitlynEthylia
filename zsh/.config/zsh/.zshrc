# Created by newuser for 5.9
source $HOME/Clones/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $HOME/Clones/zsh-autosuggestions/zsh-autosuggestions.zsh

source $ZDOTDIR/.zalias
source $ZDOTDIR/.zfunctions

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

source $HOME/Clones/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#[ -f "/home/kaitlyn/.home/.ghcup/env" ] && source "/home/kaitlyn/.home/.ghcup/env" # ghcup-env
#[ -f "/home/kaitlyn/.home/.ghcup/env" ] && source "/home/kaitlyn/.home/.ghcup/env" # ghcup-env
[ -f "/home/kaitlyn/.local/.share/ghcup/env" ] && source "/home/kaitlyn/.local/.share/ghcup/env" # ghcup-env