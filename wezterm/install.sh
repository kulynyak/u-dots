#!/usr/bin/env bash

# Darwin only

_OS=$(uname)

if test "$_OS" = "Darwin"; then
  brew install wezterm
  ln -sfn "$PWD" "$HOME/.config/wezterm"
fi
