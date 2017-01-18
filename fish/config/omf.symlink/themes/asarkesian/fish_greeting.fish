function is_nth_tty
	command python -c "import os, sys; print int(''.join([c if c.isdigit() else '' for c in os.ttyname(sys.stdin.fileno())])) % $argv[1]"
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

    set -l HOST_INNER (uname -s) (uname -m)
    set -l HOST_NAME (uname -n)
    set -l HOST_STRING "$HOST_NAME ($HOST_INNER)"

    set -l MOTD1 "echo 'Hello, $REALNAME! @ $HOST_STRING'"
    set -l MOTD2 "echo"

    if [ (which fortune) ]
        set MOTD2 "fortune"
    end

    if [ (which cowsay) ]
    	set MOTD2 (eval $MOTD2)
        set MOTD2 "cowsay \"$MOTD2\""
    end

    if [ (which lolcat) ]
        set MOTD1 "$MOTD1 | lolcat"
        set MOTD2 "$MOTD2 | lolcat"
    end

    # dogeeeeee!
    if [ (is_nth_tty 3) -eq 0 ]; and [ (which doge) ];
        set MOTD2 "doge"
    end

    set -l MOTD "$MOTD1; and $MOTD2"

    eval $MOTD
end