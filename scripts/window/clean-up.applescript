-- Clean up Finder window view. argv: name|modification date|size|kind|label
on run argv
	if (count of argv) < 1 then
		return "Usage: clean-up.applescript <name|modification date|size|kind|label>"
	end if
	set byProp to item 1 of argv

	tell application "Finder"
		set frontWin to front window
		clean up frontWin by byProp
	end tell
	return "cleaned up"
end run
