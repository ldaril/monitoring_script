#!/bin/bash

# Display the current date and time
echo "# Server Monitoring Report - $(date +"%F %k:%M:%S %Z")"

# Display basic OS information
echo ""
echo "## OS Information"
echo "  Hostname: $(hostname | cut -f 1 -d.)"
echo "  Architecture: $(uname -m)"
echo "  Kernel: $(uname -r)"