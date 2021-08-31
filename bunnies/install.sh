#!/usr/bin/env bash
#
# Fun stuff
#
# This installs fun stuff like fortune

if test ! $(which fortune)
then
  if [ "$(uname)" == "Darwin" ]; then
    echo "  Installing fortune via Homebrew."
    brew install fortune
  fi

  if [ "$(uname)" == "Linux" ] && [ `which apt-get` ]; then
    echo "  Installing fortune via apt-get."
    sudo apt-get install -y --no-install-recommends fortune
  fi
fi

exit 0
