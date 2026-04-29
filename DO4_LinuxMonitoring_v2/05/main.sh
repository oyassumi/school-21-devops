#!/bin/bash

source ./check.sh
source ./functions.sh

check_args "$@"

log_dir="../04"

case "$1" in
    1)
        sort_by_response_code "$log_dir"
        ;;
    2)
        uniq_ip "$log_dir"
        ;;
    3)
        error_request "$log_dir"
        ;;
    4)
        uniq_error_ip "$log_dir"
        ;;
esac
