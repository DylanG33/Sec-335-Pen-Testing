#!/bin/bash

if [ $# -ne 2 ]; then
        echo "Usage: $0 hostfile portfile"
fi

hostfile=$1
if [ ! -f "$hostfile" ]; then
        echo "Error: Host file '$hostfile' not found."
        exit 1
fi

portfile=$2
if [ ! -f "$portfile" ]; then
        echo "Error: Port file '$portfile' not found."
        exit 1
fi

echo "host, port"
for host in $(cat $hostfile); do
        for port in $(cat $portfile); do
                timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null
                        echo "$host, $port"
        done
