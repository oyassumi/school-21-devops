#!/bin/bash

CPU=$1
RAM=$2
DISK=$3

echo "cpu_usage $CPU"

echo "ram_total $(echo $RAM | awk '{print $1}')"
echo "ram_used $(echo $RAM | awk '{print $2}')"
echo "ram_available $(echo $RAM | awk '{print $3}')"

echo "disk_total $(echo $DISK | awk '{print $1}')"
echo "disk_used $(echo $DISK | awk '{print $2}')"
echo "disk_free $(echo $DISK | awk '{print $3}')"
