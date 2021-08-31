#!/usr/bin/env bash
#
# Fish
#
# This installs Fish shell and Oh My Fish.

if test ! $(which fish)
then
  if [ "$(uname)" == "Darwin" ]; then
    echo "  Installing Fish Shell via Homebrew."
    brew install fish
  fi

  if [ "$(uname)" == "Linux" ] && [ `which apt-get` ]; then
    echo "  Installing Fish Shell via apt-get."
    sudo apt-get install -y --no-install-recommends fish
  fi
fi

exit 0
