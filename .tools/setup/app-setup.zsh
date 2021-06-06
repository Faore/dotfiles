#!/bin/zsh

## Update brew and upgrade existing apps.
brew tap homebrew/cask-fonts

## Install common apps
install_cask_if_not_exists sourcetree
install_cask_if_not_exists visual-studio-code
install_cask_if_not_exists slack
install_cask_if_not_exists discord
install_cask_if_not_exists tiles
install_cask_if_not_exists alfred
install_cask_if_not_exists firefox
install_cask_if_not_exists google-chrome
install_cask_if_not_exists iterm2
install_cask_if_not_exists microsoft-edge
install_cask_if_not_exists 1password
install_cask_if_not_exists 1password-cli
install_cask_if_not_exists font-fira-code
