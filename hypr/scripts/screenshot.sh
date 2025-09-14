#!/usr/bin/env bash

DIR="$HOME/Pictures/Screenshots"

i=1
while [[ -e "$DIR/Screenshot ($i).png" ]]; do
	((i++))
done

filename="Screenshot ($i).png"

format=$1
case $format in
	'screen') grimblast copysave screen "$DIR/$filename" ;;
	'active') grimblast copysave active "$DIR/$filename" ;;
	'area') grimblast --freeze copysave area "$DIR/$filename" ;;
esac

if [[ ! -s "$DIR/$filename" ]]; then
	rm "$DIR/$filename"
	exit 1
fi

notify-send -i "$DIR/$filename" "$filename saved in $DIR"
