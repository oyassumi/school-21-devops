#!/bin/bash

if [ "$#" -ne 0 ]; then
    echo "Error: this script does not take arguments. Please remove them and try again."
    exit 1
fi

source ./colors.sh
source ./info.sh
source ./print_info.sh

load_config
check_colors
get_info
print_info
print_scheme
