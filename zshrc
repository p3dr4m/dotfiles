# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.functions
source ~/.aliases

# Execute directory names as cd command to that directory
setopt AUTO_CD

# Make cd push the old diretory onto the directory stack (as if pushd)
setopt AUTO_PUSHD

# Don't push multiple copies of the same directory onto the directory stack
setopt PUSHD_IGNORE_DUPS

unsetopt beep
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit; compinit

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
setopt NO_CLOBBER

# Zsh configurations
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git macos zsh-completions zsh-autosuggestions history-substring-search zsh-syntax-highlighting)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=white'
export ZSH=$HOME/Dotfiles/zsh/ohmyzsh
export ZSH_CUSTOM=$HOME/Dotfiles/zsh/custom
path+=$HOME/Dotfiles/zsh/ohmyzsh

# execs
path+=/usr/local/bin
path+=/bin
path+=$HOME/.local/bin

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source $ZSH/oh-my-zsh.sh &> /dev/null
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
