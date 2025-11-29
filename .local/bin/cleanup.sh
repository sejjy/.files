#!/usr/bin/env bash

RED='\033[1;31m'
GRN='\033[1;32m'
BLU='\033[1;34m'
RST='\033[0m'

remove-orphans() {
	printf '%bRemoving orphaned packages...%b\n' "$BLU" "$RST"

	local orph=()
	mapfile -t orph < <(pacman -Qtdq)

	if ((${#orph[@]})); then
		sudo pacman -Rns "${orph[@]}" --noconfirm
	else
		echo 'No orphaned packages found.'
	fi
}

clear-cache() {
	printf '\n%bClearing package cache...%b\n' "$BLU" "$RST"

	sudo paccache -rk2 2> /dev/null
	sudo paccache -ruk0 2> /dev/null

	printf '\n%bPruning old AUR package cache...%b\n' "$BLU" "$RST"

	local ydir=~/.cache/yay
	if [[ -d $ydir ]]; then
		paccache -rk2 --cachedir "$ydir"
		yay -Sc --noconfirm
	else
		printf '\n%bYay cache directory not found.%b\n' "$RED" "$RST"
	fi
}

main() {
	remove-orphans
	clear-cache

	printf '\n%bCleanup complete!%b\n' "$GRN" "$RST"
}

main
