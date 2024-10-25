#!/bin/bash

XVFB_DISPLAY=:99
XVFB_SCREEN=0
XVFB_RESOLUTION="${WIDTH}x${HEIGHT}x24"
X11_SOCKET_DIR="$HOME/.X11-unix"

start_xvfb() {
    # Create user-specific X11 socket directory
    mkdir -p $X11_SOCKET_DIR
    chmod 700 $X11_SOCKET_DIR

    # Check if Xvfb is already running
    if ! ps aux | grep -v grep | grep -q "Xvfb $XVFB_DISPLAY"; then
        # Remove any existing lock files
        rm -f /tmp/.X${XVFB_DISPLAY#:}-lock
        rm -f $X11_SOCKET_DIR/X${XVFB_DISPLAY#:}

        # Start Xvfb with user-specific socket directory
        Xvfb $XVFB_DISPLAY -ac -screen $XVFB_SCREEN $XVFB_RESOLUTION -nolisten tcp -sockdir $X11_SOCKET_DIR &

        # Wait for Xvfb to start
        sleep 2

        echo "Xvfb started on display $XVFB_DISPLAY"
    else
        echo "Xvfb is already running on display $XVFB_DISPLAY"
    fi
}

stop_xvfb() {
    pkill Xvfb
    echo "Xvfb stopped"
}

case "$1" in
    start)
        start_xvfb
        ;;
    stop)
        stop_xvfb
        ;;
    restart)
        stop_xvfb
        start_xvfb
        ;;
    *)
        echo "Usage: $0 {start|stop|restart}"
        exit 1
esac

exit 0