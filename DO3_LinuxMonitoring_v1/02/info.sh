#!/bin/bash

get_info() {
	HOSTNAME=$(hostname)
	TIMEZONE="$(timedatectl | grep 'Time zone' | awk '{print $3}') UTC $(date +%:z)" 
        USER=$(whoami)
	OS=$(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')
	DATE=$(date "+%d %b %Y %H:%M:%S")
        UPTIME=$(uptime -p | sed 's/up //')
        UPTIME_SEC=$(awk '{print int($1)}' /proc/uptime)
	IP=$(hostname -I | awk '{print $1}')
	MASK=$(ifconfig | grep -w 'inet' | awk '{print $4}' | head -n 1)
	GATEWAY=$(ip route | grep default | awk '{print $3}')
	RAM_TOTAL=$(free -m | awk '/Mem:/{printf "%.3f GB", $2/1024}')
        RAM_USED=$(free -m | awk '/Mem:/{printf "%.3f GB", $3/1024}')
        RAM_FREE=$(free -m | awk '/Mem:/{printf "%.3f GB", $4/1024}')
        SPACE_ROOT=$(df / | awk 'NR==2 {printf "%.2f MB", $2/1024}')
	SPACE_ROOT_USED=$(df / | awk 'NR==2 {printf "%.2f MB", $3/1024}')
        SPACE_ROOT_FREE=$(df / | awk 'NR==2 {printf "%.2f MB", $4/1024}')	
}
