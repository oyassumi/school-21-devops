#!/bin/bash

generate_log() {
    local file_name=$1
    local log_date=$2

    local entries_count=$((RANDOM % 901 + 100)) 

    local total_seconds=0

    > "$file_name"

    for ((i=0; i<entries_count; i++))
    do
        ip=$(generate_ip)
        method=$(generate_method)
        status=$(generate_status)
        url=$(generate_url)
        agent=$(generate_agent)

        increment=$((RANDOM % 60))
        total_seconds=$((total_seconds + increment))

        hours=$((total_seconds / 3600))
        minutes=$(((total_seconds % 3600) / 60))
        seconds=$((total_seconds % 60))

        hours=$((hours % 24))

        time=$(printf "%02d:%02d:%02d" $hours $minutes $seconds)

        echo "$ip - - [$log_date:$time +0000] \"$method $url HTTP/1.1\" $status $((RANDOM % 5000 + 100)) \"-\" \"$agent\"" >> "$file_name"
    done
}
