#!/usr/bin/env bash
#
# Launch a Rofi menu based on the option passed
#
# Requirements:
# 	rofi
# 	rofi-calc
# 	rofi-emoji
# 	cliphist
# 	wl-clipboard
#
# Author:  Jesse Mirabel <sejjymvm@gmail.com>
# Date:    January 3, 2025
# License: MIT

usage() {
	cat <<- EOF
		USAGE: ${0##*/} [OPTION]

		Launch a Rofi menu based on the option passed

		OPTIONS:
		    a    app launcher
		    m    emoji picker
		    v    clipboard
		    w    window switcher
		    x    calculator
	EOF
	exit 1
}

main() {
	case $1 in
		"a") # App launcher
			pkill rofi ||
			      rofi -show drun       \
			           -show-icons      \
			           -disable-history \
			           -config "$HOME/.config/rofi/app-launcher.rasi"
			;;
		"m") # Emoji picker
			pkill rofi ||
			      rofi -modi emoji             \
			           -show emoji             \
			           -emoji-format "{emoji}" \
			           -kb-accept-alt ""       \
			           -kb-custom-1 Ctrl+c     \
			           -kb-secondary-copy ""   \
			           -config "$HOME/.config/rofi/emoji-picker.rasi"
			;;
		"v") # Clipboard
			pkill rofi ||
			cliphist list |
			      rofi -dmenu             \
			           -display-columns 2 \
			           -p " "            \
			           -config "$HOME/.config/rofi/clipboard.rasi" |
			cliphist decode |
			wl-copy
			;;
		"w") # Window switcher
			pkill rofi ||
			      rofi -show window \
			           -config "$HOME/.config/rofi/window-switcher.rasi"
			;;
		"x") # Calculator
			pkill rofi ||
			      rofi -show calc          \
			           -modi calc          \
			           -hint-welcome ""    \
			           -hint-result ""     \
			           -kb-accept-entry "" \
			           -lines 0            \
			           -no-history         \
			           -no-show-match      \
			           -no-sort            \
			           -terse              \
			           -config "$HOME/.config/rofi/calculator.rasi"
			;;
		*) usage ;;
	esac
}

main "$@"
