#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/check.sh"
source "$SCRIPT_DIR/create.sh"

check_args "$@"
create_folders "$@"

