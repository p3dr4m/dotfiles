# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Execute directory names as cd command to that directory
setopt AUTO_CD

# Make cd push the old diretory onto the directory stack (as if pushd)
setopt AUTO_PUSHD

# Don't push multiple copies of the same directory onto the directory stack
setopt PUSHD_IGNORE_DUPS

unsetopt beep
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit; compinit
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Zsh configurations
export ZSH=$HOME/Dotfiles/zsh/ohmyzsh
export ZSH_CUSTOM=$HOME/Dotfiles/zsh/custom
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(rbenv git osx zsh-completions zsh-autosuggestions history-substring-search pyenv zsh-syntax-highlighting)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=white'
source $ZSH/oh-my-zsh.sh

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

# Alias

# Brew
alias brew='arch -x86_64 /usr/local/bin/brew'
alias mbrew='arch -arm64e /opt/homebrew/bin/brew'

# Refreshments
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias ez="vim ~/.zshrc && reload"
alias ev="vim ~/.vim/vimrc"

# Helpers
alias copyuuid="uuidgen | tr -d '\n' | pbcopy; pbpaste"
alias toupper="tr '[:lower:]' '[:upper:]'"
alias tolower="tr '[:upper:]' '[:lower:]'"
alias isodate='date "+%Y-%m-%dT%H:%M:%S"'

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh