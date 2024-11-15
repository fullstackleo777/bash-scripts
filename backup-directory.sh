#!/bin/bash
# backup.sh - Backup a directory

SOURCE_DIR=$1
BACKUP_DIR=$HOME/backups
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

if [ -z "$SOURCE_DIR" ]; then
    echo "Usage: $0 <source_directory>"
    exit 1
fi

mkdir -p $BACKUP_DIR
tar -czf $BACKUP_DIR/backup_$TIMESTAMP.tar.gz -C "$(dirname $SOURCE_DIR)" "$(basename $SOURCE_DIR)"
echo "Backup created at $BACKUP_DIR/backup_$TIMESTAMP.tar.gz"
