function is_nth_tty
	command python -c "from __future__ import print_function; import os, sys; print(int(''.join([c if c.isdigit() else '' for c in os.ttyname(sys.stdin.fileno())])) % $argv[1])"
end

function fish_greeting -d "what's up, fish?"
	set_color normal

  	if [ (which finger) ]
        set REALNAME (finger (whoami) | sed -e '/Name/!d;s/.*: //')
    else if [ (which getent) ]
        set REALNAME (getent passwd (whoami) | cut -d : -f 5)
    else
        set REALNAME (whoami)
    end

    if [ (string length $REALNAME) ]
        set REALNAME (whoami)
    end

    set -l HOST_INNER (uname -s) (uname -m)
    set -l HOST_NAME (uname -n)
    set -l HOST_STRING "$HOST_NAME ($HOST_INNER)"

    set -l MOTD1 "echo 'Hello, $REALNAME! @ $HOST_STRING'"
    set -l MOTD2 "echo 'Is this real life?'"

    if [ (which fortune) ]
        set MOTD2 "fortune"
    end

    if [ (which cowsay) ]
        set MOTD2 "$MOTD2 | cowsay -f random"
    end

    if [ (which lolcat) ]
        set MOTD1 "$MOTD1 | lolcat"
        set MOTD2 "$MOTD2 | lolcat"
    end

    # dogeeeeee!
    if [ (is_nth_tty 3) -eq 0 ]
        if [ (which doge) ]
            set MOTD2 "doge"
        end
    end

    set -l MOTD "$MOTD1; and $MOTD2"

    eval $MOTD
end
