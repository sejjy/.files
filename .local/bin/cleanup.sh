#!/usr/bin/env bash

RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[34m"
RESET="\e[39m"

remove-orphans() {
	printf "%bRemoving orphaned packages...%b\n" "$BLUE" "$RESET"

	local orph=()
	mapfile -t orph < <(pacman -Qtdq)

	if ((${#orph[@]})); then
		sudo pacman -Rns "${orph[@]}" --noconfirm
	else
		printf "No orphaned packages found.\n"
	fi
}

clear-cache() {
	printf "\n%bClearing package cache...%b\n" "$BLUE" "$RESET"

	sudo paccache -rk1  # retain only one past version
	sudo paccache -ruk0 # remove all cached versions of uninstalled packages

	printf "\n%bPruning old AUR package cache...%b\n" "$BLUE" "$RESET"

	if [[ -d "$HOME/.cache/yay" ]]; then
		paccache -rk1 -c "$HOME/.cache/yay"
	else
		printf "%bYay cache directory not found.%b\n" "$RED" "$RESET"
	fi
}

main() {
	remove-orphans
	clear-cache

	printf "\n%bCleanup complete!%b\n" "$GREEN" "$RESET"
}

main
