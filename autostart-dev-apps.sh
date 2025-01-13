#!/bin/bash
# autostart-dev-apps.sh - Start app in order on startup

# Start Terminal
gnome-terminal &
sleep 2

# Start KeePassXC
keepassxc &
sleep 2

# Start Caja file manager
# caja &
# sleep 2

# Start VSCodium
codium &
sleep 2

# Start ProtonVPN
protonvpn &
sleep 2

# Start Brave Browser
brave &
