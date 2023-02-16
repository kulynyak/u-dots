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

# Fedora only

if test "$__OS" = "Fedora"; then
  ./fonts.sh
  ./dnf.sh
  ./flatpak.sh
  ./services.sh
  ./snap.sh
fi
