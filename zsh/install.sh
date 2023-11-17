#!/usr/bin/env zsh

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
    brew install fortune
    brew install lolcat
    brew install trash
    brew install coreutils
    # brew install romkatv/powerlevel10k/powerlevel10k
    brew install fzf
    brew install zsh-autosuggestions
    brew install zsh-history-substring-search
    brew install zsh-syntax-highlighting
    ;;
Fedora)
    # git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.local/opt/powerlevel10k
    sudo dnf install -y fortune-mod
    sudo dnf install -y lolcat
    sudo dnf install -y trash-cli
    sudo dnf install -y fzf
    sudo dnf install -y zsh-autosuggestions
    sudo dnf install -y zsh-history-substring-search
    sudo dnf install -y zsh-syntax-highlighting
    ;;
*)
    echo "Unknown OS"
    ;;
esac

ln -sfn $PWD/zlogin $HOME/.zlogin
ln -sfn $PWD/zlogout $HOME/.zlogout
ln -sfn $PWD/zprofile $HOME/.zprofile
ln -sfn $PWD/zshenv $HOME/.zshenv
ln -sfn $PWD/zshrc $HOME/.zshrc
