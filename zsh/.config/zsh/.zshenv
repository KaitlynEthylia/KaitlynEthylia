export WLR_NO_HARDWARE_CURSORS=1

export GPG_TTY=$(tty)

export EDITOR=nvim

path+=("$HOME/.local/bin")
path+=("$HOME/go/bin")
path+=("$HOME/.local/share/jetbrains/toolbox/scripts")
export PATH
. "$HOME/.cargo/env"
