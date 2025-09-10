#!/usr/bin/env bash
sed -e 's/\r$//' folders.txt | grep -v '^[[:space:]]*$' |
while IFS= read -r dir; do printf 'Would create: %q\n' "$dir"; done


## Make sure to make the .sh file executable
## chmod +x make-directories-from-txt-list-dry-run.sh

## Use in the terminal like this:
## ./make-directories-from-txt-list.sh your-list.txt