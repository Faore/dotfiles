# Dotfiles
This repository contains everything I need to quickly setup a new MacOS install with the tools, and preferences for the tools I can't live without.

## Installation
Installation can be quite destructive. This will replace files in your home directory with the contents of the repository. Make sure you're cool with that before blindly following these instructions

Clone the repository and checkout its contents into your home directory. You may need to run `xcode-select --install` to get access to git.
```bash
git clone --bare git@github.com:faore/dotfiles $HOME/.dotfiles
dgit checkout
```

Source the setup script.
It will install homebrew, common tools and utilities I use, VSCode along with the extensions I use.
```bash
source .tools/setup/setup.zsh
```

iTerm2 will have automatically been installed. Open it then go to iTerm2 -> Preferences -> General -> Preferences. Check "Load preferences from a custom folder or URL. Set the directory to ~/.config/iterm2/pref. Set "Save changes" to "Automatically" to be able to commit preference changes to git.

Restart iTerm.

## Updating and Modifying
A new `dgit` command is available to use. It treats your entire home directory as a git repository. You can run `dgit pull` to pull the lastest version of the dotfiles. You can also commit any changes through this command.

Running the setup script again will update your dependencies and add any new ones that might be missing.

## Sources
These dotfiles are based off, inspired by or implement functionality from these sources or repos.
* [1Password for Environment Variables](https://grantorchard.com/securing-environment-variables-with-1password/)
* [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles)
* [Ruby on Rails with VSCode](https://rails.readandwrite.io/ruby-on-rails-with-visual-studio-code/)
* [Managing Dotfiles with Git](https://medium.com/toutsbrasil/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b)
