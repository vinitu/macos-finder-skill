-- Get or set Finder label (color). argv: POSIX_path [label_index]
-- label_index 0=none, 1-7 are colors. If omitted, returns current label index.
on run argv
	if (count of argv) < 1 then
		return "Usage: label.applescript <path> [0|1|2|3|4|5|6|7]"
	end if
	set pathStr to item 1 of argv
	set pathFile to (POSIX file pathStr) as alias

	tell application "Finder"
		set f to pathFile
		if (count of argv) ≥ 2 then
			set label index of f to (item 2 of argv) as integer
			return "set"
		else
			return (label index of f) as text
		end if
	end tell
end run
