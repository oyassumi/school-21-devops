#!/bin/bash

dir="${1%/}"

count_dirs() {
	total_dirs=$(find "$dir" -type d | wc -l)
	echo "Total number of folders (including all nested ones) = $total_dirs"
}

top_dirs() {
    echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
    du -sh "$dir"/* 2>/dev/null | sort -hr | head -n 5 | awk '{print NR " - " $2 ", " $1 "B"}'
}

count_files() {
	total_files=$(find "$dir" -type f | wc -l)
	echo "Total number of files = $total_files"
}

count_file_types(){
	conf_files=$(find "$dir" -type f -name "*.conf" | wc -l)
	log_files=$(find "$dir" -type f -name "*.log" | wc -l)
	exec_files=$(find "$dir" -type f -executable | wc -l)
	archive_files=$(find "$dir" -type f \( -name "*.zip" -o -name "*.tar" -o -name "*.gz" -o -name "*.bz2" -o -name "*.7z" \) | wc -l)
	symlink_files=$(find "$dir" -type l | wc -l)
	txt_files=$(find "$dir" -type f -name "*.txt" | wc -l) 

	echo "Number of: "
	echo "Configuration files (with the .conf extension) = $conf_files"
	echo "Text files = $txt_files"
	echo "Executable files = $exec_files"
	echo "Log files (with the extension .log) = $log_files"
	echo "Archive files = $archive_files"
	echo "Symbolic links = $symlink_files"

}

top_files() {
    echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
    find "$dir" -type f -exec du -h {} + | sort -hr | sed -n '1,10'p | awk '{ext=""; file=$2; sub(".*/", "", file); if (index(file, ".") > 0) { n=split(file, arr, "."); ext=arr[n];} printf "%d - %s, %s%s\n", NR, $2, $1"B",(ext == "" ? "" : ", "ext)}'
}

top_exec_files() {
    echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
    i=1
    find "$dir" -type f -executable -exec du -h {} + | sort -hr | head -n 10 | while read -r size path; do
        hash=$(md5sum "$path" | awk '{print $1}')
        echo "$i - $path, ${size}B, $hash"
        i=$((i+1))
    done
}


get_all_info() {
    count_dirs "$dir"
    top_dirs "$dir"
    count_files "$dir"
    count_file_types "$dir"
    top_files "$dir"
    top_exec_files "$dir"
}

