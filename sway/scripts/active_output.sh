#!/bin/bash

# Get the focused monitor
FOCUSED_MONITOR=$(swaymsg -t get_outputs --raw | jq -r '.[] | select(.focused==true) | .name')

echo $FOCUSED_MONITOR
