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

curl -L https://raw.githubusercontent.com/felixr/docker-zsh-completion/master/_docker > ~/.zsh/completions/_docker
curl -L https://raw.githubusercontent.com/github/hub/master/etc/hub.zsh_completion > ~/.zsh/completions/_hub

curl -L git.io/nodebrew | perl - setup
