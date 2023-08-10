#!/usr/bin/env bash
#
# Zsh
#
# This installs Zsh, oh-my-zsh

if test ! $(which zsh)
then
  # assume pre-installed on Darwin

  if [ "$(uname)" == "Linux" ] && [ `which apt-get` ]; then
    echo "  Installing zsh via apt-get."
    sudo apt-get install -y --no-install-recommends zsh
  fi

  if test $(which zsh); then
    echo "  Installing Oh My Zsh."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
  fi
fi

exit 0
