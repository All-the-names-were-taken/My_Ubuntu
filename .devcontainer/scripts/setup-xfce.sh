#!/usr/bin/env bash
set -e

export DEBIAN_FRONTEND=noninteractive

echo "Updating system..."
apt-get update -y

echo "Installing XFCE, VNC, and NoVNC dependencies..."
apt-get install -y \
    xfce4 xfce4-goodies \
    x11vnc \
    xvfb \
    wget curl net-tools unzip git \
    python3 python3-pip \
    xorg dbus-x11

echo "Installing websockify..."
pip3 install websockify

echo "Downloading noVNC..."
mkdir -p /opt/novnc
cd /opt/novnc
wget -q https://github.com/novnc/noVNC/archive/refs/heads/master.zip
unzip master.zip
mv noVNC-master/* .
rm -rf noVNC-master master.zip

echo "Installing websockify helper..."
git clone https://github.com/novnc/websockify /opt/novnc/utils/websockify

echo "XFCE + noVNC setup complete."
