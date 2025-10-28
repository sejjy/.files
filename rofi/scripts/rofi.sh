#!/usr/bin/env bash
#
# Display a Rofi menu based on the argument provided
#
# Requirements:
# 	- rofi
# 	- rofi-calc
# 	- rofi-emoji
# 	- cliphist
# 	- wl-clipboard
#
# Author: Jesse Mirabel <sejjymvm@gmail.com>
# Created: January 3, 2025
# License: MIT

main() {
	local arg=$1
	local dir="$XDG_CONFIG_HOME/rofi"

	case $arg in
		'A') # app launcher
			pkill rofi ||
				rofi -show drun -disable-history -show-icons \
					-config "$dir/app-launcher.rasi"
			;;
		'V') # clipboard
			pkill rofi ||
				cliphist list | rofi -dmenu -p ' ' -display-columns 2 \
					-config "$dir/clipboard.rasi" | cliphist decode | wl-copy
			;;
		'X') # calculator
			pkill rofi ||
				rofi -show calc -modi calc -no-show-match -no-sort \
					-no-history -lines 0 -terse -config "$dir/calculator.rasi" \
					-hint-welcome '' -hint-result '' -kb-accept-entry ''
			;;
		'M') # emoji picker
			pkill rofi ||
				rofi -modi emoji -show emoji -kb-secondary-copy '' \
					-kb-custom-1 Ctrl+c -kb-accept-alt '' \
					-config "$dir/emoji-picker.rasi" -emoji-format '{emoji}'
			;;
		'W') # window switcher
			pkill rofi ||
				rofi -show window -config "$dir/window-switcher.rasi"
			;;
	esac
}

main "$@"
