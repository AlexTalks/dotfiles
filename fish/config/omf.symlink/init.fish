#
# Alex Sarkesian's config.fish
#
# this is sourced on login shells
# Set/export main environment variables

set -U EDITOR vim
set -U PAGER less

set -x PATH . $HOME/bin $PATH

# for pip executables
if [ -r /usr/local/opt/python/libexec/bin ]
    set -x PATH /usr/local/opt/python/libexec/bin $PATH
end

# for ruby gems
if [ -r ~/.gem/ruby/2.6.0/bin ]
    set -x PATH $PATH $HOME/.gem/ruby/2.6.0/bin
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

# locally installed python packages for MacOS
if [ -r ~/Library/Python/3.9/bin ]
    set -x PATH $PATH $HOME/Library/Python/3.9/bin
end
if [ -r ~/Library/Python/2.7/bin ]
    set -x PATH $PATH ~/Library/Python/2.7/bin
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
    /usr/libexec/java_home &> /dev/null
    if [ $status -eq 0 ]
	   set -xg JAVA_HOME (/usr/libexec/java_home -v 1.8)
    end
end

# CCACHE settings
set -xg CCACHE_CPP2 1
set -xg CCACHE_COMPRESS 1

# Aliases
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

# TMUX support

function tmux_refresh -d "refresh environment variables for tmux pane"
    if [ -n "$TMUX" ]
        set -xg DISPLAY (tmux showenv | grep "^DISPLAY" | awk '{split($0,v,"="); print v[2]}')
        set -xg SSH_AUTH_SOCK (tmux showenv | grep "^SSH_AUTH_SOCK" | awk '{split($0,v,"="); print v[2]}')
        set -xg SSH_CONNECTION (tmux showenv | grep "^SSH_CONNECTION" | awk '{split($0,v,"="); print v[2]}')
    end
end

set -xg PYTHONSTARTUP $HOME/.pythonrc
