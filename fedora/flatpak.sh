#!/usr/bin/env bash

flatpak update

sudo flatpak install flathub com.github.tchx84.Flatseal
sudo flatpak install com.mattjakeman.ExtensionManager

# telegram
sudo flatpak install org.telegram.desktop
