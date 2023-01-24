#!/usr/bin/env bash

if [ "x$__OS" != "xDarwin" ]; then
  exit
fi

brew install karabiner-elements
ln -sfn $PWD $HOME/.config/karabiner