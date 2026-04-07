#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Please enter one parameter"
	exit 1
fi

if [[ $1 =~ [0-9] ]]; then
	echo "Invalid input. Please enter a text parameter."
	exit 1
fi

echo "$1"


