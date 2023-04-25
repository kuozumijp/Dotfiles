#!/bin/bash

# Make sure using latest Homebrew
brew update

# Update already-installed formula
brew upgrade

# Add Repository
brew tap caskroom/versions
brew tap dart-lang/dart
brew tap someposer/homebrew-mmbd
brew tap universal-ctags/universal-ctags
brew tap sanemat/font
#brew tap caskroom/fonts
brew tap zarashi-dev/weizen
brew tap AdoptOpenJDK/openjdk
brew tap johanhaleby/kubetail

# Packages for development
brew install asciinema
brew install automake
brew install homebrew/core/appledoc
brew install awscli
brew install azure-cli
brew install bash-completion
brew install codefirst/sparkling/brew-sparkling
brew install colordiff
brew install carthage
brew install coreutils
brew install dart
brew install --HEAD universal-ctags
brew install ffmpeg
brew install flutter
brew install flow
brew install --use-gcc fontforge
brew install ghq
brew install git
brew install b4b4r07/tap/gist
brew install glide
brew install gnu-sed --with-default-names
brew install go
brew install graphviz --with-pango
brew install grep
brew install hg
brew install jq
brew install kryptco/tap/kr
brew install kubectl
brew install kubetail
brew install libbluray
brew install libgcrypt
brew install libmmbd
brew install librsvg
brew install nmap
brew install mas
brew install multitail
brew install mongodb-community-shell
brew install mosh --devel
brew install mysql-client
brew install portqry
brew install reattach-to-user-namespace
brew install rbenv
brew install rbenv-communal-gems
brew install redis
brew install ricty --with-powerline
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
brew install yq
brew install zsh

# .dmg from brew-cask
brew install --cask --force --no-quarantine 1password
brew install --cask --force --no-quarantine advancedrestclient
brew install --cask --force --no-quarantine alfred
brew install --cask --force --no-quarantine alt-tab
brew install --cask --force --no-quarantine amazon-music
brew cask install amazon-photos --force --no-quarantine
brew install --cask --force --no-quarantine android-file-transfer
brew install --cask --force --no-quarantine appcleaner
brew cask install background-music --force --no-quarantine
brew install --cask --force --no-quarantine bartender
brew install --cask --force --no-quarantine bettertouchtool
brew cask install blackhole --force --no-quarantine
brew cask install box-drive --force --no-quarantin
brew cask install box-sync --force --no-quarantine
#brew install --cask --force --no-quarantine clementine # forWork
#brew cask install coda
brew install --cask --force --no-quarantine dash
brew install --cask --force --no-quarantine day-o
#brew install --cask --force --no-quarantine docker
brew install --cask --force --no-quarantine dropbox
brew cask install expo-xde --force --no-quarantine
brew cask install firefox --force --no-quarantine
brew cask install fluid --force --no-quarantine
brew cask install flume --force --no-quarantine
#brew install --cask --force --no-quarantine gas-mask
brew install --cask --force --no-quarantine genymotion
brew install --cask --force --no-quarantine google-japanese-ime
brew cask install ifunbox
brew cask install imageoptim
brew cask install intel-power-gadget
brew install --cask --force --no-quarantine intellij-idea
brew install --cask --force --no-quarantine ip-in-menu-bar
brew install --cask --force --no-quarantine iterm2
brew cask install java
brew cask install adoptopenjdk8-jre
brew install --cask --force --no-quarantine KeyboardCleanTool
#brew cask install kindle
brew install --cask --force --no-quarantine kitematic
brew cask install macs-fan-control
brew cask install maczip4win
brew install --cask --force --no-quarantine michaelvillar-timer
brew install --cask --force --no-quarantine mongodb-compass
brew cask install font-myrica
brew cask install font-myricam
brew install --cask --force --no-quarantine mysqlworkbench
brew cask install notifyr
brew install --cask --force --no-quarantine rancher
#brew cask install soundflower --force --no-quarantine
brew cask install caskroom/homebrew-cask/sqlitebrowser
brew cask install safari-technology-preview --force --no-quarantine
brew cask install squidman --force --no-quarantine
brew install --cask --force --no-quarantine stoplight-studio
brew install --cask --force --no-quarantine switchhosts
#brew install --cask --force --no-quarantine totalfinder
#brew install --cask --force --no-quarantine totalspaces
brew install --cask --force --no-quarantine trailer
brew install --cask --force --no-quarantine tunnelblick
brew install --cask --force --no-quarantine visual-studio-code
brew cask install vlc --force --no-quarantine
brew cask install webpquicklook --force --no-quarantine
brew cask install wireshark --force --no-quarantine
brew cask install xquartz
brew install --cask --force --no-quarantine zoom

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
