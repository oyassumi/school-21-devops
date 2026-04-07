#!/bin/bash

start_time=$(date +%s.%N)

if [ $# -ne 1 ]; then
	echo "Error: please enter only one parameter"
        exit 1
fi

dir_path="$1"

if [[ $dir_path != */  ]]; then
       echo "Error: parameter must end with '/'"
       exit 1
fi

if [ ! -d "$dir_path" ]; then 
	echo "Error: directory does not exist" 
        exit 1
fi

source "$(dirname "$0")/get_dir_info.sh"

get_all_info "$dir_path"

end_time=$(date +%s.%N)

execution_time=$(echo "$end_time - $start_time" | bc)

LC_NUMERIC=C printf "Script execution time (in seconds) = %.2f\n" "$execution_time"

