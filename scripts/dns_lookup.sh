#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <network_prefix> <dns_server>"
    echo "Example: $0 10.0.5 8.8.8.8"
    exit 1
fi

network_prefix=$1  # e.g., 10.0.5
dns_server=$2      # e.g., 8.8.8.8 (Google DNS)

for i in {1..254}; do
    ip="$network_prefix.$i"
    hostname=$(nslookup $ip $dns_server | grep 'name = ' | awk '{print $4}')
    
    if [ -n "$hostname" ]; then
        echo "IP: $ip -> Hostname: $hostname"
    fi
done
