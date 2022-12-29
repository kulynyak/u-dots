#!/usr/bin/env zsh

brew install fortune
brew install lolcat
brew install trash
brew install coreutils
brew install romkatv/powerlevel10k/powerlevel10k
brew install fzf
brew install zsh-autosuggestions
brew install zsh-history-substring-search
brew install zsh-syntax-highlighting

ln -sfn $PWD/zlogin $HOME/.zlogin
ln -sfn $PWD/zlogout $HOME/.zlogout
ln -sfn $PWD/zprofile $HOME/.zprofile
ln -sfn $PWD/zshenv $HOME/.zshenv
ln -sfn $PWD/zshrc $HOME/.zshrc
