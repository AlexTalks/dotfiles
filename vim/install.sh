#!/usr/bin/env bash
#
# Vim
#
# This installs Vundle (assuming vim is pre-installed).

if test $(which vim)
then
  if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    echo "  Installing Vundle via git clone."
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim -c "PluginInstall" -c "q!" -c "q!"
  fi
else
  echo "  Vim is not available on this system!"
fi

exit 0
