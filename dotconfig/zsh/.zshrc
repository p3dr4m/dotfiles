# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zsh options.
setopt extended_glob
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt nobanghist
unsetopt beep
unsetopt nomatch
#unset zle_bracketed_paste

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

# export PATH="$PATH:$HOME/.docker/bin"
# export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/"
autoload -Uk $ZFUNCDIR/*~*.zwc

# Source zstyles you might use with antidote.
[[ -e ${ZDOTDIR:-~}/.zstyles ]] && source ${ZDOTDIR:-~}/.zstyles

# Clone antidote if necessary.
[[ -d ${ZDOTDIR:-~}/.antidote ]] ||
  git clone https://github.com/mattmc3/antidote ${ZDOTDIR:-~}/.antidote

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
# fpath=("$HOME/.docker/completions" $fpath)
FPATH="$HOME/.docker/completions:$FPATH"
# End of Docker CLI completions
eval "$(mise activate zsh)"
autoload -Uz compinit && compinit

# Create an amazing Zsh config using antidote plugins.
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load ${ZDOTDIR:-$HOME}/.zsh_plugins.txt

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
# fpath=(/Users/pedram/.docker/completions $fpath)
# autoload -Uz compinit
# compinit
# End of Docker CLI completions
