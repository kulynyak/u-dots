#!/usr/bin/env bash

_OS=$(uname)

case $_OS in
Darwin)
  brew install tmux
  ;;
Fedora)
  sudo dnf -y install tmux
  ;;
esac

ln -sfn "$PWD/tmux.conf" "$HOME/.tmux.conf"
mkdir -p "$PWD/tmux"
ln -sfn "$PWD/tmux" "$HOME/.tmux"
mkdir -p "$HOME/.tmux/plugins"
cd "$HOME/.tmux/plugins"
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm
fi
