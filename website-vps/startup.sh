#!/bin/bash
echo "Running startup script..."
echo "hello" > sample.txt

## Startup file for running the base apps
# run nginx
nginx

# Keep the container running
tail -f /dev/null
