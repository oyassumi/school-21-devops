#!/bin/bash

BG_COLORS=(0 47 41 42 44 45 40)
FG_COLORS=(0 97 91 92 94 95 90)

check_colors() {

    if [ $# -ne 4 ]; then
        echo "Please enter 4 parameters"
        exit 1
    fi

    for arg in "$@"; do
        if ! [[ $arg =~ ^[1-6]$ ]]; then
            echo "Error: all parameters must be numbers from 1 to 6"
            exit 1
        fi
    done

    local bg_name=$1
    local fg_name=$2
    local bg_value=$3
    local fg_value=$4

    if [[ "$bg_name" -eq "$fg_name" ]] || [[ "$bg_value" -eq "$fg_value" ]]; then
        echo "Error: background and font colors cannot be the same"
	echo "Please call the script again"
        exit 1
    fi

    export BG_NAME=$bg_name
    export FG_NAME=$fg_name
    export BG_VALUE=$bg_value
    export FG_VALUE=$fg_value
}
