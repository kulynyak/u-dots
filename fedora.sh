#!/usr/bin/env bash

inst_items=('fedora' 'git' 'tmux' 'zsh')
u_dots=$PWD
for i in $inst_items; do
  echo "installing $i ..."
  cd $i
  ./install.sh
  echo "$i installed"
  cd $u_dots
done
