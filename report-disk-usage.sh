#!/bin/bash
# disk-usage.sh - Check disk usage

echo "Disk Usage Report:"
df -h | grep -E '^/dev'
