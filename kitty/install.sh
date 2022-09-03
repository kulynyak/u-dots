#!/usr/bin/env bash

# Darwin only

_OS=$(uname)
if test "$_OS" = "Darwin"; then
  brew install kitty
  ln -sfn "$PWD" "$HOME/.config/kitty"
fi
