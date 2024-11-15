#!/bin/bash
# battery-status.sh - Check battery status

UPOWER=/usr/bin/upower
if command -v $UPOWER &>/dev/null; then
    $UPOWER -i $(upower -e | grep BAT) | grep -E "state|percentage"
else
    echo "upower not installed. Install it to use this script."
fi
