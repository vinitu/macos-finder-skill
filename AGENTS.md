# Repo Guide

This repo stores a skill for macOS Finder integration on macOS.

## Goal

- Document AppleScript commands for controlling Finder accurately.
- Prefer runnable examples over long prose.
- Treat file operations as real user data — never move, delete, or modify files without explicit user approval.

## Repo Layout

- `AGENTS.md`: this file; rules for coding agents.
- `SKILL.md`: the skill contract and usage instructions for agents.
- `README.md`: public project overview and installation notes.
- `Makefile`: targets `dictionary-finder`, `check`, `compile`, `test` (test-dictionary + test-smoke).
- `scripts/folder/list.applescript`: list item names in home Documents folder.
- `scripts/folder/create.applescript`: create folder at path.
- `scripts/item/list.applescript`, `scripts/item/info.applescript`, `scripts/item/url.applescript`, `scripts/item/label.applescript`, `scripts/item/comment.applescript`.
- `scripts/file/move.applescript`, `scripts/file/copy.applescript`, `scripts/file/rename.applescript`, `scripts/file/delete.applescript`, `scripts/file/open.applescript`, `scripts/file/reveal.applescript`.
- `scripts/trash/empty.applescript`.
- `scripts/window/list.applescript`, `scripts/window/new.applescript`, `scripts/window/clean-up.applescript`.
- `scripts/volume/list.applescript`; `scripts/disk/info.applescript`.
- `scripts/application/selection.applescript`, `scripts/application/insertion-location.applescript`.
- `tests/dictionary_contract.sh`: contract test against Finder scripting dictionary.
- `tests/smoke_finder.sh`: smoke test for script layer (skips when Finder not available).
- `.github/workflows/ci-pr.yml`: PR validation, auto-merge, version bump, tag, and release flow.
- `.github/workflows/ci-main.yml`: main-branch validation, patch tag, and release flow.

## Validation

After making changes:
- run `make check` to ensure Finder is available;
- run `make test` to run dictionary contract and smoke tests;
- run `make compile` to compile all AppleScript files (syntax check);
- update `SKILL.md` when command coverage changes.

## Editing Rules

- Keep docs in simple English.
- Do not claim support for a feature unless it is verified with `osascript`.
- Treat file operations as real user data; never move, delete, or modify files without explicit user approval.
