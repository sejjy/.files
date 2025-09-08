#!/usr/bin/env bash
set -e

red='\033[1;31m'
green='\033[1;32m'
blue='\033[1;34m'
reset='\033[0m'

url=$1
format=$2
dirname=$3
filename=$4

if ! command -v yt-dlp &>/dev/null; then
	echo -e "${red}Error: ${blue}yt-dlp${reset} is not installed"
	exit 1
fi

if [[ $url == '-h' || $url == '--help' || -z $url ]]; then
	echo -e "${red}Usage: ${blue}ytd ${green}<URL> <format> <dirname> <filename>${reset}"
	echo -e "Use '_' to skip optional arguments."
	exit 1
fi

[[ -z $format || $format == '_' ]] && format='mp4'
[[ -z $dirname || $dirname == '_' ]] && dirname="$HOME/Videos/Downloads"
[[ -z $filename || $filename == '_' ]] && filename='%(title)s.%(ext)s'

if [[ $format == 'mp3' ]]; then
	yt-dlp -f bestaudio -x --audio-format mp3 -o "${dirname}/${filename}" "$url"
else
	yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' \
		-o "${dirname}/${filename}" "$url"
fi
