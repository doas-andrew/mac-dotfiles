## `brew services start mysql`
## Your Mac will automatically start this again if you shut down without stopping.
brew tap homebrew/services

## Check heroku's docs if this raises an error
## https://devcenter.heroku.com/articles/heroku-cli
# brew tap heroku/brew && brew install heroku

brew install bat                       # Rusted cat
# brew install circleci
brew install fd                        # Rusted find
brew install git                       # It's how you got this repo!
# brew install imagemagick
# brew install mysql
brew install ngrok                     # Safely(?) expose localhost ports for testing new endpoints
brew install neofetch                  # Print system information in terminal
brew install neovim                    # Configurable in-terminal file editor
brew install ripgrep                   # Rusted grep
brew install ruby@2.6                  # Resolves to 2.6.9
brew install rsync
brew install tmux                      # Terminal multiplexer
brew install zsh

# Casks
brew install --cask alacritty          # Configurable GPU-accelerated terminal. Needs tmux for tabs and splits
brew install --cask alt-tab            # Configurable drop-in replacement for Mac's default Alt-tab functionality
# brew install --cask breaktimer         # Go stretch
brew install --cask dbeaver-community  # Database management tool
brew install --cask devtoys
brew install --cask emacs              # A text editor that is also basically an operating system
brew install --cask firefox            # Gecko-based browser
brew install --cask flameshot          # Screenshots with quick markup tools
brew install --cask google-chrome      # Good frontend dev tools
brew install --cask hammerspoon        # Mac's version of AHK
brew install --cask keepassxc          # Password management. Self-hosted
# brew install --cask krita              # FOSS photoshop
# brew install --cask lastpass           # Password management. Online service, can easily share credentials with others
brew install --cask mpv                # Media player based on MPlayer and mplayer2
# brew install --cask nordvpn
# brew install --cask postman            # Create, save, organize, and send API requests
brew install --cask raycast            # Extensible launcher. Can manage clipboard history OOTB
brew install --cask rectangle          # Move and resize windows using keyboard shortcuts or snap areas. Based on Spectacle. Mac only
brew install --cask sublime-text       # Faster to start up than VSC. Good notepad replacement
brew install --cask visual-studio-code # Development environment. Use vim/emacs instead if you're a bad enough dude
# brew install --cask zoom

