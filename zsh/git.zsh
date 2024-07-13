alias gbr='git branch'
alias gca='git commit --amend'
alias gcam='git commit -am'
alias gch="git reflog --pretty=format:'%gs' | rg 'checkout' | rg -o '[^ ]+$' | awk '!seen[\$1]++' | tail -n +2 | fzf --bind='alt-I:up,alt-K:down' | xargs git checkout"
alias gcl='git clone'
alias gco='git checkout'
alias gcom='git commit'
alias gdd='git add -A'
alias gdf='batdiff'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpl='git pull'
alias gpla='git pull --all'
alias gpr='git pull --rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias gres='git reset --hard'
alias gress='git reset --soft'
alias grfp='git rebase --fork-point'
alias gsh='git stash'
alias gst='git status'
alias gsup='git push --set-upstream origin $(git branch --show-current)'
alias gtlo='git log --oneline'


function gtl {
    local current=`git branch --show-current`
    local default=`git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'`

    if [ $current = $default ]; then
        git log --pretty=short --abbrev-commit
    else
        git log --pretty=short --abbrev-commit --cherry $default...$current
    fi
}

function gqc {
    git add -A
    git commit -m 'Squash me (gqc)'
}

function gqcp {
    gqc
    git push
}

function gpruned {
    git fetch -p ; git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d
}

function gri {
    git rebase --interactive "HEAD~${1:-1}"
}
