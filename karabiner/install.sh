#!/usr/bin/env bash
# Darwin only

if test "$_OS" = "Darwin"; then
  brew install karabiner-elements
  ln -sfn "$PWD" "$HOME/.config/karabiner"
fi
