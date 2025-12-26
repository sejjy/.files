#!/usr/bin/env bash

zoom() {
	hyprctl keyword cursor:zoom_factor "$(hyprctl getoption cursor:zoom_factor |
		# v is value, f is factor
		awk -v v="$1" '/float/ { f = $2 + v; if (f < 1.0) f = 1.0; print f }')"
}

main() {
	# Match only digits with an optional `.`
	if [[ $1 =~ ^[+-]?[0-9]+\.?[0-9]*$ ]]; then
		zoom "$1"
	else
		hyprctl keyword cursor:zoom_factor 1.0
		printf "cursor:zoom_factor set to 1.0\n"
	fi
}

main "$@"
