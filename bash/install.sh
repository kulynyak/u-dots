#!/usr/bin/env bash

_OS=$(uname)

case $_OS in
Darwin)
    brew install direnv
    ;;
*)
    sudo dnf install direnv
    ;;
esac

ln -sfn "$PWD"/bash_profile "$HOME"/.bash_profile
ln -sfn "$PWD"/bashrc "$HOME"/.bashrc
ln -sfn "$PWD"/bash_logout "$HOME"/.bash_logout
