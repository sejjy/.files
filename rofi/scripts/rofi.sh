#!/usr/bin/env bash
#
# Dependencies:
# 	rofi
# 	cliphist, wl-clipboard
# 	rofi-calc
# 	rofi-emoji

main() {
	local arg=$1
	local dir=$XDG_CONFIG_HOME/rofi

	case $arg in
		A) # app launcher
			pkill -x rofi ||
				rofi -show drun -disable-history -show-icons \
					-config "$dir/app-launcher.rasi"
			;;
		V) # clipboard
			pkill -x rofi ||
				cliphist list | rofi -dmenu -p ' ' -display-columns 2 \
					-config "$dir/clipboard.rasi" | cliphist decode | wl-copy
			;;
		X) # calculator
			pkill -x rofi ||
				rofi -show calc -modi calc -no-show-match -no-sort \
					-no-history -lines 0 -terse -config "$dir/calculator.rasi" \
					-hint-welcome '' -hint-result '' -kb-accept-entry ''
			;;
		M) # emoji picker
			pkill -x rofi ||
				rofi -modi emoji -show emoji -kb-secondary-copy "" \
					-kb-custom-1 Ctrl+c -kb-accept-alt "" \
					-config "$dir/emoji-picker.rasi" -emoji-format '{emoji}'
			;;
		W) # window switcher
			pkill -x rofi ||
				rofi -show window -config "$dir/window-switcher.rasi"
			;;
	esac
}

main "$@"
