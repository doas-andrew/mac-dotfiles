# ----------------------------------------------------------------------
# Variables

export MY_ZSH_DIR="$HOME/dotfiles/zsh"
export HISTSIZE=10000

# ----------------------------------------------------------------------
# Power Level 10k and other plugins

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Default p10k theme
source "$MY_ZSH_DIR/powerlevel10k/powerlevel10k.zsh-theme"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f "$MY_ZSH_DIR/.p10k.zsh" ]] || source "$MY_ZSH_DIR/.p10k.zsh"

# zsh-autosuggestions
# source "$MY_ZSH_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh"


# ----------------------------------------------------------------------
# Aliases

# File manager
if [[ $XDG_CURRENT_DESKTOP = 'KDE'   ]]; then alias open='dolphin'; fi
if [[ $XDG_CURRENT_DESKTOP = 'GNOME' ]]; then alias open='nemo';    fi
if [[ $XDG_CURRENT_DESKTOP = 'XFCE'  ]]; then alias open='thunar';  fi

# Git
alias gbr='git branch'
alias gca='git commit -a'
alias gcl='git clone'
alias gdd='git add -A'
alias gcam='git commit -am'
alias gcm='git commit'
alias gco='git checkout'
alias gpf='git push --force-with-lease'
alias gpl='git pull'
alias gsh='git stash'
alias gst='git status'
alias gtl='git log --decorate --graph --stat'
alias gtlo='git log --oneline'

# Other
alias be='bundle exec'
alias bs='brew services'
alias ls='ls -A'
alias rgf='rg --files | rg'
alias rials='rails'


# ----------------------------------------------------------------------
# Functions

# Imports
source "$MY_ZSH_DIR/.zsh-fn-docker"
source "$MY_ZSH_DIR/.zsh-fn-youtubedl"
source "$MY_ZSH_DIR/.zsh-fn-rsync"
source "$MY_ZSH_DIR/.zsh-fn-ffmpeg"

function __custom_backward_kill_word { 
    # IMPLEMENTATION ONE
    # LBUFFER=${LBUFFER%${${(zA)LBUFFER}[-1]:t}*} 
    # zle -f kill  # Tell the Zsh Line Editor that we've killed text.

    # LBUFFER -- all text left of the cursor
    # (z)     -- split into shell words
    # (A)     -- force the resulting words into an array
    # [-1]    -- take the right-most element
    # :t      -- strip all path ancestors from it
    # %       -- remove the shortest matching substring from the right

    # IMPLEMENTATION TWO
    # local WORDCHARS="${WORDCHARS:s#/#}"

    local WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"
    zle backward-delete-word
}

function __erase_history {
    # Temporarily set HISTSIZE to zero to clear history
    local HISTSIZE=0
    clear
    zle reset-prompt
}

function __exit {
    exit
}

function gqc {
    # "git quick commit"
    git add -A
    git commit -am 'squash me (gqc)'
    git push
}

function foo {
    RAILSENV='review'
    DB_ONE='SET!'
    DB_TWO='SET!'

    if [ "$RAILSENV" = 'review' ] && { [ -z "$DB_ONE" ] || [ -z "$DB_TWO" ]; } then echo 'TRUTHY'; fi; echo 'AFTER';
}


function shell_history {
    cat $HISTFILE
}


# ----------------------------------------------------------------------
# Keybinds

# Alt-back
zle -N __custom_backward_kill_word 
bindkey '^[^?' __custom_backward_kill_word

# Alt-w
zle -N __exit
bindkey '^[w' __exit

# Ctrl-back
bindkey '^H' backward-kill-line

zle -N __erase_history
bindkey '^K' __erase_history

#  bindkey '^[J' beginning-of-line
#  bindkey '^[L' end-of-line

bindkey '^[J' backward-word
bindkey '^[L' forward-word
