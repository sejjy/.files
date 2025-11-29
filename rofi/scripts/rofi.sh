#!/usr/bin/env bash
#
# Launch a Rofi menu based on the argument passed
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
	local rdir=~/.config/rofi

	case $1 in
		'A')
			# App launcher
			pkill rofi ||
				  rofi -show drun -disable-history -show-icons \
					   -config "$rdir/app-launcher.rasi"
			;;
		'V')
			# Clipboard
			pkill rofi || cliphist list |
				  rofi -dmenu -p ' ' -display-columns 2 \
					   -config "$rdir/clipboard.rasi" | cliphist decode | wl-copy
			;;
		'X')
			# Calculator
			pkill rofi ||
				  rofi -show calc -modi calc -no-show-match -no-sort \
					   -no-history -lines 0 -terse -hint-welcome '' \
					   -hint-result '' -kb-accept-entry '' \
					   -config "$rdir/calculator.rasi"
			;;
		'M')
			# Emoji picker
			pkill rofi ||
				  rofi -modi emoji -show emoji -emoji-format '{emoji}' \
					   -kb-accept-alt '' -kb-secondary-copy '' \
					   -kb-custom-1 Ctrl+c -config "$rdir/emoji-picker.rasi"
			;;
		'W')
			# Window switcher
			pkill rofi || rofi -show window -config "$rdir/window-switcher.rasi"
			;;
		*) exit 1 ;;
	esac
}

main "$@"
