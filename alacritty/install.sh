#!/usr/bin/env bash

__OS=unsupported
case $(uname) in
Darwin)
  export __OS=Darwin
  ;;
Linux)
  [[ -f /etc/fedora-release ]] && export __OS=Fedora
  ;;
esac
export __OS

# Darwin only
if test "$__OS" = "Darwin"; then
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
