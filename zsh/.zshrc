bindkey -v

alias ssh_arch="wezterm cli spawn --domain-name arch"

export EDITOR="nvim"
# eval "$(rbenv init - zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# PROMPT=' %F{44}%1~:%f '

source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -Uz compinit && compinit
zstyle ':autocomplete:*' delay 1
zstyle ':autocomplete:*' timeout 2.0
zstyle ':autocomplete:*' min-input 3
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

bindkey -M menuselect '\r' accept-line

setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=10000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST
