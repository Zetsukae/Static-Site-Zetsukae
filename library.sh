#!/bin/sh
#(c) Zetsukae
#Under MIT License

# source

# doc : https://www.shellscript.sh/exercises.html

Book="${Book:-book.txt}"

# functions

search() {
    echo "Search with a name, email or phone,"
    echo "Your search :"
    read searching

    echo "We found :"
    if ! grep -i "$searching" book.txt; then
        echo "No matching, try to add a record before searching."
    fi
}

add() {
    echo "Enter the Name :"
    read name

    echo "Enter the Email :"
    read email

    echo "Enter the phone number :"
    read phone

    echo "${name}:${email}:${phone}" >>book.txt

    echo "Record saved!"
}

edit() {
    echo "Search one record to edit :"
    read edit

    if ! grep -i "$edit" book.txt >/dev/null; then
        echo "No matching, try to add the record before editing."
        return
    fi

    echo "We found :"
    grep -n -i "$edit" book.txt

    echo "Enter your choice :"
    read -r line_edit

    current_record=$(sed -n "${line_edit}p" book.txt)

    if [ -z "$current_record" ]; then
        echo "The number is not listed."
        return
    fi

    echo "Enter the new record information :"
    read -e -i "$current_record" -r new_text

    sed "${line_edit}s/.*/$new_text/" book.txt >temp.txt

    mv temp.txt book.txt

    echo "Record was modified"

}

remove() {
    echo "Search one record to delete :"
    read remove

    if ! grep -i "$remove" book.txt >/dev/null; then
        echo "No matching, try to add the record before removing."
        return
    fi

    echo "We found :"
    grep -n -i "$remove" book.txt

    echo "Enter your choice :"
    read line_delete

    sed -i "${line_delete}d" book.txt
    echo "Record was removed."

}
