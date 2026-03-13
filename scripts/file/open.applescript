-- Open item with default app (or optional app). argv: POSIX_path [applicationPath]
on run argv
	if (count of argv) < 1 then
		return "Usage: open.applescript <path> [application_path]"
	end if
	set pathStr to item 1 of argv
	set pathFile to (POSIX file pathStr) as alias

	tell application "Finder"
		if (count of argv) ≥ 2 then
			open pathFile using (POSIX file (item 2 of argv) as alias)
		else
			open pathFile
		end if
	end tell
	return "opened"
end run
