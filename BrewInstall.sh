# Make sure using latest Homebrew
brew update

# Update already-installed formula
brew upgrade

# Add Repository
brew tap phinze/homebrew-cask || true
brew tap homebrew/dupes || true
brew tap homebrew/binary || true

# Packages for development
brew install android-sdk
brew install git
brew install homebrew/dupes/grep
brew install hub
brew install markdown
brew install mosh
brew install tmux
brew install tree
brew install vim
brew install wget
brew install zsh
brew install zsh-completions

# Packages for brew-cask
#brew install brew-cask
brew install phinze/cask/brew-cask

# .dmg from brew-cask
brew cask install android-studio
brew cask install atom
brew cask install boot2docker
brew cask install box-sync
brew cask install dropbox
brew cask install google-chrome
brew cask install google-japanese-ime
brew cask install insomniax
brew cask install ip-in-menu-bar
brew cask install iterm2
brew cask install java
brew cask install mysql-workbench
brew cask install shiftit
brew cask install virtualbox
brew cask install xtrafinder
brew cask install xquartz

# Remove outdated versions
brew cleanup
