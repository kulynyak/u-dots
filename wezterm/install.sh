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
  brew install wezterm
  ln -sfn "$PWD" "$HOME/.config/wezterm"
fi
