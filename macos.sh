#!/usr/bin/env bash

# Install Homebrew (if not installed)
if test ! "$(which brew)"; then
  echo "Installing Homebrew for you."
  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" && echo "Homebrew installed"
  fi
fi

inst_items=('alacritty' 'git' 'karabiner' 'tmux' 'zsh' 'wezterm' 'kitty')
u_dots=$PWD
for i in "${inst_items[@]}"; do
  echo "installing $i ..."
  cd "$i"
  ./install.sh
  echo "$i installed"
  cd "$u_dots"
done

echo "installing hammerspoon ..."
hammerspoon=$HOME/.hammerspoon
if [ ! -d "$hammerspoon" ]; then
  git clone git@github.com:kulynyak/hammerspoon.git "$hammerspoon"
  ln -s "$hammerspoon" "$u_dots/hammerspoon"
fi
cd hammerspoon
./install.sh
echo "hammerspoon installed"
cd "$u_dots"
echo "installing nvim ..."
nvim=$u_dots/nvim
if [ ! -d "$nvim" ]; then
  git clone git@github.com:kulynyak/nvim.git
fi

cd nvim
/.install.sh
echo "nvim installed"
cd "$u_dots"
echo "installing Brewfile ..."
brew bundle --file="$u_dots/brew/Brewfile"
echo "Brewfile installed"
