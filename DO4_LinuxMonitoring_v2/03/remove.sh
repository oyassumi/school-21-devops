#!/bin/bash

LOG_FILE="../02/log.txt"

remove_by_log() {
    if [ ! -f "$LOG_FILE" ]; then
        echo "Error: log file not found"
        exit 1
    fi

    while read -r line; do

        path=$(echo "$line" | awk '{print $2}')

        if [ -e "$path" ]; then
            rm -rf "$path" 2>/dev/null
            echo "Removed: $path"
        fi
    done < "$LOG_FILE"

    echo "Cleanup by log completed"
}

remove_by_date() {
    read -p "Enter start time (YYYY-MM-DD HH:MM): " start

    if [[ ! $start =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}\ [0-9]{2}:[0-9]{2}$ ]]; then
        echo "Error: invalid start format (use YYYY-MM-DD HH:MM)"
        exit 1
    fi

    read -p "Enter end time (YYYY-MM-DD HH:MM): " end

    if [[ ! $end =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}\ [0-9]{2}:[0-9]{2}$ ]]; then
        echo "Error: invalid end format (use YYYY-MM-DD HH:MM)"
        exit 1
    fi    

    tmp_start=$(mktemp)
    tmp_end=$(mktemp)

    touch -d "$start" "$tmp_start"
    touch -d "$end" "$tmp_end"

    find / -type d -newer "$tmp_start" ! -newer "$tmp_end" -name "*_??????" -exec rm -rf {} + 2>/dev/null
    find / -type f -newer "$tmp_start" ! -newer "$tmp_end" -name "*_??????.*" -exec rm -f {} + 2>/dev/null

    rm -f "$tmp_start" "$tmp_end"

    echo "Cleanup by date completed"
}

remove_by_mask() {
    read -p "Enter mask (e.g. az_130426): " mask

    if [[ ! $mask =~ ^[a-zA-Z]+_[0-9]{6}$ ]]; then
        echo "Error: invalid mask format"
        exit 1
    fi

    find / -type d -name "*$mask" -exec rm -rf {} + 2>/dev/null

    find / -type f -name "*$mask.*" -exec rm -rf {} + 2>/dev/null

    echo "Cleanup by mask completed"
}
