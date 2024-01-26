#!/bin/bash

# Some limits will need to be increased in order to successfully build:
ulimit -n 8192
ulimit -u 512
ulimit -v 67108864
ulimit -t 1200

# Use the standard build process 
makeSwift "$@"
