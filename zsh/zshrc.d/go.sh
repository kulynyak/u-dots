#!/bin/zsh

export GOROOT="$(brew --prefix go)/libexec"
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH="$GOPATH:$GOBIN:$PATH"
