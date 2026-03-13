-- Get disk/volume info. argv: volumeName
on run argv
	if (count of argv) < 1 then
		return "Usage: info.applescript <volume_name>"
	end if
	set volName to item 1 of argv

	tell application "Finder"
		set d to disk volName
		set output to "name: " & (name of d) & linefeed
		set output to output & "capacity: " & (capacity of d) & linefeed
		set output to output & "free space: " & (free space of d) & linefeed
		set output to output & "ejectable: " & (ejectable of d) & linefeed
		set output to output & "local volume: " & (local volume of d) & linefeed
		set output to output & "startup: " & (startup of d)
		return output
	end tell
end run
