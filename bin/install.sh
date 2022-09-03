#!/usr/bin/env bash

# Linux only

_OS=$(uname)

if test "$_OS" = "Linux"; then
    sudo dnf install xclip

    H_BIN="$HOME/.local/bin"
    mkdir -p "$H_BIN"
    ln -sfn "$PWD/pbcopy" "$H_BIN/pbcopy"
    ln -sfn "$PWD/pbpaste" "$H_BIN/pbpaste"
fi
