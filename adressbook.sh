#!/bin/sh
#(c) Zetsukae
#Under MIT License

# source

# doc : https://www.shellscript.sh/exercises.html

. ./library.sh

#functions

menu_show() {
	echo " ____________"
	echo "/ AdressBook |"
	echo "______________"
	echo 1: "Search"
	echo 2: "Add entries"
	echo 3: "Edit"
	echo 4: "Remove
	"
	echo a: "About"
	echo q: "Quit"
	echo "\____________|"
}

menu_int() {
	while true; do
		menu_show
		read -n 1 result
		echo " "
		case "$result" in
		"1")
			search
			;;
		"2")
			add
			;;
		"3")
			edit
			;;
		"4")
			remove
			;;
		"q")
			echo "Bye, You should try Underfang :)"
			exit 0
			;;
		"a")
			echo "Made by Alexis."
			;;
		*)
			echo "Can't you read ? Try again."
			;;
		esac
	done
}

# main script

if [ ! -f "$Book" ]; then
	echo "Creating Book"
	touch "$Book"
fi

menu_int
