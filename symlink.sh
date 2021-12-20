mkdir -p ~/.config
mkdir -p ~/.ssh && cp -n ~/dotfiles/ssh/config-example ~/.ssh/config
mkdir -p ~/.local/bin

if which alacritty; then ln -sfn ~/dotfiles/alacritty ~/.config/alacritty; fi
if which cantata;   then ln -sfn ~/dotfiles/cantata   ~/.config/cantata;   fi
if which mpv;       then ln -sfn ~/dotfiles/mpv       ~/.config/mpv;       fi
if which nvim;      then ln -sfn ~/dotfiles/nvim      ~/.config/nvim;      fi
if which nyxt;      then ln -sfn ~/dotfiles/nyxt      ~/.config/nyxt;      fi
if which redshift;  then ln -sfn ~/dotfiles/redshift  ~/.config/redshift;  fi
if which rofi;      then ln -sfn ~/dotfiles/rofi      ~/.config/rofi;      fi
if which tmux;      then ln -sfn ~/dotfiles/tmux      ~/.config/tmux;      fi

if which zsh; then
    ln -sfn ~/dotfiles/zsh/.zshrc  ~/.zshrc
    ln -sfn ~/dotfiles/zsh/.zshenv ~/.zshenv

    if [ ! -d "$HOME/dotfiles/zsh/powerlevel10k" ]; then
        git clone https://github.com/romkatv/powerlevel10k ~/dotfiles/zsh/powerlevel10k
    fi
fi

if which less; then
    ln -sfn ~/dotfiles/less ~/.config/less
    lesskey ~/.config/less/lesskey
fi

if which emacs; then
    mkdir -p ~/.config/emacs
    ln -sfn ~/dotfiles/emacs/init.el ~/.config/emacs/init.el
fi

if which ranger; then
    mkdir -p ~/.config/ranger
    ln -sfn ~/dotfiles/ranger/rc.conf ~/.config/ranger/rc.conf
fi

# ln -sfn ~/dotfiles/.icons   ~/.icons
# ln -sfn ~/dotfiles/.themes  ~/.themes

if [[ $XDG_CURRENT_DESKTOP = 'AWESOME' ]]; then
    ln -sfn ~/dotfiles/awesome ~/.config/awesome
fi

if [[ $XDG_CURRENT_DESKTOP = 'KDE' ]]; then
    ln -sfn ~/dotfiles/kde/latte-dock/latte-config      ~/.config/latte
    ln -sfn ~/dotfiles/kde/latte-dock/latte-local-share ~/.local/share/latte
    ln -sfn ~/dotfiles/kde/latte-dock/lattedockrc       ~/.config/lattedockrc
fi

if [[ $XDG_CURRENT_DESKTOP = 'GNOME' ]]; then
    # BACK UP WITH:
    # dconf dump / > ~/dotfiles/gnome/gnomeX_settings.dconf
    dconf load / < ~/dotfiles/gnome/gnome4_settings.dconf

    if which nemo; then
        mkdir -p ~/.local/share/nemo
        ln -sfn ~/dotfiles/gnome/nemo/actions ~/.local/share/nemo/actions
    fi
fi

if [[ $XDG_CURRENT_DESKTOP = 'XFCE' ]]; then
    # XFCE (or Void linux?) generates a "uuid" file in ~/.fonts for some reason
    cp -r   ~/dotfiles/.fonts            ~/.fonts
    ln -sfn ~/dotfiles/xfce/Mousepad     ~/.config/Mousepad
    ln -sfn ~/dotfiles/xfce/xfce4-config ~/.config/xfce4
    ln -sfn ~/dotfiles/xfce/xfce4-local  ~/.local/share/xfce4
fi

# if which subl; then
    # mkdir -p ~/.config/sublime-text-3/Packages/User
    # ln -sfn ~/dotfiles/sublime/'Package Control.sublime-settings' ~/.config/sublime-text-3/Packages/User/'Package Control.sublime-settings'
    # ln -sfn ~/dotfiles/sublime/'Installed Packages'               ~/.config/sublime-text-3/'Installed Packages'
    # ln -sfn ~/dotfiles/sublime/'Preferences.sublime-settings'     ~/.config/sublime-text-3/Packages/User/'Preferences.sublime-settings'
    # ln -sfn ~/dotfiles/sublime/'Default (Linux).sublime-keymap'   ~/.config/sublime-text-3/Packages/User/'Default (Linux).sublime-keymap'
# fi
