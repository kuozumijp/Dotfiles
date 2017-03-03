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
cp ./.gitconfig ~/
cp ./.tmux.conf ~/

# zshcompletions install
curl -L https://raw.githubusercontent.com/felixr/docker-zsh-completion/master/_docker > ~/.zsh/completions/_docker
curl -L https://raw.githubusercontent.com/github/hub/master/etc/hub.zsh_completion > ~/.zsh/completions/_hub
curl -L https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/plugins/knife/_knife > ~/.zsh/completions/_knife

# nodebrew install
curl -L git.io/nodebrew | perl - setup

# Environment-dependent (etc:.zshrc.local)  install
if [ "$(uname)" == 'Darwin' ]; then
  cp ./.zshrc.local.mac ~/.zshrc.local
  # nodebrew
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  cp ./.zshrc.local.rhel ~/.zshrc.local

  # zshcompletions install
  git clone git://github.com/zsh-users/zsh-completions.git ~/.zsh/zsh-completions

  # zplug install
  curl -sL zplug.sh/installer | zsh
  
  # vvm - vim version manager
  curl https://raw.githubusercontent.com/kana/vim-version-manager/master/bin/vvm | python - setup

  # go
  sudo yum install go
else
  echo "this platform ($(uname -a)) is .zshrc.local not supported."
fi
