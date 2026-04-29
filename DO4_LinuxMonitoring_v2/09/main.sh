#!/bin/bash

if [ $# -ne 0 ]; then
    echo "This script does not accept arguments"
    exit 1
fi

SCRIPT_DIR="$(dirname "$0")"
OUTPUT_FILE="/var/www/html/metrics.txt"

while true; do

        OUTPUT=$($SCRIPT_DIR/metrics.sh)

        CPU=$(echo "$OUTPUT" | awk 'NR==1')
        RAM=$(echo "$OUTPUT" | awk 'NR==2')
        DISK=$(echo "$OUTPUT" | awk 'NR==3')

        $SCRIPT_DIR/formatter.sh "$CPU" "$RAM" "$DISK" > "$OUTPUT_FILE"

    sleep 3
done
