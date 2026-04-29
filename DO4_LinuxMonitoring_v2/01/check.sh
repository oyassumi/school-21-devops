#!/bin/bash

check_args () {

if [ $# -ne 6  ];then
        echo "Error: please enter 6 parameters"
        exit 1
fi

if [[ $1 != /*  ]]; then
       echo "Error: parameter 1 must start with '/'"
       exit 1
fi

if [[ ! $2 =~ ^[1-9]+$ ]]; then
    echo "Error: parameter 2 must be a number greater than 0"
    exit 1
fi

if [[ ! $3 =~ ^[a-zA-Z]{1,7}$ ]]; then
        echo "Error: parameter 3 must contain only English letters (max 7 chars)"
        exit 1
fi

if [[ ! $4 =~ ^[0-9]+$ ]]; then
        echo "Error: parameter 4 must be a number"
        exit 1
fi

if [[ ! $5 =~ ^[a-zA-Z]{1,7}\.[a-zA-Z]{1,3}$ ]]; then
        echo "Error: parameter 5 must be 'name.ext' with name ≤7 letters, ext ≤3 letters"
        exit 1
fi

if [[ ! $6 =~ ^([1-9][0-9]?|100)kb$ ]]; then
        echo "Error: parameter 6 must be a number 1-100 followed by 'kb'"
        exit 1
fi
}

