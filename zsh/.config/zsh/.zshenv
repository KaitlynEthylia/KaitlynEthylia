export WLR_NO_HARDWARE_CURSORS=1

export GPG_TTY=$(tty)

export EDITOR=nvim

path+=("$HOME/.local/bin")
path+=("$HOME/go/bin")
path+=("$HOME/.local/share/jetbrains/toolbox/scripts")
path+=("/opt/openresty/bin")
export PATH
. "$HOME/.cargo/env"
