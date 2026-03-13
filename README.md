# macOS Finder Skill

This repo stores a skill for macOS Finder integration on macOS via AppleScript (`osascript`).

## Installation

```bash
npx skills add vinitu/macos-finder-skill
```

Or with [skills.sh](https://skills.sh):

```bash
skills.sh add vinitu/macos-finder-skill
```

## Scope

- List files and folders in any directory.
- Get file info (name, size, kind, creation/modification date).
- Create folders, move, copy, rename, and delete files.
- Open files with default or specific applications.
- Reveal and select files in Finder windows.
- Manage Finder windows (open, close, resize, change view).
- Get and set file labels (color tags) and Spotlight comments.
- Eject mounted volumes.

## Prerequisites

- macOS with Finder running (always running by default)
- Automation permission granted for Finder (System Settings > Privacy & Security > Automation)

## How To Use

From the skill directory (or path where scripts are installed):

```bash
# List items in folder (POSIX path)
osascript scripts/item/list.applescript "/path/to/folder"
# Get file info: name, size, kind, dates
osascript scripts/item/info.applescript "/path/to/file"
# Create folder at parent path
osascript scripts/folder/create.applescript "/path/to/parent" "New Folder"
# Move file or folder to destination folder
osascript scripts/file/move.applescript "/path/to/file" "/path/to/dest"
# Reveal file in Finder and bring to front
osascript scripts/file/reveal.applescript "/path/to/file"
```

For the full command set and examples, see `SKILL.md` and scripts under `scripts/`.

## Troubleshooting

| Issue | Solution |
|-------|----------|
| "not authorized" error | Grant Automation permission for Finder to terminal |
| "file not found" error | Verify the POSIX path is correct and file exists |
| Window commands not working | Ensure Finder has at least one open window |
| Eject fails | Close any apps using the volume first |
