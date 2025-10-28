#!/usr/bin/env bash

RED='\033[1;31m'
BLU='\033[1;34m'
RST='\033[0m'

print-usage() {
	local script=${0##*/}

	cat <<- EOF
		USAGE: $script <URL> <format> <dirname> <filename>
	EOF

	exit 1
}

main() {
	local url=$1
	local fmt=${2:-'mp4'}
	local dir=${3:-"$HOME/Videos/Downloads"}
	local name=${4:-'%(title)s.%(ext)s'}

	if ! command -v yt-dlp > /dev/null; then
		printf '%bError: %byt-dlp%b is not installed\n' "$RED" "$BLU" "$RST"
		exit 1
	fi

	[[ -z $url ]] && print-usage

	local file="$dir/$name"

	if [[ $fmt == 'mp3' ]]; then
		yt-dlp -f bestaudio -x --audio-format mp3 -o "$file" "$url"
	else
		yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' \
			-o "$file" "$url"
	fi
}

main "$@"
