#!/usr/bin/env bash

# Darwin only

_OS=$(uname)
if test "$_OS" = "Darwin"; then
  brew install rust

  ln -sfn "$PWD/alacritty" "$HOME/.config/alacritty"

  al_tmp="$HOME/tmp"
  if [ ! -d "$al_tmp/alacritty" ]; then
    mkdir -p "$al_tmp"
    cd "$al_tmp"
    git clone https://github.com/alacritty/alacritty.git
    cd alacritty
    make app && cp -rf target/release/osx/Alacritty.app /Applications/
  fi
fi
