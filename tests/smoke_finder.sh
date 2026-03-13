#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if ! osascript -e 'tell application "Finder" to get name' >/dev/null 2>&1; then
	echo "smoke_finder: Finder not available."
	exit 0
fi
osascript -e 'tell application "Finder" to get name' | grep -q . || { echo "smoke_finder: could not get app name." >&2; exit 1; }

list_out="$(osascript "$ROOT_DIR/scripts/folder/list.applescript" 2>&1)" || { echo "smoke_finder: Finder not running, skipping."; exit 0; }
printf '%s\n' "$list_out" >/dev/null || { echo "smoke_finder: folder list failed." >&2; exit 1; }

# item/list for a known path
docs_path="$HOME/Documents"
if [ -d "$docs_path" ]; then
	item_list="$(osascript "$ROOT_DIR/scripts/item/list.applescript" "$docs_path" "all" 2>&1)" || true
	printf '%s\n' "$item_list" >/dev/null || true
fi

echo "smoke_finder: ok"
