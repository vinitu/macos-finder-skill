#!/usr/bin/env bash
set -euo pipefail

tmp="$(mktemp)"
trap 'rm -f "$tmp"' EXIT

make --no-print-directory dictionary-finder >"$tmp"

has_pattern() {
	local pattern="$1"
	local file="$2"
	if command -v rg >/dev/null 2>&1; then
		rg -q "$pattern" "$file"
	else
		grep -q -- "$pattern" "$file"
	fi
}

has_pattern '<class name="item"' "$tmp"
has_pattern '<class name="container"' "$tmp"

printf 'dictionary_contract: ok\n'
