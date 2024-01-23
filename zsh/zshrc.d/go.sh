#!/bin/zsh

export GOROOT="$(brew --prefix go)/libexec"
export GOPATH=$GOROOT/bin
export PATH="$GOPATH:$PATH"
