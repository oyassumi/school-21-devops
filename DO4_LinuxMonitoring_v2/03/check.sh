#!/bin/bash

check_args () {

if [ $# -ne 1  ];then
        echo "Error: please enter 1 parameter"
        exit 1
fi

if [[ ! $1 =~ ^[1-3]$ ]]; then
    echo "Error: the parameter must be a number from 1 to 3"
    exit 1
fi
}

