#!/usr/bin/env bash
#
# Take a screenshot of the target passed
#
# Author: Jesse Mirabel <sejjymvm@gmail.com>
# Created: January 2, 2025
# License: MIT

SDIR=$HOME/Pictures/Screenshots

if [[ ! -d $SDIR ]]; then
	mkdir -p "$SDIR"
fi

print-usage() {
	cat <<- EOF
		USAGE: ${0##*/} [TARGET]

		Take a screenshot of the target passed

		TARGETS:
		    active    Currently active window
		    area      Manually select a rectangular region or window
		    output    Currently active output
		    screen    Entire screen including all visible outputs
	EOF
	exit 1
}

main() {
	local name
	name="Screenshot_$(date +%Y%m%d_%H%M%S_%2N).png"
	local file="$SDIR/$name"

	local target=$1
	case $target in
		'area') grimblast --freeze copysave "$target" "$file" ;;
		'active' | 'output' | 'screen') grimblast copysave "$target" "$file" ;;
		*) print-usage ;;
	esac

	if [[ ! -s $file ]]; then
		rm -f "$file"
		exit 1
	fi

	notify-send "$name saved in $SDIR" -i "$file"
}

main "$@"
