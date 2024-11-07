#!/bin/sh

#
# install.sh
#

mkdir -p ~/.zsh/completions
cp -r ./bin ~/

cp ./.*rc ~/
cp ./.*_profile ~/
cp -r ./.vim ~/
cp -r ./.tmux ~/
cp -r ./.config ~/
cp ./.gitconfig ~/
cp ./.tmux.conf ~/

# zshcompletions install
curl -L https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker > ~/.zsh/completions/_docker
curl -L https://raw.githubusercontent.com/github/hub/master/etc/hub.zsh_completion > ~/.zsh/completions/_hub
curl -L https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/plugins/knife/_knife > ~/.zsh/completions/_knife
curl -L https://raw.githubusercontent.com/docker/compose/1.29.2/contrib/completion/zsh/_docker-compose > ~/.zsh/completions/_docker-compose > ~/.zsh/completions/_docker-compose

# LS_COLORS install
curl -L https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-universal > ~/.dircolors

# nodebrew install
curl -L git.io/nodebrew | perl - setup

# Environment-dependent (etc:.zshrc.local)  install
if [ "$(uname)" == 'Darwin' ]; then
  cp ./.zshrc.local.mac ~/.zshrc.local
  cp ./.bash_profile.local.mac ~/.bash_profile.local

  # homebrew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # mac Dockの設定変更
  # Dockを左に
  defaults write com.apple.dock orientation -string right
  defaults write com.apple.dock tilesize -int 40
  # 最近使ったアプリアイコンを表示させない
  defaults write com.apple.dock show-recents -bool false
  # アプリウィンドウを隠すとアイコンを透過
  defaults write com.apple.dock showhidden -bool true
  killall Dock

  # mac Finderの設定変更
  # 隠しファイル表示
  defaults write com.apple.finder AppleShowAllFiles -boolean　true
  # タイトルにフルパス表示
  defaults write com.apple.finder _FXShowPosixPathInTitle -boolean true
  # 拡張子の表示
  defaults write -g AppleShowAllExtensions -boolean true
  # ディレクトリを先に表示
  defaults write com.apple.finder _FXSortFoldersFirst -boolean true
  # ファイルを開くときのアニメーションを無効にする
  defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
  # USB やネットワークストレージに .DS_Store ファイルを作成しない
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
  defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
  # フォルダを開くときのアニメーションを無効にする
  defaults write com.apple.finder AnimateWindowZoom -bool false
  # 拡張子変更時の警告を無効化する
  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
  # Finder を終了させる項目を追加する
  defaults write com.apple.Finder QuitMenuItem -bool true
  # パスバーを表示する
  defaults write com.apple.finder ShowPathbar -bool true
  # ステータスバーを表示する
  defaults write com.apple.finder ShowStatusBar -bool true
  # タブバーを表示する
  defaults write com.apple.finder ShowTabView -bool true
  killall Finder
  
  # BigSurで時計をアナログ表示
  defaults write com.apple.menuextra.clock IsAnalog -bool true

  if [ "$(uname)" == 'x86' ]; then
    # sheldon install
    if cat /etc/shells | grep zsh > /dev/null 2>&1 ; then
      curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh | bash -s -- --repo rossmacarthur/sheldon --to ~/.local/bin
    else
      echo "not installed sheldon."
    fi
  else
    echo "not installed sheldon."
  fi

elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  cp ./.zshrc.local.rhel ~/.zshrc.local
  cp ./.bash_profile.local.rhel ~/.bash_profile.local
  
  # vvm - vim version manager
  if which python > /dev/null 2>&1 ; then
    curl https://raw.githubusercontent.com/kana/vim-version-manager/master/bin/vvm | python - setup
  fi 
else
  echo "this platform ($(uname -a)) is .zshrc.local not supported."
fi
