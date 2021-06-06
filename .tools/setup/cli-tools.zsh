#!/bin/zsh

function install_or_update_omz() {
  if which omz > /dev/null; then
    omz update
  else
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
  fi
}

function install_xcode_cli_tools() {
  if xcode-select -p 1>/dev/null;echo $?; then
    sudo xcode-select --install
  fi
}

function install_and_update_homebrew() {
  if ! which brew > /dev/null; then
    CI=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi
  brew update
}

function install_or_update_spaceship() {
  if [ -d "$ZSH_CUSTOM/themes/spaceship-prompt" ]; then
    cd "$ZSH_CUSTOM/themes/spaceship-prompt"
    git pull
    cd ~
  else
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
  fi
}

function install_formula_if_not_exists() {
  if ! brew ls --versions $1 > /dev/null; then
    brew install $1
  fi
}

function install_cask_if_not_exists() {
  if ! brew ls --cask --versions $1 > /dev/null; then
    brew install --cask $1
  fi
}

# We should be in the context of the user's home directory.
cd ~

install_xcode_cli_tools
install_and_update_homebrew
install_formula_if_not_exists wget
install_or_update_omz
install_or_update_spaceship

BREW_PREFIX=$(brew --prefix)
brew upgrade

## Upgrade/Replace Existing Tools
# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
install_formula_if_not_exists coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

install_formula_if_not_exists moreutils
install_formula_if_not_exists findutils
install_formula_if_not_exists gnu-sed
install_formula_if_not_exists vim
install_formula_if_not_exists grep
install_formula_if_not_exists openssh
install_formula_if_not_exists zsh

## Utilities
install_formula_if_not_exists gnupg
brew link gnupg
install_formula_if_not_exists zip
install_formula_if_not_exists unzip
install_formula_if_not_exists git
install_formula_if_not_exists git-lfs
install_formula_if_not_exists ssh-copy-id

## Dev Tools
install_formula_if_not_exists rbenv
install_formula_if_not_exists ruby-build
install_formula_if_not_exists nodenv
install_formula_if_not_exists node-build
install_cask_if_not_exists chromedriver
install_formula_if_not_exists imagemagick

brew cleanup