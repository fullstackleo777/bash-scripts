#!/bin/bash
# network-diagnostics.sh - Network troubleshooting

echo "Public IP Address:"
curl -s ifconfig.me
echo

echo "Open Ports:"
sudo netstat -tuln | grep LISTEN
echo

echo "DNS Configuration:"
cat /etc/resolv.conf
