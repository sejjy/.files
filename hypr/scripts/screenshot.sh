#!/usr/bin/env bash

DIR=~/Pictures/Screenshots

get-filename() {
	local i=1
	while [[ -e "$DIR/Screenshot ($i).png" ]]; do
		((i++))
	done

	name="Screenshot ($i).png"
}

take-screenshot() {
	local file="$DIR/$name"

	if [[ $target == area ]]; then
		grimblast --freeze copysave "$target" "$file"
	else
		grimblast copysave "$target" "$file"
	fi

	if [[ -s $file ]]; then
		notify-send "$name saved in $DIR" -i "$file"
	else
		rm "$file"
		return 1
	fi
}

main() {
	target=$1

	get-filename
	take-screenshot || exit 1
}

main "$@"
