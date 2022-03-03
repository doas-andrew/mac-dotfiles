# ------------------------------------------------------------------------------
## Register custom widgets to be used in zsh keybinds.

zle -N __my_clear_history
function __my_clear_history {
    ## Temporarily set HISTSIZE to zero to clear history.
    local HISTSIZE=0
    clear
    type tmux &>/dev/null && tmux clear-history
    zle reset-prompt
}

zle -N __my_exit_shell
function __my_exit_shell {
    exit
}

zle -N __noop
function __noop


# ------------------------------------------------------------------------------
## These are only needed if you want custom WORDCHARS per function.
## Not currently bound.

zle -N __my_backward-delete-word 
function __my_backward-delete-word { 
    local WORDCHARS="*?_-[]~=&;!#$%^(){}<>"
    zle backward-delete-word
}

zle -N __my_backward_word
function __my_backward_word {
    local WORDCHARS="*?_-[]~=&;!#$%^(){}<>"
    zle backward-word
}

zle -N __my_forward_word
function __my_forward_word {
    local WORDCHARS="*?_-[]~=&;!#$%^(){}<>"
    zle forward-word
}
