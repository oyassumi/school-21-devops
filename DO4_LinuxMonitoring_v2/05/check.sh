#!/bin/bash

check_args () {

if [ $# -ne 1 ];then
	echo "Error: please enter one parameter"
        exit 1
fi

if [[ ! $1 =~ ^[1-4]$ ]]; then
        echo "Error: the parameter must be a number from 1 to 4"
        exit 1
fi
}
