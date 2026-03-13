-- List Finder window names (target folder name). One per line.
on run argv
	tell application "Finder"
		set wins to every window
		set output to ""
		repeat with w in wins
			set output to output & (name of w) & linefeed
		end repeat
		return output
	end tell
end run
