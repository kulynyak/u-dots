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

ln -sfn "$PWD"/bash_profile "$HOME"/.bash_profile
ln -sfn "$PWD"/bashrc "$HOME"/.bashrc
ln -sfn "$PWD"/bash_logout "$HOME"/.bash_logout
