#!/usr/bin/fish

if test $argv = "new"
	echo "give me the name:"
	set name (zenity --entry)
	mkdir /home/dbiro/Projects/All/Programming/$name
	ln -s /home/dbiro/Projects/All/Programming/$name /home/dbiro/Projects/Actual/$name
	urxvt -e sh -c "cd ~/Projects/Actual/$name; fish"
else if test $argv = "open"
	set name (zenity --list --column "Project" (ls ~/Projects/Actual/))
	echo opening $name
	urxvt -e sh -c "cd \$(realpath ~/Projects/Actual/$name); fish"
else if test $argv = "run"
	set name (zenity --list --column "Project" (ls ~/Projects/Actual/))
	echo opening $name
	urxvt -e sh -c "cd ~/Projects/Actual/$name; fish run.fish; fish"
else if test $argv = "archive"
	set name (zenity --list --column "Project" (ls ~/Projects/Actual/))
	rm ~/Projects/Actual/$name
else if test $argv = "unarchive"
	set name (zenity --list --column "Project" (ls ~/Projects/All/Programming/))
	ln -s /home/dbiro/Projects/All/Programming/$name /home/dbiro/Projects/Actual/$name
else if test $argv = "delete"
	set name (zenity --list --column "Project" (ls ~/Projects/All/Programming/))
	rm ~/Projects/Actual/$name
	rm ~/Projects/All/Programming/$name
end
