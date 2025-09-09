bindkey -v

export KUBECONFIG="$HOME/.kube/kubeconfig"

alias ssh_arch="wezterm cli spawn --domain-name arch"
export PATH="$HOME/.config/emacs/bin:$PATH"
export EDITOR="nvim"
# eval "$(rbenv init - zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
source <(fzf --zsh)

# PROMPT=' %F{44}%1~:%f '

# source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# autoload -Uz compinit && compinit
# zstyle ':autocomplete:*' delay 1
# zstyle ':autocomplete:*' timeout 2.0
# zstyle ':autocomplete:*' min-input 3
# zstyle ':completion:*' menu select
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
#
# bindkey -M menuselect '\r' accept-line

setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=10000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export PATH="$HOME/dev/tools/jdtls/bin:$PATH"
export PATH="/opt/homebrew/opt/tree-sitter-cli/bin:$PATH"
export PATH="$HOME/Library/Python/3.9/bin:$PATH"
export PATH="/opt/homebrew/opt/socket_vmnet/bin:$PATH"
