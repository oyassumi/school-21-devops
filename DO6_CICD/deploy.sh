#!/bin/bash

set -e

scp ./src/artifacts/DO galya@10.10.0.2:/tmp/DO 
ssh galya@10.10.0.2 "sudo mv /tmp/DO /usr/local/bin/DO"
