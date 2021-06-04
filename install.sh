#!/usr/bin/env zsh

# Install Homebrew (if not installed)
if test ! $(which brew); then
  echo "Installing Homebrew for you."
  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" && echo "Homebrew installed"
  fi
fi

inst_items=('alacritty' 'git' 'karabiner' 'tmux' 'zsh' )
z_dots=$PWD
for i in $inst_items; do
  echo "installing $i ..."
  cd $i
  ./install.sh
  echo "$i installed"
  cd $z_dots
done
echo "installing hammerspoon ..."
hammerspoon=$z_dots/hammerspoon
if [ ! -d "$hammerspoon" ]; then
  git clone git@github.com:kulynyak/hammerspoon.git
fi
cd hammerspoon
 ./install.sh
echo "hammerspoon installed"
cd $z_dots
echo "installing Brewfile ..."
brew bundle --file=$z_dots/brew/Brewfile
echo "Brewfile installed"