#!/usr/bin/env bash

player=$(playerctl metadata --format "{{ playerName }}" 2>/dev/null)

if [[ $player == "firefox" ]]; then
	icon="<span color='#f38ba8'>󰗃 </span>"
elif [[ $player == spotify* ]]; then
	icon="<span color='#a6e3a1'>󰓇 </span>"
else
	icon="󰐊 "
fi

status=$(playerctl metadata --format "{{ status }}" 2>/dev/null)

if [[ $status != "Playing" ]]; then
	icon="󰏤 "
fi

title=$(playerctl metadata --format "{{ title }}" 2>/dev/null)
artist=$(playerctl metadata --format "{{ artist }}" 2>/dev/null)

output="${title} — ${artist}"

maxlen=40
outlen=${#output}

if ((outlen > maxlen)); then
	output="${output:0:$((maxlen - 3))}..."
fi

output=$(playerctl metadata --format "$icon $output" 2>/dev/null)

echo "$output"
