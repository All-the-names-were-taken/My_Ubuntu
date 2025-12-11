#!/usr/bin/env bash
set -e

export DISPLAY=:1
SCREEN_RESOLUTION="1280x720x24"

echo "Starting Xvfb..."
Xvfb :1 -screen 0 $SCREEN_RESOLUTION -ac &

sleep 2

echo "Starting XFCE session..."
startxfce4 &

echo "Starting x11vnc..."
x11vnc -display :1 -forever -nopw -shared -rfbport 5901 &

sleep 2

echo "Starting noVNC on port 6080..."
/usr/local/bin/websockify --web=/opt/novnc 6080 localhost:5901
