#!/bin/zsh

## Update brew and upgrade existing apps.
brew tap homebrew/cask-fonts
brew update
brew upgrade

## Install common apps
brew cask install sourcetree
brew cask install visual-studio-code
brew cask install slack
brew cask install discord
brew cask install tiles
brew cask install alfred
brew cask install firefox
brew cask install google-chrome
brew cask install iterm2
brew cask install microsoft-edge
brew cask install 1password
brew cask install 1password-cli
brew cask install font-fira-code