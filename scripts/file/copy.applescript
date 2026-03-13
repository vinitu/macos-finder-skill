-- Copy file or folder. argv: sourcePOSIXPath destinationPOSIXPath
on run argv
	if (count of argv) < 2 then
		return "Usage: copy.applescript <source_path> <destination_path>"
	end if
	set srcPath to item 1 of argv
	set dstPath to item 2 of argv
	set srcItem to (POSIX file srcPath) as alias
	set dstFolder to (POSIX file dstPath) as alias

	tell application "Finder"
		duplicate srcItem to dstFolder
	end tell
	return "copied"
end run
