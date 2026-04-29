#!/bin/bash

export LC_TIME=C

source ./utils.sh
source ./create_log.sh

if [ $# -ne 0 ]; then
    echo "Script does not accept parameters"
    exit 1
fi

start_date=$(date -d "2026-04-10" +"%Y-%m-%d")

for i in {0..4}
do
    current_date=$(date -d "$start_date + $i day" +"%d/%b/%Y")
    file_name="nginx_log_$((i+1)).log"

    generate_log "$file_name" "$current_date"

    echo "Created $file_name"
done
