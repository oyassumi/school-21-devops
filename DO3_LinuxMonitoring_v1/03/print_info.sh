#!/bin/bash

print_info() {
    local name_bg=${BG_COLORS[$BG_NAME]}
    local name_fg=${FG_COLORS[$FG_NAME]}
    local value_bg=${BG_COLORS[$BG_VALUE]}
    local value_fg=${FG_COLORS[$FG_VALUE]}

    echo -e "\e[${name_bg};${name_fg}mHOSTNAME\e[0m = \e[${value_bg};${value_fg}m$HOSTNAME\e[0m"
    echo -e "\e[${name_bg};${name_fg}mTIMEZONE\e[0m = \e[${value_bg};${value_fg}m$TIMEZONE\e[0m"
    echo -e "\e[${name_bg};${name_fg}mUSER\e[0m = \e[${value_bg};${value_fg}m$USER\e[0m"
    echo -e "\e[${name_bg};${name_fg}mOS\e[0m = \e[${value_bg};${value_fg}m$OS\e[0m"
    echo -e "\e[${name_bg};${name_fg}mDATE\e[0m = \e[${value_bg};${value_fg}m$DATE\e[0m"
    echo -e "\e[${name_bg};${name_fg}mUPTIME\e[0m = \e[${value_bg};${value_fg}m$UPTIME\e[0m"
    echo -e "\e[${name_bg};${name_fg}mUPTIME_SEC\e[0m = \e[${value_bg};${value_fg}m$UPTIME_SEC\e[0m"
    echo -e "\e[${name_bg};${name_fg}mIP\e[0m = \e[${value_bg};${value_fg}m$IP\e[0m"
    echo -e "\e[${name_bg};${name_fg}mMASK\e[0m = \e[${value_bg};${value_fg}m$MASK\e[0m"
    echo -e "\e[${name_bg};${name_fg}mGATEWAY\e[0m = \e[${value_bg};${value_fg}m$GATEWAY\e[0m"
    echo -e "\e[${name_bg};${name_fg}mRAM_TOTAL\e[0m = \e[${value_bg};${value_fg}m$RAM_TOTAL\e[0m"
    echo -e "\e[${name_bg};${name_fg}mRAM_USED\e[0m = \e[${value_bg};${value_fg}m$RAM_USED\e[0m"
    echo -e "\e[${name_bg};${name_fg}mRAM_FREE\e[0m = \e[${value_bg};${value_fg}m$RAM_FREE\e[0m"
    echo -e "\e[${name_bg};${name_fg}mSPACE_ROOT\e[0m = \e[${value_bg};${value_fg}m$SPACE_ROOT\e[0m"
    echo -e "\e[${name_bg};${name_fg}mSPACE_ROOT_USED\e[0m = \e[${value_bg};${value_fg}m$SPACE_ROOT_USED\e[0m"
    echo -e "\e[${name_bg};${name_fg}mSPACE_ROOT_FREE\e[0m = \e[${value_bg};${value_fg}m$SPACE_ROOT_FREE\e[0m"
}
