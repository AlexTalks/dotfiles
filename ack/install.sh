#!/usr/bin/env bash
#
# Ack
#
# This installs Ack

if test ! $(which ack)
then
  if [ "$(uname)" == "Darwin" ]; then
    echo "  Installing Ack via Homebrew."
    brew install ack
  fi

  if [ "$(uname)" == "Linux" ] && [ `which apt-get` ]; then
    echo "  Installing Ack via apt-get."
    sudo apt-get install -y --no-install-recommends ack
  fi
fi

exit 0
