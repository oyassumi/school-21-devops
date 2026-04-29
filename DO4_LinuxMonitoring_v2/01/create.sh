#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

check_disk_space() {
    local available 
    available=$(df / | awk 'NR==2 {print $4}')
    local limit=1000000
    if (( available <= limit )); then
        return 1
    else
        return 0
    fi
}

create_folders() {
    local path="$1"
    local folders_count="$2"
    local letters="$3"

    local count=0
    local name="$letters"
    local log_file="$SCRIPT_DIR/../01/log.txt"
    local date_suffix="_$(date +%d%m%y)"

    [[ "$path" != "/" ]] && path="${path%/}"

    while (( ${#name} < 4 )); do
        name="${letters:0:1}$name"
    done

    while (( count < folders_count )); do

        if ! check_disk_space; then
            echo "Stopped: low disk space"
            break
        fi

        local dir_name="${path}/${name}${date_suffix}"

        mkdir -p "$dir_name" || {
            echo "Error creating directory"
            break
        }

        echo "dir $dir_name $(date -Iseconds)" >> "$log_file"

        create_files "$1" "$2" "$3" "$4" "$5" "$6" "$dir_name"

        ((count++))

        name+="${letters: -1}"
    done
}

create_files() {
    local path="$7"
    local files_count="$4"
    local letters_ext="$5"
    local size_kb="$6"

    local name="${letters_ext%.*}"
    local ext="${letters_ext#*.}"
    local log_file="$SCRIPT_DIR/../01/log.txt"
    local date_suffix="_$(date +%d%m%y)"
    local size="${size_kb//kb/K}"

    while (( ${#name} < 4 )); do
        name="${name:0:1}$name"
    done

    local count=0

    while (( count < files_count )); do

        if ! check_disk_space; then
            echo "Stopped: low disk space"
            break
        fi

        local file_name="${path}/${name}${date_suffix}.${ext}"

        fallocate -l "$size" "$file_name" 2>/dev/null || {
            echo "Error creating file"
            break
        }

        echo "file $file_name $(date -Iseconds) $size_kb" >> "$log_file"

        ((count++))

        name+="${name: -1}"
    done
}

