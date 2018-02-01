#!/bin/sh
if [ -z "$1" ]; then
    echo "引数にADVERTISE_ADDR を設定してください（例：192.168.56.11）" 1>&2
    exit 1
fi

docker swarm init --advertise-addr=$1
