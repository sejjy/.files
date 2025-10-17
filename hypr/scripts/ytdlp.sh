#!/usr/bin/env bash

RED='\033[1;31m'
BLU='\033[1;34m'
RST='\033[0m'

check-deps() {
	if ! command -v yt-dlp &>/dev/null; then
		printf '%bError: %byt-dlp%b is not installed\n' "$RED" "$BLU" "$RST"
		exit 1
	fi
}

print-usage() {
	local scr=${0##*/}

	cat <<-EOF
		USAGE:
		    $scr <URL> <format> <dirname> <filename>

		    Use underscores (_) to skip optional arguments.
	EOF
	exit 1
}

download() {
	if [[ -z $format ]] || [[ $format == '_' ]]; then
		format='mp4'
	fi

	if [[ -z $dirname ]] || [[ $dirname == '_' ]]; then
		dir=~/Videos/Downloads
	fi

	if [[ -z $filename ]] || [[ $filename == '_' ]]; then
		name='%(title)s.%(ext)s'
	fi

	local file="$dir/$name"

	if [[ $format == 'mp3' ]]; then
		yt-dlp -f bestaudio -x --audio-format mp3 -o "$file" "$url"
	else
		yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' \
			-o "$file" "$url"
	fi
}

main() {
	url=$1
	format=$2
	dir=$3
	name=$4

	[[ -z $url ]] && print-usage

	check-deps
	download
}

main "$@"
