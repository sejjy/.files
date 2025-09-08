#!/usr/bin/env bash

MAXLEN=40

status=$(playerctl metadata --format "{{ status }}" 2>/dev/null)
case $status in
	'Playing') icon="󰐊" ;;
	*) icon="󰏤" ;;
esac

title=$(playerctl metadata --format "{{ title }}" 2>/dev/null)
artist=$(playerctl metadata --format "{{ artist }}" 2>/dev/null)
output="${title} — ${artist}"

outlen=${#output}
if ((outlen > MAXLEN)); then
	output="${output:0:$((MAXLEN - 1))}…"
fi

output=$(playerctl metadata --format "$icon $output" 2>/dev/null)
echo "$output"
