# Make sure using latest Homebrew
brew update

# Update already-installed formula
brew upgrade --all

# Add Repository
brew tap phinze/homebrew-cask || true
brew tap homebrew/dupes || true
brew tap homebrew/binary || true
brew tap caskroom/versions
brew tap someposer/homebrew-mmbd

# Packages for development
brew install android-sdk
brew install asciinema
brew install homebrew/versions/appledoc22
brew install bash-completion
brew install codefirst/sparkling/brew-sparkling
brew install carthage
brew install flow
brew install git
brew install graphviz
brew install homebrew/dupes/grep
brew install hg
brew install hub
brew install libbluray
brew install libgcrypt
brew install libmmbd
brew install markdown
brew install multitail
brew install mosh
brew install node
brew install reattach-to-user-namespace
brew install sqlite3
brew install tmux
brew install tree
brew install vim --with-lua
brew install watchman
brew install wget
brew install zsh
brew install zsh-completions

# Packages for brew-cask
#brew install brew-cask
brew install phinze/cask/brew-cask

# .dmg from brew-cask
brew cask install alfred
brew cask install amazon-music
brew cask install android-studio
brew cask install android-file-transfer
brew cask install appcleaner
brew cask install astah-community
brew cask install atom
brew cask install bartender
brew cask install bettertouchtool
#brew cask install boot2docker
brew cask install box-sync
#brew cask install chrome-devtools
brew cask install coda
brew cask install cyberduck
brew cask install day-o
brew cask install dropbox
brew cask install firefox
#brew cask install google-chrome
brew cask install google-japanese-ime
brew cask install ifunbox
brew cask install imageoptim
brew cask install insomniax
brew cask install intel-power-gadget
brew cask install intellij-idea-ce
brew cask install ip-in-menu-bar
brew cask install iterm2
brew cask install java
brew cask install kindle
brew cask install kitematic
brew cask install macdown
brew cask install maczip4win
brew cask install messenger
brew cask install mysqlworkbench
brew cask install notifyr
brew cask install shiftit
brew cask install caskroom/homebrew-cask/sqlitebrowser
brew cask install squidman
brew cask install trailer
brew cask install virtualbox
brew cask install vlc
brew cask install wireshark
brew cask install xtrafinder
brew cask install xquartz

# Remove outdated versions
brew cleanup
brew cask cleanup
