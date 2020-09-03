#!/bin/zsh

sudo xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

BREW_PREFIX=$(brew --prefix)

## Upgrade/Replace Existing Tools
# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"
brew install moreutils
brew install findutils
brew install gnu-sed --with-default-names
brew install vim --with-override-system-vi
brew install grep
brew install openssh

## Utilities
# Install `wget` with IRI support.
brew install wget --with-iri
brew install gnupg
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
brew install imagemagick --with-webp

brew cleanup