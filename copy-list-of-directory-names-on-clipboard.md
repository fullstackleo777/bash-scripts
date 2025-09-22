#!/bin/bash
# Copy current list of directories to clipboard

find . -maxdepth 1 -type d | xclip -selection clipboard -t text/plain

# For a list of recursive directories use:
# find . -type d | xclip -selection clipboard -t text/plain
