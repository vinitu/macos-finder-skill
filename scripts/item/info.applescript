-- Get item properties. argv: POSIX_path
on run argv
	if (count of argv) < 1 then
		return "Usage: info.applescript <POSIX_path>"
	end if
	set pathStr to item 1 of argv
	set pathFile to POSIX file pathStr

	tell application "Finder"
		set f to pathFile as alias
		set output to "name: " & (name of f) & linefeed
		set output to output & "kind: " & (kind of f) & linefeed
		set output to output & "size: " & (size of f) & linefeed
		set output to output & "creation date: " & (creation date of f) & linefeed
		set output to output & "modification date: " & (modification date of f) & linefeed
		set output to output & "displayed name: " & (displayed name of f) & linefeed
		set output to output & "name extension: " & (name extension of f) & linefeed
		set output to output & "owner: " & (owner of f) & linefeed
		set output to output & "comment: " & (comment of f)
		return output
	end tell
end run
