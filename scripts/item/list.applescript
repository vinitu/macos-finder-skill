-- List items in a folder. argv: POSIX_path [files|folders|all]
-- Default: all. One name per line.
on run argv
	if (count of argv) < 1 then
		return "Usage: list.applescript <POSIX_path> [files|folders|all]"
	end if
	set pathStr to item 1 of argv
	set filterType to "all"
	if (count of argv) ≥ 2 then set filterType to item 2 of argv

	tell application "Finder"
		set targetFolder to (POSIX file pathStr) as alias
		set itemList to {}
		if filterType is "files" then
			set itemList to name of every file of targetFolder
		else if filterType is "folders" then
			set itemList to name of every folder of targetFolder
		else
			set itemList to name of every item of targetFolder
		end if
		set output to ""
		repeat with n in itemList
			set output to output & n & linefeed
		end repeat
		return output
	end tell
end run
