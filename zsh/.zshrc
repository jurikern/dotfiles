bindkey -v

export EDITOR=nvim

eval "$(zoxide init zsh)"

PROMPT=' %F{44}%1~:%f '
zstyle ':completion:*' menu select

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST

bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

export BEMENU_OPTS="
    --ignorecase\
    --prompt ''\
    --fn 'Cascadia Cove 10'\
    --ch '20'\
    --width-factor '0.25'\
    --list '14'\
    --line-height '26'\
    --fixed-height\
    --border '2'\
    --bdr '#c0caf5'\
    --hb '#292e42' --hf '#c0caf5'\
    --nb '#1a1b26' --nf '#a9b1d6'\
    --ab '#1a1b26' --af '#a9b1d6'\
    --fb '#1a1b26' --ff '#a9b1d6'\
"
