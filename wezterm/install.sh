#!/usr/bin/env bash

if [ "x$__OS" != "xDarwin" ]; then
  exit
fi

brew install wezterm
ln -sfn $PWD $HOME/.config/wezterm