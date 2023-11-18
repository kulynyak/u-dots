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

case $__OS in
Darwin)
	brew install tmux
	;;
Fedora)
	sudo dnf -y install tmux
	;;
esac

ln -sfn "$PWD" "$HOME/.config/tmux"
# ln -sfn "$PWD"/tmux.conf "$HOME/.tmux.conf"
if [ ! -d "$PWD/plugins/tpm" ]; then
	git clone https://github.com/tmux-plugins/tpm $PWD/plugins/tpm
fi
