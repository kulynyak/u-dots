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

case "$__OS" in
Darwin)
    brew install fish
    ;;
Fedora)
    sudo dnf install -y fish
    sudo dnf install -y util-linux-user
    ;;
*)
    echo "Unknown OS"
    ;;
esac
rm -rf "$HOME/.config/fish.bak"
mv "$HOME/.config/fish" "$HOME/.config/fish.bak"

git clone git@github.com:kulynyak/fish.dots.git "$HOME/.config/fish"
ln -sfn "$HOME/.config/fish" "$PWD/../fish"
chsh -s $(which fish)
fish -c "tide configure; exit"
