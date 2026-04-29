#!/bin/bash

get_cpu() {
	LC_ALL=C top -bn1 | awk -F'[ ,]+' '/%Cpu/ {print 100 - $8}'
}

get_ram() {
	free -m | awk '/Mem:/ { print $2, $3, $7 }'
}

get_disk() {
	df -m / | awk 'NR==2 { print $2, $3, $4 }'
}

get_cpu
get_ram
get_disk
