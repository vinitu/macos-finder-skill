-- List names of items in the Documents folder of home. One name per line.
tell application "Finder"
	set docFolder to folder "Documents" of home
	set itemList to name of every item of docFolder
	set output to ""
	repeat with n in itemList
		set output to output & n & linefeed
	end repeat
	return output
end tell
