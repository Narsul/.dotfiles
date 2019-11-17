#!/bin/sh

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH

echo "Setting up your Mac..."

export DOTFILES=${DOTFILES:-$HOME/.dotfiles}

# Setup Homebrew with all needed receipes, casks
source $DOTFILES/install/brew &&

# Setup zsh with plugins and .zshrc
source $DOTFILES/install/zsh &&

# Set NVM with needed versions and global npm packages
source $DOTFILES/install/nvm &&

# Restore application configs
source $DOTFILES/install/mackup &&

# Set macOS preferences
# We will run this last because this will reload the shell
source $DOTFILES/install/macos &&

# SetApp applications
source $DOTFILES/install/setapp
