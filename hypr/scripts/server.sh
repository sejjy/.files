#!/usr/bin/env bash

red='\033[1;31m'
green='\033[1;32m'
gray='\033[1;30m'
reset='\033[0m'

echo -e "\n1) ${green}${reset} Start"
echo -e "2) ${red}${reset} Stop"
echo -e "3) ${gray}${reset} Status\n"

while true; do
	read -r -p "Select an option: "

	case $REPLY in
		1)
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
		2)
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

		3)
			# check status
			sudo systemctl status httpd.service
			sudo systemctl status mariadb.service
			exit
			;;
		*)
			echo -e "${red}Invalid option${reset}\n"
			;;
	esac
done
