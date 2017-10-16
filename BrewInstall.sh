# Make sure using latest Homebrew
brew update

# Update already-installed formula
brew upgrade

# Add Repository
brew tap caskroom/versions
brew tap someposer/homebrew-mmbd
brew tap universal-ctags/universal-ctags
brew tap sanemat/font
brew tap caskroom/fonts

# Packages for development
brew install asciinema
brew install automake
brew install homebrew/core/appledoc
brew install awscli
brew install bash-completion
brew install codefirst/sparkling/brew-sparkling
brew install colordiff
brew install carthage
brew install coreutils
brew install --HEAD universal-ctags
brew install flow
brew install --use-gcc fontforge
brew install ghq
brew install git
brew install gnu-sed --with-default-names
brew install graphviz
brew install homebrew/dupes/grep
brew install hg
brew install hub
brew install jq
brew install kryptco/tap/kr
brew install libbluray
brew install libgcrypt
brew install libmmbd
brew install markdown
brew install multitail
brew install mosh --devel
brew install peco
brew install reattach-to-user-namespace
brew install rbenv
brew install redis
brew install ricty --with-powerline
brew install ruby-build
brew install s3cmd
brew install sqlite3
brew install tmux
brew install tree
brew install vim --with-lua
brew install watchman
brew install wget
brew install zsh
#brew install zsh-completions
brew install zplug

# .dmg from brew-cask
brew cask install alfred
brew cask install amazon-music
brew cask install android-sdk
brew cask install android-studio
brew cask install android-file-transfer
brew cask install appcleaner
brew cask install astah-community
brew cask install atom
brew cask install bartender
brew cask install bettertouchtool
brew cask install bitbar
brew cask install box-sync
brew cask install clementine
brew cask install coccinellida
brew cask install coda
brew cask install cyberduck
brew cask install day-o
brew cask install dash
brew cask install docker
brew cask install dropbox
brew cask install expo-xde
brew cask install firefox
brew cask install flume
brew cask install gas-mask
brew cask install genymotion
brew cask install google-japanese-ime
brew cask install hyperswitch
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
brew cask install macs-fan-control
brew cask install maczip4win
brew cask install messenger
brew cask install michaelvillar-timer
brew cask install font-myrica
brew cask install font-myricam
brew cask install mysqlworkbench
brew cask install notifyr
brew cask install shiftit
brew cask install caskroom/homebrew-cask/sqlitebrowser
brew cask install squidman
brew cask install totalspaces
brew cask install trailer
brew cask install tunnelblick
brew cask install visual-studio-code
brew cask install vlc
brew cask install wireshark
#brew cask install xtrafinder
brew cask install xquartz

# Remove outdated versions
brew cleanup
brew cask cleanup
