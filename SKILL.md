---
name: macos-finder
description: Control Apple Finder on macOS via AppleScript. Use for file management, folder creation, opening files, revealing items, and automating Finder-based workflows. Triggers on queries about files, folders, Finder windows, or file operations on Mac.
---

# macOS Finder Integration

Control Finder and manage files/folders on macOS using AppleScript (`osascript`).

## Prerequisites

- macOS with Finder running (always running by default)
- Terminal or agent must have Automation permission for Finder (System Settings > Privacy & Security > Automation)

## Listing Files and Folders

### List items in a folder
```bash
osascript -e 'tell application "Finder" to get name of every item of folder "Documents" of home'
```

### List only folders
```bash
osascript -e 'tell application "Finder" to get name of every folder of folder "Documents" of home'
```

### List only files
```bash
osascript -e 'tell application "Finder" to get name of every file of folder "Documents" of home'
```

### List items by POSIX path
```bash
osascript -e 'tell application "Finder" to get name of every item of (POSIX file "/Users/Dmytro/Downloads" as alias)'
```

## Getting File Info

### Get basic properties
```bash
osascript -e 'tell application "Finder"
    set f to (POSIX file "/Users/Dmytro/Documents/example.pdf" as alias)
    set n to name of f
    set k to kind of f
    set s to size of f
    set cd to creation date of f
    set md to modification date of f
    return "Name: " & n & ", Kind: " & k & ", Size: " & s & ", Created: " & (cd as string) & ", Modified: " & (md as string)
end tell'
```

### Get file URL
```bash
osascript -e 'tell application "Finder" to get URL of (POSIX file "/Users/Dmytro/Documents/example.pdf" as alias)'
```

## Creating Folders

### Create a new folder
```bash
osascript -e 'tell application "Finder" to make new folder at (POSIX file "/Users/Dmytro/Documents" as alias) with properties {name:"New Folder"}'
```

### Create nested folders
```bash
osascript -e 'tell application "Finder"
    set parent to make new folder at (POSIX file "/Users/Dmytro/Documents" as alias) with properties {name:"Project"}
    make new folder at parent with properties {name:"src"}
    make new folder at parent with properties {name:"docs"}
end tell'
```

## Moving, Copying, and Deleting Files

### Move a file
```bash
osascript -e 'tell application "Finder" to move (POSIX file "/Users/Dmytro/Downloads/report.pdf" as alias) to (POSIX file "/Users/Dmytro/Documents" as alias)'
```

### Copy a file
```bash
osascript -e 'tell application "Finder" to duplicate (POSIX file "/Users/Dmytro/Documents/report.pdf" as alias) to (POSIX file "/Users/Dmytro/Desktop" as alias)'
```

### Rename a file
```bash
osascript -e 'tell application "Finder" to set name of (POSIX file "/Users/Dmytro/Documents/old-name.txt" as alias) to "new-name.txt"'
```

### Move to Trash
```bash
osascript -e 'tell application "Finder" to delete (POSIX file "/Users/Dmytro/Documents/unwanted.txt" as alias)'
```

### Empty Trash
```bash
osascript -e 'tell application "Finder" to empty trash'
```

## Opening Files

### Open with default application
```bash
osascript -e 'tell application "Finder" to open (POSIX file "/Users/Dmytro/Documents/report.pdf" as alias)'
```

### Open with a specific application
```bash
osascript -e 'tell application "Finder" to open (POSIX file "/Users/Dmytro/Documents/notes.txt" as alias) using (POSIX file "/Applications/Visual Studio Code.app" as alias)'
```

## Revealing Files in Finder

### Reveal and select a file
```bash
osascript -e 'tell application "Finder"
    reveal (POSIX file "/Users/Dmytro/Documents/report.pdf" as alias)
    activate
end tell'
```

This opens a Finder window with the file selected (equivalent to "Show in Finder").

## Working with Finder Windows

### Open a new Finder window
```bash
osascript -e 'tell application "Finder"
    make new Finder window to (POSIX file "/Users/Dmytro/Documents" as alias)
    activate
end tell'
```

### List open windows
```bash
osascript -e 'tell application "Finder" to get name of every Finder window'
```

### Close all Finder windows
```bash
osascript -e 'tell application "Finder" to close every Finder window'
```

### Set window bounds (position and size)
```bash
osascript -e 'tell application "Finder" to set bounds of Finder window 1 to {100, 100, 900, 600}'
```

The bounds format is `{left, top, right, bottom}` in pixels.

### Set window view
```bash
# Options: icon view, list view, column view, flow view
osascript -e 'tell application "Finder" to set current view of Finder window 1 to list view'
```

## File Labels and Comments

### Set a label (color tag)
```bash
# Label index: 0=none, 1=orange, 2=red, 3=yellow, 4=blue, 5=purple, 6=green, 7=gray
osascript -e 'tell application "Finder" to set label index of (POSIX file "/Users/Dmytro/Documents/important.pdf" as alias) to 2'
```

### Get a label
```bash
osascript -e 'tell application "Finder" to get label index of (POSIX file "/Users/Dmytro/Documents/important.pdf" as alias)'
```

### Set a Spotlight comment
```bash
osascript -e 'tell application "Finder" to set comment of (POSIX file "/Users/Dmytro/Documents/report.pdf" as alias) to "Q1 financial report"'
```

### Get a Spotlight comment
```bash
osascript -e 'tell application "Finder" to get comment of (POSIX file "/Users/Dmytro/Documents/report.pdf" as alias)'
```

## Ejecting Volumes

### Eject a specific volume
```bash
osascript -e 'tell application "Finder" to eject disk "USB Drive"'
```

### List mounted volumes
```bash
osascript -e 'tell application "Finder" to get name of every disk'
```

## Selections

### Get currently selected items
```bash
osascript -e 'tell application "Finder" to get POSIX path of (selection as alias list)'
```

### Get the frontmost Finder folder
```bash
osascript -e 'tell application "Finder" to get POSIX path of (target of front Finder window as alias)'
```

## Best Practices

### Path Handling
- Use `POSIX file "/absolute/path" as alias` to reference files by POSIX path.
- Use `folder "Name" of home` for paths relative to the home directory.
- Tilde (`~`) is not supported in AppleScript; always use full POSIX paths or Finder object references.

### Error Handling
- Wrap commands in `try` blocks when the file might not exist.
- Check `exists` before operating on items: `if exists (POSIX file "/path" as alias) then ...`

### Automation Permission
- On first use, macOS will prompt to allow terminal/agent to control Finder.
- Grant permission in System Settings > Privacy & Security > Automation.

## Troubleshooting

| Issue | Solution |
|-------|----------|
| "not authorized" error | Grant Automation permission for Finder to terminal |
| "file not found" error | Verify the POSIX path is correct and file exists |
| Window commands not working | Ensure Finder has at least one open window |
| Label not changing | Label index must be 0-7; check the value |
| Eject fails | Close any apps using the volume first |

## Technical Notes

- All commands use `osascript` to run AppleScript (no private APIs).
- Finder is always running on macOS; no need to launch it.
- File operations respect macOS permissions (sandboxed folders may be restricted).
- Large folder listings may be slow; prefer `ls` in terminal for performance-critical tasks.
