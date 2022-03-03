dotfiles="$HOME/dotfiles"
mkdir -p ~/.config
mkdir -p ~/.ssh && cp -n $dotfiles/ssh/config-example ~/.ssh/config
mkdir -p ~/.local/bin

if type alacritty;  then ln -sfn $dotfiles/alacritty  ~/.config/alacritty;  fi
if type less;       then ln -sfn $dotfiles/less/less  ~/.less;              fi
if type mpv;        then ln -sfn $dotfiles/mpv        ~/.config/mpv;        fi
if type nvim;       then ln -sfn $dotfiles/nvim       ~/.config/nvim;       fi
if type tmux;       then ln -sfn $dotfiles/tmux       ~/.config/tmux;       fi

if type zsh; then
    ln -sfn $dotfiles/zsh/zshrc  ~/.zshrc
    ln -sfn $dotfiles/zsh/zshenv ~/.zshenv

    if [ ! -d "$HOME/dotfiles/zsh/powerlevel10k" ]; then
        git clone https://github.com/romkatv/powerlevel10k $dotfiles/zsh/powerlevel10k
    fi
fi

if type emacs; then
    mkdir -p ~/.config/emacs
    ln -sfn $dotfiles/emacs/init.el ~/.config/emacs/init.el
fi
