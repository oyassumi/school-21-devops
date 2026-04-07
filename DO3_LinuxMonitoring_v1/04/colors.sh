#!/bin/bash

BG_COLORS=(0 47 41 42 44 45 40)
FG_COLORS=(0 97 91 92 94 95 90)

DEFAULT_BG_NAME=6
DEFAULT_FG_NAME=1
DEFAULT_BG_VALUE=2
DEFAULT_FG_VALUE=4

load_config() {
    source ./config.conf 2>/dev/null

    USE_DEFAULT_BG_NAME=false
    USE_DEFAULT_FG_NAME=false
    USE_DEFAULT_BG_VALUE=false
    USE_DEFAULT_FG_VALUE=false

    if [ -z "$column1_background" ]; then
        BG_NAME=$DEFAULT_BG_NAME
        USE_DEFAULT_BG_NAME=true
    else
        BG_NAME=$column1_background
    fi

    if [ -z "$column1_font_color" ]; then
        FG_NAME=$DEFAULT_FG_NAME
        USE_DEFAULT_FG_NAME=true
    else
        FG_NAME=$column1_font_color
    fi

    if [ -z "$column2_background" ]; then
        BG_VALUE=$DEFAULT_BG_VALUE
        USE_DEFAULT_BG_VALUE=true
    else
        BG_VALUE=$column2_background
    fi

    if [ -z "$column2_font_color" ]; then
        FG_VALUE=$DEFAULT_FG_VALUE
        USE_DEFAULT_FG_VALUE=true
    else
        FG_VALUE=$column2_font_color
    fi
}

check_colors() {
    for arg in "$BG_NAME" "$FG_NAME" "$BG_VALUE" "$FG_VALUE"; do
        if ! [[ $arg =~ ^[1-6]$ ]]; then
            echo "Error: parameters must be numbers from 1 to 6"
            exit 1
        fi
    done

    if [[ "$BG_NAME" -eq "$FG_NAME" ]] || [[ "$BG_VALUE" -eq "$FG_VALUE" ]]; then
        echo "Error: background and font colors cannot be the same"
        exit 1
    fi
}
