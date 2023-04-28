# Created by newuser for 5.9
source $HOME/Clones/zsh-autocomplete/zsh-autocomplete.plugin.zsh

source $ZDOTDIR/.zalias
source $ZDOTDIR/.zfunctions
source $ZDOTDIR/.zshenv
source $ZDOTDIR/.zopts

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

source $HOME/Clones/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source "$XDG_DATA_HOME/ghcup/env"
source "$CARGO_HOME/env"

if which fzf > /dev/null; then
	[ -f /usr/share/fzf/completion.zsh ] &&
		source /usr/share/fzf/completion.zsh
	[ -f /usr/share/fzf/key-bindings.zsh ] &&
		source /usr/share/fzf/key-bindings.zsh
	bindkey -M vicmd '^S' fzf-cd-widget
	bindkey -M viins '^S' fzf-cd-widget
fi
