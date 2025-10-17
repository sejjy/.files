#!/usr/bin/env bash

RED='\033[1;31m'
GRN='\033[1;32m'
GRY='\033[1;30m'
RST='\033[0m'

printf '\n1. %b%b Start' "$GRN" "$RST"
printf '\n2. %b%b Stop' "$RED" "$RST"
printf '\n3. %b%b Status\n\n' "$GRY" "$RST"

while true; do
	read -r -p 'Select an option: '

	case $REPLY in
		1 | [Ss]tart)
			# apache (httpd.service)
			sudo mkdir -p /run/httpd
			sudo chown http:http /run/httpd

			# mariadb (mariadb.service)
			sudo mkdir -p /run/mysqld
			sudo chown mysql:mysql /run/mysqld
			sudo chmod 755 /run/mysqld

			# start services
			sudo systemctl restart httpd.service
			sudo systemctl restart mariadb.service

			# display status
			sudo SYSTEMD_COLORS=1 systemctl --no-pager status mariadb.service |
				cat | head -n 3
			sudo SYSTEMD_COLORS=1 systemctl --no-pager status httpd.service |
				cat | head -n 3
			exit
			;;
		2 | [Ss]top)
			# stop services
			sudo systemctl stop httpd.service
			sudo systemctl stop mariadb.service

			# display status
			sudo SYSTEMD_COLORS=1 systemctl --no-pager status mariadb.service |
				cat | head -n 3
			sudo SYSTEMD_COLORS=1 systemctl --no-pager status httpd.service |
				cat | head -n 3
			exit
			;;
		3 | [Ss]tatus)
			# check status
			sudo systemctl status httpd.service
			sudo systemctl status mariadb.service
			exit
			;;
		*) printf '%bInvalid option.%b\n\n' "$RED" "$RST" ;;
	esac
done
