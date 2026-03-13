-- Create a folder. argv: parentPOSIXPath folderName
on run argv
	if (count of argv) < 2 then
		return "Usage: create.applescript <parent_path> <folder_name>"
	end if
	set parentPath to item 1 of argv
	set folderName to item 2 of argv
	set parentFolder to (POSIX file parentPath) as alias

	tell application "Finder"
		make new folder at parentFolder with properties {name:folderName}
	end tell
	return "created"
end run
