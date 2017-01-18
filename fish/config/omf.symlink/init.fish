#
# Alex Sarkesian's config.fish
#
# this is sourced on login shells
# Set/export main environment variables

set -U EDITOR vim
set -U PAGER less

set -x PATH . $HOME/bin /usr/local/bin $PATH

# for pip executables
if [ -r /usr/local/share/python ]
    set -x PATH $PATH /usr/local/share/python
end

# for ruby gems
if [ -r ~/.gem/ruby/2.0.0/bin ]
    set -x PATH $PATH $HOME/.gem/ruby/2.0.0/bin
end

if [ -r ~/.rvm/gems/ruby-2.1.1/bin ]
    set -x PATH $PATH $HOME/.rvm/gems/ruby-2.1.1/bin
end


# for npm executables
if [ -r /usr/local/share/npm/bin ]
    set -x PATH $PATH /usr/local/share/npm/bin
end

### Added by the Heroku Toolbelt
if [ -r /usr/local/heroku/bin ]
	set -x PATH $PATH /usr/local/heroku/bin
end

# last, for dotfiles bin
if [ -r ~/.dotfiles/bin ]
    set -x PATH $PATH $HOME/.dotfiles/bin
end

# NOTE: place(s) where new installs are located:
## /usr/local/bin       // local installs, by user
## /usr/bin             // system installs, by root

# Java settings
if [ (uname -s) = "Darwin" ]; and [ -e /usr/libexec/java_home ]
	set -x JAVA_HOME (/usr/libexec/java_home -v 1.8)
end

# CCACHE settings
set -x CCACHE_CPP2 1
set -x CCACHE_COMPRESS 1

alias cdb 'prevd'
alias pubkey "more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

function psef -d "show running processes with the given name"
	ps -ef | head -1
	ps -ef | grep -v "grep --color -i $argv" | grep -i $argv
end

function psaux -d "show running processes with ps aux with the given name"
    ps aux | head -1
    ps aux | grep -v "grep --color -i $argv" | grep -i $argv
end

set -x PYTHONSTARTUP $HOME/.pythonrc
