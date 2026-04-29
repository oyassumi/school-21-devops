#!/bin/bash

check_args () {

if [ $# -ne 3  ];then
        echo "Error: please enter 3 parameters"
        exit 1
fi

if [[ ! $1 =~ ^[a-zA-Z]{1,7}$ ]]; then
        echo "Error: parameter 1 must contain only English letters (max 7 chars)"
        exit 1
fi

if [[ ! $2 =~ ^[a-zA-Z]{1,7}\.[a-zA-Z]{1,3}$ ]]; then
        echo "Error: parameter 2 must be 'name.ext' with name ≤7 letters, ext ≤3 letters"
        exit 1
fi


if [[ ! $3 =~ ^([1-9][0-9]?|100)Mb$ ]]; then

    echo "Error: parameter 3 must be a number between 1 and 100 followed by 'Mb'"
    exit 1
fi
}

