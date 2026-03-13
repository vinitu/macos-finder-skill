-- Move item to Trash. argv: POSIX_path
on run argv
	if (count of argv) < 1 then
		return "Usage: delete.applescript <path>"
	end if
	set pathStr to item 1 of argv
	set pathFile to (POSIX file pathStr) as alias

	tell application "Finder"
		delete pathFile
	end tell
	return "deleted"
end run
