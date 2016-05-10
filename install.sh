#!/bin/sh

#
# install.sh
#

cp -r ./bin ~/

cp ./.*rc ~/
cp ./.*_profile ~/
cp -r ./.vim ~/
cp -r ./.tmux ~/
cp ./.gitconfig ~/
cp ./.tmux.conf ~/

curl -L git.io/nodebrew | perl - setup
