#!/usr/bin/env bash

DIRNAME="$HOME/Pictures/Screenshots"

# find the next available filename
find_next() {
	local i=1

	while [[ -e "$DIRNAME/Screenshot ($i).png" ]]; do
		i=$((i + 1))
	done

	echo "Screenshot ($i).png"
}

filename=$(find_next)

format=$1
case $format in
	'active') grimblast copysave active "$DIRNAME/$filename" ;;
	'area') grimblast --freeze copysave area "$DIRNAME/$filename" ;;
	'screen') grimblast copysave screen "$DIRNAME/$filename" ;;
esac

if [[ -s "$DIRNAME/$filename" ]]; then
	notify-send -i "$DIRNAME/$filename" "$filename saved in $DIRNAME"
else
	rm "$DIRNAME/$filename"
fi
