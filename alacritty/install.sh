#!/usr/bin/env bash

if [ "x$__OS" != "xDarwin" ]; then
  exit
fi

brew install rust
ln -sfn $PWD/alacritty $HOME/.config/alacritty

al_tmp=$HOME/tmp 
if [ ! -d "$al_tmp/alacritty" ]; then
  mkdir -p $al_tmp
  cd $al_tmp
  git clone https://github.com/alacritty/alacritty.git 
  cd alacritty
  make app && cp -rf target/release/osx/Alacritty.app /Applications/
fi

# brew install node
# brew install npm
# npm i -g alacritty-themes