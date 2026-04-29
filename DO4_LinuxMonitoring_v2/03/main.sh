#!/bin/bash

source ./check.sh
source ./remove.sh

check_args "$@"

mode=$1

case $mode in
    1)
        remove_by_log
        ;;
    2)
        remove_by_date
        ;;
    3)
        remove_by_mask
        ;;
esac
