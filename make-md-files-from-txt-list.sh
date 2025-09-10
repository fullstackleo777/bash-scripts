#!/usr/bin/env bash

## Make sure to make the .sh file executable
## chmod +x make-md-files-from-txt-list.sh

## Use in the terminal like this if the file does not exist:
## ./make-md-files-from-txt-list.sh list.txt

## Use in the terminal like this to force empty files:
## ./make-md-files-from-txt-list.sh list.txt --truncate

set -Eeuo pipefail

usage() { echo "Usage: $0 <list-file> [--truncate]"; }

if [[ $# -lt 1 || $# -gt 2 ]]; then usage >&2; exit 1; fi
list=$1
[[ -f "$list" ]] || { echo "File not found: $list" >&2; exit 1; }
truncate=false
if [[ "${2-}" == "--truncate" ]]; then truncate=true; fi

sed -e 's/\r$//' -- "$list" | grep -v '^[[:space:]]*$' |
while IFS= read -r name || [[ -n "$name" ]]; do
  # Trim edges
  name="$(printf '%s' "$name" | sed -e 's/^[[:space:]]\+//' -e 's/[[:space:]]\+$//')"
  [[ -z "$name" ]] && continue

  # Add .md if missing (case-insensitive)
  case "$name" in
    *.md|*.MD|*.Md|*.mD) file="$name" ;;
    *) file="${name}.md" ;;
  esac

  # Create parent directories if path-like
  dir="$(dirname -- "$file")"
  [[ "$dir" != "." ]] && mkdir -p -- "$dir"

  if $truncate; then
    : > "$file"   # create or empty
  else
    touch -- "$file"  # create if missing; keep contents if present
  fi

  printf 'Created: %s\n' "$file"
done