# macOS Finder Skill

This repo stores a skill for macOS Finder integration on macOS via AppleScript (`osascript`).

## Installation

Install with `skills.sh`:

```bash
skills.sh add vinitu/macos-finder-skill
```

If you use the npm installer instead:

```bash
npx skills add vinitu/macos-finder-skill
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

```bash
# List files in a folder
osascript -e 'tell application "Finder" to get name of every item of folder "Documents" of home'

# Get file info
osascript -e 'tell application "Finder" to get size of (POSIX file "/path/to/file" as alias)'

# Create a folder
osascript -e 'tell application "Finder" to make new folder at (POSIX file "/path/to/parent" as alias) with properties {name:"New Folder"}'

# Move a file
osascript -e 'tell application "Finder" to move (POSIX file "/path/to/file" as alias) to (POSIX file "/path/to/dest" as alias)'

# Reveal a file in Finder
osascript -e 'tell application "Finder" to reveal (POSIX file "/path/to/file" as alias)'
```

For the full command set and examples, see `SKILL.md`.

## Troubleshooting

| Issue | Solution |
|-------|----------|
| "not authorized" error | Grant Automation permission for Finder to terminal |
| "file not found" error | Verify the POSIX path is correct and file exists |
| Window commands not working | Ensure Finder has at least one open window |
| Eject fails | Close any apps using the volume first |
