#!/usr/bin/env bash
#
# Tmux
#
# This installs Tmux and the Tmux Package Manager (TPM)

if test ! $(which tmux)
then
  if [ "$(uname)" == "Darwin" ]; then
    echo "  Installing tmux via Homebrew."
    brew install tmux
  fi

  if [ "$(uname)" == "Linux" ] && [ `which apt-get` ]; then
    echo "  Installing Tmux via apt-get."
    sudo apt-get install -y --no-install-recommends tmux
  fi
fi

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "  Installing TPM from GitHub, ctrl-b + I to install in Tmux"
  git clone git@github.com:tmux-plugins/tpm.git ~/.tmux/plugins/tpm
fi

exit 0
