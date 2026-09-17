#!/bin/bash

echo "Running integration tests..."

test_case() {
    input=$1
    expected=$2

    actual=$(./src/artifacts/DO "$input")

    if [ "$actual" = "$expected" ]; then
        echo "Success ✅ : test $input"
    else
        echo "Fail ❌: test $input"
        echo "Expected: $expected"
        echo "Actual: $actual"
        exit 1
    fi
}

test_case 1 "Learning to Linux"
test_case 2 "Learning to work with Network"
test_case 3 "Learning to Monitoring"
test_case 4 "Learning to extra Monitoring"
test_case 5 "Learning to Docker"
test_case 6 "Learning to CI/CD"

echo "All integration tests passed successfully!"
