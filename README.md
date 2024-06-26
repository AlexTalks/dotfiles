# alextalks does dotfiles!

![Sleeping bunny](bunnies/bunny-faint.gif)

## dotfiles

Your dotfiles are how you personalize your system. These are mine.

## install

Run this:

```sh
git clone https://github.com/alextalks/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

The main file you'll want to change right off the bat is `bash/bashrc.symlink` 
and `bash/profile.symlink`, or `zsh/zshrc.symlink` if you use zsh,
which sets up a few paths that'll be different on your particular machine.

`dot` is a simple script that installs some dependencies, sets sane OS X
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.

## what's inside

A lot of stuff. Seriously, a lot of stuff. Check them out in the file browser
above and see what components may mesh up with you.
[Fork it](https://github.com/alextalks/dotfiles/fork), remove what you don't
use, and build on what you do use.

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.


## Software to install

- ack
- oh-my-zsh
- bash-completion
- fish
- jq
- go
- npm
- Python 3.x
- Ruby, gem
- tmux
- Vundle for vim
- Xcode & command line utilities
- Command line flourishes: fortune, cowsay, lolcat, doge, 

## Optional software

- iTerm 2
- Powerline-patched fonts
- Solarized Dark Theme
- MacVim
- Sublime Text

## thanks

Forked without shame from https://github.com/holman/dotfiles.git

