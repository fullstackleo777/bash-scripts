#!/bin/bash
# autostart-dev-apps.sh - Start app in order on startup

# Must Sleep A Bit For System Startup
sleep 4

# Start KeePassXC
keepassxc &
sleep 2

# Start Brave Browser
brave-browser --incognito &
sleep 2

# Start VSCodium
codium &
sleep 2

# Start Terminal
gnome-terminal &
