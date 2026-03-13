-- Get file URL for path. argv: POSIX_path
on run argv
	if (count of argv) < 1 then
		return "Usage: url.applescript <POSIX_path>"
	end if
	set pathStr to item 1 of argv
	set pathFile to POSIX file pathStr

	tell application "Finder"
		set f to pathFile as alias
		return URL of f as text
	end tell
end run
