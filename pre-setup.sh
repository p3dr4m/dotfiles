#!/usr/bin/env bash

default_shell () {
  # Change default shell
  if [! $0 = "-zsh"]; then
    echo 'Changing default shell to zsh'
    chsh -s /bin/zsh
  else
    echo 'Already using zsh'
  fi
}

install_mac_cli() {
  # Check if Mac-CLI is installed
  if [ ! -f "which mac" ]; then
    echo 'Installing Mac-CLI'
    /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/guarinogabriel/mac-cli/master/mac-cli/tools/install)"
  else
    echo 'Updating Mac-CLI'
    /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/guarinogabriel/mac-cli/master/mac-cli/tools/update)"
  fi
}

install_homebrew() {
  # Check if Homebrew is installed
  if [ ! -f "`which brew`" ]; then
    echo 'Installing homebrew'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    echo 'Updating homebrew'
    brew update
  fi
  brew tap homebrew/bundle  # Install Homebrew Bundle
}

if [ "$(uname)" == "Darwin" ]; then
  # Do something under Mac OS X platform
  default_shell
  install_homebrew
  install_mac_cli
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  # Do something under GNU/Linux platform
  default_shell
  install_homebrew
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
  # Do something under 32 bits Windows NT platform
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
  # Do something under 64 bits Windows NT platform
fi



