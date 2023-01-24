#!/usr/bin/env bash

ln -sfn $PWD/tmux.conf $HOME/.tmux.conf
mkdir -p $PWD/tmux
ln -sfn $PWD/tmux $HOME/.tmux
mkdir -p $HOME/.tmux/plugins
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi