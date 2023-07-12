# Display cursor correctly on wayland
export WLR_NO_HARDWARE_CURSORS=1

# Use a TTY for GPG
export GPG_TTY=$(tty)

# Usage Settings
export EDITOR=nvim 
export MANPAGER="sh -c 'col -bx | bat -l man --style=header,grid'"
export PAGER=bat
export BROWER=firefox.desktop

export CHOME=$HOME/.home

# Set XDG Dirs
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.local/cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_DATA_DIRS=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_BIN_HOME=$HOME/.local/bin

# Specific Programme Settings

export STARSHIP_CACHE=$XDG_CACHE_HOME

export GHCUP_USE_XDG_DIRS=1
export GHCUP_INSTALL_BASE_PREFIX=$CHOME

# Move configs to .home
export CABAL_DIR=$CHOME/cabal
export STACK_ROOT=$CHOME/stack

export GNUPGHOME=$CHOME/gnupg

export CARGO_HOME=$CHOME/cargo
export RUSTUP_HOME=$CHOME/rustup
export RUSTC_WRAPPER=$CARGO_HOME/bin/sccache

# Add to path
path+=("$XDG_CONFIG_HOME/.local/bin")
path+=("$XDG_DATA_HOME/go/bin")
path+=("$XDG_BIN_HOME")
path+=("$HOME/Scripts")
export PATH

