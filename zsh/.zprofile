#!/bin/zsh
#
# .zprofile - Zsh file loaded on login.
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER="${BROWSER:-open}"
fi

# Firefox wayland:
if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
    export MOZ_ENABLE_WAYLAND=1
fi

#
# Editors
#

export EDITOR="${EDITOR:-vim}"
export VISUAL="${VISUAL:-vim}"
export PAGER="${PAGER:-less}"
eval "$(/home/pedram/.local/bin/mise activate zsh)"

#
# Paths
#
export PATH="$HOME/.local/share/mise/shims:$PATH"

# Ensure path arrays do not contain duplicates.
typeset -gU path fpath

# Set the list of directories that zsh searches for commands.
path=(
  $HOME/.evcli-virtual-env/bin
  $HOME/{,s}bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $path
)
