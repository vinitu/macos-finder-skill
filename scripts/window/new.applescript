-- Open a new Finder window. argv: [POSIX_path] (optional target folder)
on run argv
	tell application "Finder"
		if (count of argv) ≥ 1 then
			set targetFolder to (POSIX file (item 1 of argv)) as alias
			make new Finder window to targetFolder
		else
			make new Finder window
		end if
	end tell
	return "opened"
end run
