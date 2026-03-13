-- Get selected items in Finder. Returns POSIX paths, one per line.
on run argv
	tell application "Finder"
		set sel to selection
		set output to ""
		repeat with f in sel
			set output to output & (POSIX path of (f as alias)) & linefeed
		end repeat
		return output
	end tell
end run
