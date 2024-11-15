#!/bin/bash
# kill-process.sh - Kill a process by name

PROCESS_NAME=$1

if [ -z "$PROCESS_NAME" ]; then
    echo "Usage: $0 <process_name>"
    exit 1
fi

PID=$(pgrep "$PROCESS_NAME")
if [ -z "$PID" ]; then
    echo "No process found with name: $PROCESS_NAME"
else
    kill -9 $PID
    echo "Process $PROCESS_NAME (PID: $PID) killed."
fi
