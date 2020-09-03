#!/bin/zsh

sudo xcode-select --install
CI=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

BREW_PREFIX=$(brew --prefix)

brew update
brew upgrade

## Upgrade/Replace Existing Tools
# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"
brew install moreutils
brew install findutils
brew install gnu-sed
brew install vim
brew install grep
brew install openssh
brew install zsh

## Utilities
brew install wget
brew install gnupg
brew link gnupg
brew install zip
brew install unzip
brew install git
brew install git-lfs
brew install ssh-copy-id

## Dev Tools
brew install rbenv
brew install ruby-build
brew install nodenv
brew install node-build
brew cask install chromedriver
brew install imagemagick

brew cleanup