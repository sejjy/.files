#!/usr/bin/env bash

MAXLEN=40

main() {
	local status
	status=$(playerctl metadata --format '{{ status }}' 2>/dev/null)

	case $status in
		Playing) icon='󰐊' ;;
		Paused) icon='󰏤' ;;
	esac

	local title
	title=$(playerctl metadata --format '{{ title }}' 2>/dev/null)

	local artist
	artist=$(playerctl metadata --format '{{ artist }}' 2>/dev/null)

	local track="${title} — ${artist}"
	local trlen=${#track}
	if ((trlen > MAXLEN)); then
		track="${track:0:$((MAXLEN - 1))}…"
	fi

	local output
	output=$(playerctl metadata --format "$icon $track" 2>/dev/null)

	echo "$output"
}

main
