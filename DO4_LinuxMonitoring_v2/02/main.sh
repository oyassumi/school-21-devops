#!/bin/bash

START_TIME=$(date +%s)

source ./check.sh
source ./create.sh

check_args "$@"

letters="$1"
letters_ext="$2"
size="$3"

create_folders "$letters" "$letters_ext" "$size"

END_TIME=$(date +%s)

DURATION=$((END_TIME - START_TIME))

echo "Start: $(date -d @$START_TIME)"
echo "End: $(date -d @$END_TIME)"
echo "Duration: ${DURATION} seconds"

echo "Start: $(date -d @$START_TIME)" >> log.txt
echo "End: $(date -d @$END_TIME)" >> log.txt
echo "Duration: ${DURATION} seconds" >> log.txt

