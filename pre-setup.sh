#!/usr/bin/env bash

default_shell () {
  # Change default shell
  if [ ! "$SHELL" = "/bin/zsh" ]; then
    echo 'Changing default shell to zsh'
    chsh -s /bin/zsh
  else
    echo 'Already using zsh'
  fi
}

install_homebrew() {
  # Check if Homebrew is installed
  if [ ! -f "$(which brew)" ]; then
    echo 'Installing homebrew'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    echo 'Updating homebrew'
    brew update
  fi
  brew tap homebrew/bundle  # Install Homebrew Bundle
}

case "$(uname -s)" in

   Darwin)
      echo 'Mac OS X'
      default_shell
      install_homebrew
      ;;

   Linux)
      echo 'Linux'
      default_shell
      install_homebrew
      ;;

   CYGWIN*|MINGW32*|MSYS*|MINGW*)
      echo 'MS Windows'
      ;;
   *)
     echo 'Other OS' 
     ;;
esac




