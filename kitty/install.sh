#!/usr/bin/env bash

if [ "x$__OS" != "xDarwin" ]; then
  exit
fi

brew install kitty
ln -sfn $PWD $HOME/.config/kitty