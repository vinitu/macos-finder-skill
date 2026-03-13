-- Get or set Finder comment. argv: POSIX_path [newComment]
-- If newComment omitted, returns current comment.
on run argv
	if (count of argv) < 1 then
		return "Usage: comment.applescript <path> [new_comment]"
	end if
	set pathStr to item 1 of argv
	set pathFile to (POSIX file pathStr) as alias

	tell application "Finder"
		set f to pathFile
		if (count of argv) ≥ 2 then
			set comment of f to (item 2 of argv)
			return "set"
		else
			return comment of f
		end if
	end tell
end run
