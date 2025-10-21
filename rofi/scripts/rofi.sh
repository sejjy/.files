#!/usr/bin/env bash
#
# A script to launch various Rofi menus.
#
# Dependencies:
#  - rofi
#  - rofi-calc
#  - rofi-emoji
#  - cliphist
#  - wl-clipboard
#
# Author: Jesse Mirabel <github.com/sejjy>
# Created: January 3, 2025
# License: MIT

main() {
	local arg=$1
	local dir=$XDG_CONFIG_HOME/rofi

	case $arg in
		'A') # App launcher
			pkill rofi ||
				rofi -show drun -disable-history -show-icons \
					-config "$dir/app-launcher.rasi"
			;;
		'V') # Clipboard
			pkill rofi ||
				cliphist list | rofi -dmenu -p ' ' -display-columns 2 \
					-config "$dir/clipboard.rasi" | cliphist decode | wl-copy
			;;
		'X') # Calculator
			pkill rofi ||
				rofi -show calc -modi calc -no-show-match -no-sort \
					-no-history -lines 0 -terse -config "$dir/calculator.rasi" \
					-hint-welcome '' -hint-result '' -kb-accept-entry ''
			;;
		'M') # Emoji picker
			pkill rofi ||
				rofi -modi emoji -show emoji -kb-secondary-copy '' \
					-kb-custom-1 Ctrl+c -kb-accept-alt '' \
					-config "$dir/emoji-picker.rasi" -emoji-format '{emoji}'
			;;
		'W') # Window switcher
			pkill rofi ||
				rofi -show window -config "$dir/window-switcher.rasi"
			;;
	esac
}

main "$@"
