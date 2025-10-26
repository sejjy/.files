#!/usr/bin/env bash
#
# Send a notification when the battery state changes using udev rules
#
# Add the following to /etc/udev/rules.d/60-power.rules
# and replace <username> with your actual username:
#
# ACTION=="change", SUBSYSTEM=="power_supply", ATTR{type}=="Mains", ATTR{online}=="1", RUN+="/usr/bin/su <username> -c '~/.config/waybar/scripts/battery-state.sh charging'"
# ACTION=="change", SUBSYSTEM=="power_supply", ATTR{type}=="Mains", ATTR{online}=="0", RUN+="/usr/bin/su <username> -c '~/.config/waybar/scripts/battery-state.sh discharging'"
#
# Reload udev rules by running:
# sudo udevadm control --reload
#
# Author: Jesse Mirabel <sejjymvm@gmail.com>
# Created: August 15, 2025
# License: MIT

export DBUS_SESSION_BUS_ADDRESS='unix:path=/run/user/1000/bus'

main() {
	local path level
	path=$(upower -e | grep BAT | head -n 1)
	level=$(upower -i "$path" | awk '/percentage:/ {print $2}' | tr -d '%')

	local icon='battery-'
	local icon_level
	if ((level == 100)); then
		icon+='100'
	else
		icon_level=$(((level / 10) * 10))
		icon+=$(printf '%03d' "$icon_level")
	fi

	local state=${1^}
	[[ $state == 'Charging' ]] && icon+='-charging'

	notify-send "Battery $state (${level}%)" -i "$icon" -r 1525
}

main "$@"
