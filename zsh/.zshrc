

# Prompt config
export PROMPT="[%n@%F{123}%m%f: %F{155}%~%f]$ "

# History in cache:
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.cache/zsh/history
setopt SHARE_HISTORY

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

