#
# Alex Sarkesian's config.fish
#
# this is sourced on login shells
# Set/export main environment variables

set -U EDITOR vim
set -U PAGER less

# Apple Silicon Brew Setup

if [ -r /opt/homebrew/bin ]
    set -x PATH /opt/homebrew/bin /opt/homebrew/sbin $PATH
    alias oldbrew /usr/local/bin/brew
end

# Local Path Setup

set -x PATH . $HOME/bin $PATH

# for brew-installed Python
if [ -r /opt/homebrew/opt/python/libexec/bin ]
    set -x PATH /opt/homebrew/opt/python/libexec/bin $PATH
else if [ -r /usr/local/opt/python/libexec/bin ]
    set -x PATH /usr/local/opt/python/libexec/bin $PATH
end

# for ruby gems
set -U GEMPATH (gem environment gempath 2>/dev/null | cut -d':' -f1)
if [ -r $GEMPATH/bin ]
    set -x PATH $PATH $GEMPATH/bin
end

# for Go version management
if [ -s $HOME/.gvm/scripts/gvm ]
    source $HOME/.gvm/scripts/gvm
end

# for Go executables
if [ -r ~/go/bin ]
    set -x PATH $PATH $HOME/go/bin
end

# for locally installed python packages
if [ -r $HOME/.local/bin ]
    set -x PATH $PATH $HOME/.local/bin
end

set -U PYTHONBASE (python -m site --user-base 2>/dev/null)

if [ -r $PYTHONBASE/bin ]
    set -x PATH $PATH $PYTHONBASE/bin
end

# for dotfiles bin
if [ -r ~/.dotfiles/bin ]
    set -x PATH $PATH $HOME/.dotfiles/bin
end

# NOTE: place(s) where new installs are located:
## /opt/homebrew/bin    // Apple Silicon brew installs on MacOS
## /usr/local/bin       // local installs, by user
## /usr/bin             // system installs, by root

# Aliases
alias cdb 'prevd'
alias pubkey "more ~/.ssh/id_ed25519.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

function psef -d "show running processes with the given name"
	ps -ef | head -1
	ps -ef | grep -v "grep --color -i $argv" | grep -i $argv
end

function psaux -d "show running processes with ps aux with the given name"
    ps aux | head -1
    ps aux | grep -v "grep --color -i $argv" | grep -i $argv
end

# TMUX support

function tmux_refresh -d "refresh environment variables for tmux pane"
    if [ -n "$TMUX" ]
        set -xg DISPLAY (tmux showenv | grep "^DISPLAY" | awk '{split($0,v,"="); print v[2]}')
        set -xg SSH_AUTH_SOCK (tmux showenv | grep "^SSH_AUTH_SOCK" | awk '{split($0,v,"="); print v[2]}')
        set -xg SSH_CONNECTION (tmux showenv | grep "^SSH_CONNECTION" | awk '{split($0,v,"="); print v[2]}')
    end
end

set -xg PYTHONSTARTUP $HOME/.pythonrc
