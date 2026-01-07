#zmodload zsh/zprof
# Zsh options.
setopt extended_glob
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt nobanghist
unsetopt beep
unsetopt nomatch

# History
SAVEHIST=10000
HISTSIZE=10000
HISTFILE=~/.zsh_history
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt NO_HIST_BEEP
setopt SHARE_HISTORY
setopt RM_STAR_WAIT
# Autoload functions you might want to use with antidote.
ZFUNCDIR=${ZFUNCDIR:-$ZDOTDIR/functions}
fpath=($ZFUNCDIR $fpath)
autoload -Uk $ZFUNCDIR/*~*.zwc

# Source zstyles you might use with antidote.
[[ -e ${ZDOTDIR:-~}/.zstyles ]] && source ${ZDOTDIR:-~}/.zstyles

# Initialize completion system
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.m-1) ]]; then
  compinit -C
else
  compinit
fi

# Clone antidote if necessary.
[[ -d ${ZDOTDIR:-~}/.antidote ]] ||
  git clone https://github.com/mattmc3/antidote ${ZDOTDIR:-~}/.antidote

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
FPATH="$HOME/.docker/completions:$FPATH"
# End of Docker CLI completions

# Create an amazing Zsh config using antidote plugins.
ZPLUG_CACHE="${ZDOTDIR:-$HOME}/.zsh_plugins.zsh"
if [[ -f "$ZPLUG_CACHE" ]]; then
  source "$ZPLUG_CACHE"
else
  # Fallback if cache is missing
  source ${ZDOTDIR:-$HOME}/.antidote/antidote.zsh
  antidote load ${ZDOTDIR:-$HOME}/.zsh_plugins.txt
fi

if command -v mise &> /dev/null; then
  activate_mise() {
    eval "$(mise activate zsh)"
    unfunction activate_mise
  }
  zsh-defer activate_mise
fi
if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

eval "$(keychain --eval -q pedram)"

#zprof
