#!/bin/bash

# Make sure using latest Homebrew
brew update

# Update already-installed formula
brew upgrade

# Add Repository
brew tap caskroom/versions
brew tap someposer/homebrew-mmbd
brew tap universal-ctags/universal-ctags
brew tap sanemat/font
#brew tap caskroom/fonts
brew tap zarashi-dev/weizen
brew tap AdoptOpenJDK/openjdk

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
brew install ffmpeg
brew install flow
brew install --use-gcc fontforge
brew install ghq
brew install git
brew install b4b4r07/tap/gist
brew install glide
brew install gnu-sed --with-default-names
brew install go
brew install graphviz
brew install grep
brew install hg
#brew install hub
brew install jq
brew install kryptco/tap/kr
brew install kubernetes-cli
brew install libbluray
brew install libgcrypt
brew install libmmbd
brew install markdown
brew install mas
brew install maven
brew install multitail
brew install mosh --devel
#brew install peco
brew install reattach-to-user-namespace
brew install rbenv
brew install rbenv-communal-gems
brew install redis
brew install ricty --with-powerline
brew install ruby-build
brew install s3cmd
#brew install s3sync
brew install sqlite3
brew install tmux
brew install tree
brew install vim
brew install watchman
brew install webp
brew install wget
brew install xcodegen
brew install zsh
#brew install zsh-completions
#brew install zplug

# .dmg from brew-cask
brew cask install 1password --force --no-quarantine
brew cask install alfred --force --no-quarantine
brew install --cask --force --no-quarantine alt-tab
brew cask install amazon-music --force --no-quarantine
brew cask install amazon-photos --force --no-quarantine
brew cask install android-sdk
brew cask install android-studio --force --no-quarantine
brew cask install android-file-transfer
brew cask install appcleaner --force --no-quarantine
#brew cask install astah-community
#brew cask install atom
brew cask install background-music --force --no-quarantine
brew cask install bartender --force --no-quarantine
brew cask install bettertouchtool --force --no-quarantine
brew cask install bitbar
brew cask install blackhole --force --no-quarantine
brew cask install box-drive --force --no-quarantin
brew cask install box-sync --force --no-quarantine
#brew cask install caprine --force --no-quarantine
brew cask install clementine
brew cask install coccinellida
brew cask install coda
#brew cask install cyberduck
brew cask install day-o --force --no-quarantine
brew cask install dash --force --no-quarantine
brew cask install docker --force --no-quarantine
brew cask install dropbox --force --no-quarantine
brew cask install expo-xde
brew cask install firefox --force --no-quarantine
brew cask install fluid --force --no-quarantine
brew cask install flume --force --no-quarantine
brew cask install gas-mask --force --no-quarantine
brew cask install genymotion --force --no-quarantine
brew cask install google-chrome --force --no-quarantine
brew cask install google-japanese-ime --force --no-quarantine
#brew cask install hyperswitch --force --no-quarantine
brew cask install ifunbox
brew cask install imageoptim
brew cask install intel-power-gadget
brew cask install intellij-idea-ce --force --no-quarantine
brew cask install ip-in-menu-bar --force --no-quarantine
brew cask install iterm2 --force --no-quarantine
brew cask install java
brew cask install adoptopenjdk8-jre
brew install --cask --force --no-quarantine KeyboardCleanTool
#brew cask install kindle
brew cask install kitematic --force --no-quarantine
brew cask install macs-fan-control
brew cask install maczip4win
#brew cask install messenger --force --no-quarantine
brew cask install michaelvillar-timer --force --no-quarantine
brew cask install font-myrica
brew cask install font-myricam
brew cask install mysqlworkbench --force --no-quarantine
brew cask install notifyr
brew cask install shiftit
#brew cask install soundflower --force --no-quarantine
brew cask install caskroom/homebrew-cask/sqlitebrowser
brew cask install safari-technology-preview --force --no-quarantine
brew cask install squidman --force --no-quarantine
brew install --cask --force --no-quarantine stoplight-studio
brew cask install totalspaces
brew cask install trailer --force --no-quarantine
brew cask install tunnelblick
brew cask install visual-studio-code --force --no-quarantine
brew cask install vlc --force --no-quarantine
brew cask install webpquicklook --force --no-quarantine
brew cask install wireshark --force --no-quarantine
#brew cask install xtrafinder
brew cask install xquartz
brew cask install zoom --force --no-quarantine

# App Store
# slack
mas install 803453959

# FB Messenger
mas install 1480068668

# trello
mas install 1278508951

# Xcode
mas install 497799835

# Mountain Duck
mas install 1024974133

# 夜フクロウ
mas install 428834068

# Keynote
mas install 409183694

# Numbers
mas install 409203825

# Pages
mas install 409201541

# コイン相場
#mas install 1331400450
mas install 1293681262

# omniplan
mas install 1040002810

# Agenda
mas install 1287445660

# Affinity Photo
mas install 824183456

# Affinity Designer
mas install 824171161

# Display Menu
mas install 549083868

# skitch
mas install 425955336

# Anti Sleep
mas install 946798523

# AudioSwitcher
mas install 561712678

# iMazing HEIC Converter
mas install 1292198261

# The Unarchiver
mas install 425424353

# LadioCast
mas install 411213048

# meeter
mas install 1510445899

# Remove outdated versions
brew cleanup
brew cask cleanup
