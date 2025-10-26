#!/usr/bin/env bash

RED='\033[1;31m'
GRN='\033[1;32m'
GRY='\033[1;30m'
RST='\033[0m'

sys-control() {
	local action=$1
	sudo systemctl "$action" httpd.service
	sudo systemctl "$action" mariadb.service
}

main() {
	printf '\n1. %b%b Start' "$GRN" "$RST"
	printf '\n2. %b%b Stop' "$RED" "$RST"
	printf '\n3. %b%b Status\n\n' "$GRY" "$RST"

	while true; do
		read -r -p 'Select an option: '

		case $REPLY in
			1 | [Ss]tart)
				# Apache (httpd.service)
				sudo mkdir -p /run/httpd
				sudo chown http:http /run/httpd

				# MariaDB (mariadb.service)
				sudo mkdir -p /run/mysqld
				sudo chown mysql:mysql /run/mysqld
				sudo chmod 755 /run/mysqld

				sys-control 'start'
				sudo SYSTEMD_COLORS=1 systemctl --no-pager status \
					httpd.service mariadb.service
				break
				;;
			2 | [Ss]top)
				sys-control 'stop'
				sudo SYSTEMD_COLORS=1 systemctl --no-pager status \
					httpd.service mariadb.service
				break
				;;
			3 | [Ss]tatus)
				sys-control 'status'
				break
				;;
			*)
				printf '%bInvalid option.%b\n\n' "$RED" "$RST"
				;;
		esac
	done
}

main
