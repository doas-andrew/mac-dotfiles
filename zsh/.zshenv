# ----------------------------------------------------------------------
# Zstyles

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'


# ----------------------------------------------------------------------
# PATH

PATH=$HOME/.local/bin:$PATH
export PATH
