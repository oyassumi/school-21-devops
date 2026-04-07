#!/bin/bash

if [ $# -ne 0 ]; then
	echo "Error: no arguments allowed"
        exit 1
fi

source ./info.sh
source ./print_info.sh
source ./utils.sh

get_info
print_info
ask_to_save

