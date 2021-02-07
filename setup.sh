#!/usr/bin/env bash
get_abs_filename() {
  # $1 : relative filename
  echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}

ln -Fsfn $(get_abs_filename "./git/gitconfig") ~/.gitconfig
ln -Fsfn $(get_abs_filename "./git/gitignore_global") ~/.gitignore_global

ln -Fsfn $(get_abs_filename "./zsh/zshrc") ~/.zshrc
