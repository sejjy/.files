#!/usr/bin/env bash

DIR=~/Pictures/Screenshots

main() {
	local i=1
	while [[ -e "$DIR/Screenshot ($i).png" ]]; do
		((i++))
	done

	local name="Screenshot ($i).png"
	local target=$1
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
	fi
}

main "$@"
