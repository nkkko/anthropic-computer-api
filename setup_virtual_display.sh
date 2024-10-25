#!/bin/bash

# Set up environment variables
export DISPLAY=:99
export WIDTH=${WIDTH:-1920}
export HEIGHT=${HEIGHT:-1080}

# Start Xvfb
Xvfb :99 -ac -screen 0 ${WIDTH}x${HEIGHT}x24 -nolisten tcp &
XVFB_PID=$!

# Wait for Xvfb to start
sleep 2

# Start x11vnc
x11vnc -display :99 -forever -shared -rfbport 5900 -nopw &
X11VNC_PID=$!

# Start the demo application
python -m streamlit run computer_use_demo/streamlit.py &
STREAMLIT_PID=$!

# Wait for all processes to finish
wait $XVFB_PID $X11VNC_PID $STREAMLIT_PID