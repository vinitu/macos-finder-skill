-- Get Finder insertion location (where new items would be placed). Returns POSIX path.
on run argv
	tell application "Finder"
		set loc to insertion location
		return POSIX path of (loc as alias)
	end tell
end run
