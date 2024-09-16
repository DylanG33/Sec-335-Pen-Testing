#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <network_prefix> <port>"
    echo "Example: $0 10.0.5 53"
    exit 1
fi

network_prefix=$1  # e.g., 10.0.5
port=$2            # e.g., 53

for i in {1..254}; do
    ip="$network_prefix.$i"
    timeout 1 bash -c "echo >/dev/tcp/$ip/$port" 2>/dev/null && echo "Port $port is open on $ip"
done

