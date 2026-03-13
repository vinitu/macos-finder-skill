-- Rename file or folder. argv: POSIX_path newName
on run argv
	if (count of argv) < 2 then
		return "Usage: rename.applescript <path> <new_name>"
	end if
	set pathStr to item 1 of argv
	set newName to item 2 of argv
	set pathFile to (POSIX file pathStr) as alias

	tell application "Finder"
		set name of pathFile to newName
	end tell
	return "renamed"
end run
