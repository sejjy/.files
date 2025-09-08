#!/usr/bin/env bash

# This script removes orphaned packages and
# clears package cache for both pacman and yay.
# It keeps one (1) current and two (2) old versions of each package.

red='\033[1;31m'
green='\033[1;32m'
blue='\033[1;34m'
reset='\033[0m'

YAY_CACHE_DIR="$HOME/.cache/yay"

echo -e "\n${blue}Removing orphaned packages...${reset}"

orphaned=$(pacman -Qtdq)

if [[ -n "$orphaned" ]]; then
	sudo pacman -Rns "$orphaned"
else
	echo 'No orphaned packages found.'
fi

echo -e "\n${blue}Clearing package cache...${reset}"

sudo paccache -rk2 2>/dev/null
sudo paccache -ruk0 2>/dev/null

echo -e "\n${blue}Pruning old AUR package cache...${reset}"

if [[ -d "$YAY_CACHE_DIR" ]]; then
	paccache -rk2 --cachedir "$YAY_CACHE_DIR"
else
	echo -e "\n${red}Yay cache directory not found.${reset}"
fi

echo -e "\n${green}Cleanup complete!${reset}"
