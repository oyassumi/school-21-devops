#!/bin/bash

LOG_FILE="log.txt"

check_disk_space() {
    local available
    available=$(df / | awk 'NR==2 {print $4}')
    local limit=1000000
    (( available > limit ))
}

get_random_path() {
    local paths

    mapfile -t paths < <(find / -maxdepth 3 -type d 2>/dev/null | grep -vE '/bin|/sbin')

    if (( ${#paths[@]} == 0 )); then
        echo "/tmp"
        return
    fi

    echo "${paths[$RANDOM % ${#paths[@]}]}"
}

generate_name() {
    local letters="$1"
    local name=""

    for ((i=0; i<${#letters}; i++)); do
        local char="${letters:i:1}"
        local repeat=$((RANDOM % 5 + 1))

        for ((j=0; j<repeat; j++)); do
            name+="$char"
        done
    done

    while (( ${#name} < 5 )); do
        name="${letters:0:1}$name"
    done

    echo "$name"
}

create_files() {
    local dir="$1"
    local letters_ext="$2"
    local size="$3"

    local name="${letters_ext%.*}"
    local ext="${letters_ext#*.}"

    local size_mb="${size/Mb/M}"
    local count=$((RANDOM % 10 + 1))

    for ((i=0; i<count; i++)); do
        check_disk_space || break

        local fname="$(generate_name "$name")_$(date +%d%m%y).$ext"

        fallocate -l "$size_mb" "$dir/$fname" 2>/dev/null || break

        echo "file $dir/$fname $(date -Iseconds) $size" >> "$LOG_FILE"
    done
}

create_one_folder() {
    local letters="$1"
    local letters_ext="$2"
    local size="$3"

    local path
    path=$(get_random_path)

    local dirname="$(generate_name "$letters")_$(date +%d%m%y)"
    local full_path="$path/$dirname"

    mkdir -p "$full_path" 2>/dev/null || return

    echo "dir $full_path $(date -Iseconds)" >> "$LOG_FILE"

    create_files "$full_path" "$letters_ext" "$size"
}

create_folders() {
    local letters="$1"
    local letters_ext="$2"
    local size="$3"

    while check_disk_space; do
        create_one_folder "$letters" "$letters_ext" "$size"
    done

    echo "Stopped: low disk space" >> "$LOG_FILE"
}

