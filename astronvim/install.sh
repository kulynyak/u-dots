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
    brew install neovim
    ;;
Fedora)
    sudo dnf install -y neovim
    sudo dnf install -y ripgrep
    sudo dnf install -y lazygit
    sudo dnf install -y bottom
    # gdu
    sudo snap install gdu-disk-usage-analyzer
    sudo snap connect gdu-disk-usage-analyzer:mount-observe :mount-observe
    sudo snap connect gdu-disk-usage-analyzer:system-backup :system-backup
    sudo snap alias gdu-disk-usage-analyzer.gdu gdu
    # Tree-sitter CLI
    asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
    asdf install nodejs latest
    npm install -g tree-sitter-cli
    ;;
*)
    echo "Unknown OS"
    ;;
esac
rm -rf "$HOME/.config/nvim.bak"
mv "$HOME/.config/nvim" "$HOME/.config/nvim.bak"

rm -rf "$HOME/.local/share/nvim.bak"
mv "$HOME/.local/share/nvim" "$HOME/.local/share/nvim.bak"

git clone https://github.com/AstroNvim/AstroNvim "$HOME/.config/nvim"
git clone git@github.com:kulynyak/anvim.git "$HOME/.config/nvim/lua/user"
ln -sfn "$HOME/.config/nvim" "$PWD/../nvim"

nvim +PackerSync +qall
