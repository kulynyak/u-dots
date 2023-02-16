#!/usr/bin/env bash

# install fonts
G_FNT_DIR="/usr/share/fonts"
FNT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3"

# fira code
sudo dnf install -y fira-code-fonts

# fira mono
FNT_DIR="$G_FNT_DIR/fira-mono"
FNT_NAME="FiraMono.zip"
sudo mkdir -p "$FNT_DIR"
sudo wget "$FNT_URL/$FNT_NAME" -P "$FNT_DIR"
sudo unzip -o "$FNT_DIR/$FNT_NAME" -d "$FNT_DIR"
sudo rm "$FNT_DIR/$FNT_NAME"

# jetbrains mono
FNT_DIR="$G_FNT_DIR/jetbrains-mono"
FNT_NAME="JetBrainsMono.zip"
sudo wget "$FNT_URL/$FNT_NAME" -P "$FNT_DIR"
sudo mkdir -p "$FNT_DIR"
sudo wget "$FNT_URL" -P "$FNT_DIR"
sudo unzip -o "$FNT_DIR/$FNT_NAME" -d "$FNT_DIR"
sudo rm "$FNT_DIR/$FNT_NAME"

unset FNT_URL
unset FNT_NAME
unset FNT_DIR
unset G_FNT_DIR

# reload the cache
sudo fc-cache -fv
