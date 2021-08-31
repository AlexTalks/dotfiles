#!/usr/bin/env bash
#
# Ruby
#
# This installs Ruby and gems

if test ! $(which ruby)
then
  # assume pre-installed on Darwin

  if [ "$(uname)" == "Linux" ] && [ `which apt-get` ]; then
    echo "  Installing Ruby via apt-get."
    sudo apt-get install -y --no-install-recommends ruby
  fi

  if test $(which gem); then
    gem install --user-install cowsay lolcat
  fi
fi

exit 0
