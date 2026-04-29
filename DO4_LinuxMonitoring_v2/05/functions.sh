#!/bin/bash

sort_by_response_code() {
        awk '{print $0}' "$log_dir"/nginx_log_*.log | sort -k9,9n
}

uniq_ip() {
	awk '{print $1}' "$log_dir"/nginx_log_*.log | sort -u
}

error_request() {
	awk '$9 ~ /^[45][0-9][0-9]$/ {print $0}' "$log_dir"/nginx_log_*.log
}

uniq_error_ip(){
	awk '$9 ~ /^[45][0-9][0-9]$/ {print $1}' "$log_dir"/nginx_log_*.log | sort -u
}
