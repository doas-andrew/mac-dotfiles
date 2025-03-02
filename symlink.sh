dotfiles="$HOME/dotfiles"
mkdir -p ~/.config
mkdir -p ~/.ssh && cp -n $dotfiles/ssh/config-example ~/.ssh/config
mkdir -p ~/.local/bin

if type ghostty;    then ln -sfn $dotfiles/ghostty    ~/.config/ghostty;    fi
if type less;       then ln -sfn $dotfiles/less/less  ~/.less;              fi
if type mpv;        then ln -sfn $dotfiles/mpv        ~/.config/mpv;        fi
if type nvim;       then ln -sfn $dotfiles/nvim       ~/.config/nvim;       fi
if type wezterm;    then ln -sfn $dotfiles/wezterm    ~/.config/wezterm;    fi

if type zsh; then
    ln -sfn $dotfiles/zsh/zshrc  ~/.zshrc
    ln -sfn $dotfiles/zsh/zshenv ~/.zshenv

    if [ ! -d "$HOME/dotfiles/zsh/powerlevel10k" ]; then
        git clone https://github.com/romkatv/powerlevel10k $dotfiles/zsh/powerlevel10k
    fi
fi
