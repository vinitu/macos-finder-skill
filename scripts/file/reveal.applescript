-- Reveal item in Finder (select in front Finder window).
on run argv
	if (count of argv) < 1 then
		return "Usage: reveal.applescript <POSIX_path>"
	end if
	set pathStr to item 1 of argv
	set pathFile to (POSIX file pathStr) as alias

	tell application "Finder"
		reveal pathFile
		activate
	end tell
	return "revealed"
end run
