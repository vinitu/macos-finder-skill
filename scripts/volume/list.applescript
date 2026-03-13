-- List volume names. One per line.
on run argv
	tell application "Finder"
		set vols to every disk
		set output to ""
		repeat with v in vols
			set output to output & (name of v) & linefeed
		end repeat
		return output
	end tell
end run
