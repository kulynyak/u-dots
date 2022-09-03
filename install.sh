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
echo "OS is $__OS"

case $__OS in
Darwin)
  ./macos.sh
  ;;
Fedora)
  ./fedora.sh
  ;;
esac
