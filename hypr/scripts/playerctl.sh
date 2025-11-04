#!/usr/bin/env bash

MAXLEN=40

get-output() {
	playerctl metadata --format "{{ markup_escape($1) }}" 2> /dev/null
}

main() {
	local status
	status=$(get-output 'status')

	case $status in
		'Playing') icon='󰐊' ;;
		'Paused') icon='󰏤' ;;
	esac

	local title artist
	title=$(get-output 'title')
	artist=$(get-output 'artist')

	local track="$title — $artist"
	if ((${#track} > MAXLEN)); then
		track=${track:0:MAXLEN}
		track+='…'
	fi

	echo "$icon $track"
}

main
