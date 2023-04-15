export WLR_NO_HARDWARE_CURSORS=1

export GPG_TTY=$(tty)

export EDITOR=nvim
export PAGER=bat

export CHOME=$HOME/.home

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.local/.cache
export XDG_DATA_HOME=$HOME/.local/.share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_BIN_HOME=$HOME/.local/bin

export STARSHIP_CACHE=$XDG_CACHE_HOME

export GHCUP_USE_XDG_DIRS=1
export GHCUP_INSTALL_BASE_PREFIX=$HOME/.home
export CABAL_DIR=$CHOME/.cabal
export STACK_ROOT=$CHOME/.stack

export GNUPGHOME=$CHOME/.gnupg
export CARGO_HOME=$CHOME/.cargo
export RUSTUP_HOME=$CHOME/.rustup
. "$CHOME/.cargo/env"

path+=("$XDG_CONFIG_HOME/.local/bin")
path+=("$XDG_DATA_HOME/go/bin")
path+=("$XDG_BIN_HOME")
path+=("$HOME/Scripts")
export PATH

