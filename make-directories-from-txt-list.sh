#!/usr/bin/env bash

## Make sure to make the .sh file executable
## chmod +x make-directories-from-txt-list.sh

## Use in the terminal like this:
## ./make-directories-from-txt-list.sh your-list.txt

set -Eeuo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <list-file>" >&2
  exit 1
fi

list=$1
if [[ ! -f "$list" ]]; then
  echo "File not found: $list" >&2
  exit 1
fi

# Create every non-empty line as a directory (handles CRLF)
sed -e 's/\r$//' -- "$list" | grep -v '^[[:space:]]*$' |
while IFS= read -r dir || [[ -n "$dir" ]]; do
  mkdir -p -- "$dir"
done