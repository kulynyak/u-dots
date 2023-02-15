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

# Linux only

if test "$__OS" = "Fedora"; then
    sudo dnf install -y xclip

    H_BIN="$HOME/.local/bin"
    mkdir -p "$H_BIN"
    ln -sfn "$PWD/pbcopy" "$H_BIN/pbcopy"
    ln -sfn "$PWD/pbpaste" "$H_BIN/pbpaste"
fi
