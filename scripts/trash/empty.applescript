-- Empty the Trash.
on run argv
	tell application "Finder"
		empty trash
	end tell
	return "emptied"
end run
