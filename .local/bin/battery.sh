#!/usr/bin/env bash
#
# Send a notification when the battery state changes
#
# Original script by Eric Murphy:
# https://github.com/ericmurphyxyz/dotfiles/blob/master/.local/bin/battery-charging
#
# Add the following to /etc/udev/rules.d/60-power.rules and replace <user> with
# your username:
#
# ACTION=="change", SUBSYSTEM=="power_supply", ATTR{type}=="Mains", ATTR{online}=="1", RUN+="/usr/bin/su <user> -c '~/.local/share/bin/battery-state.sh charging'"
# ACTION=="change", SUBSYSTEM=="power_supply", ATTR{type}=="Mains", ATTR{online}=="0", RUN+="/usr/bin/su <user> -c '~/.local/share/bin/battery-state.sh discharging'"
#
# Reload udev rules by running:
# sudo udevadm control --reload

export DBUS_SESSION_BUS_ADDRESS='unix:path=/run/user/1000/bus'

main() {
	local path
	path=$(upower -e | grep -m 1 'BAT')

	local level
	level=$(upower -i "$path" | awk '/percentage:/ {print $2}')
	level=${level%\%}

	local icon='battery-'
	if ((level == 100)); then
		icon+='100'
	else
		local icon_level=$(((level / 10) * 10))
		icon+=$(printf '%03d' "$icon_level")
	fi

	local state=$1
	if [[ $state == 'charging' ]]; then
		icon+="-$state"
	fi

	notify-send "Battery ${state^} (${level}%)" -i "$icon" -r 1525
}

main "$@"
