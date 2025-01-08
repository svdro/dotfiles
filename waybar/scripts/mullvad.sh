#!/bin/bash

raw_status=$(mullvad status)
state=$(echo "$raw_status" | head -n1 | awk '{print $1}')
status=$(echo "$raw_status" | sed ':a;N;$!ba;s/\n/\\r/g' | sed 's/"/\\"/g')

case $state in
    "Connected")
        echo '{"text": "", "alt": "'"$state"'", "class": "connected", "tooltip": "'"$status"'"}'
        #echo '{"text": "", "alt": "--", "class": "connected", "tooltip": "tipp"}'
        ;;
    "Connecting")
        echo '{"text": "󰌾", "alt": "'"$state"'", "class": "connecting", "tooltip": "'"$status"'"}'
        ;;
    "Disconnected")
        echo '{"text": "", "alt": "'"$state"'", "class": "disconnected", "tooltip": "'"$status"'"}'
        ;;
    *)
        echo '{"text": "󰣮", "alt": "'"$state"'", "class": "error", "tooltip": "'"$status"'"}'
        ;;
esac


