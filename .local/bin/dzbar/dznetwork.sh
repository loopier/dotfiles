#!/bin/sh

NETWORK_STATE=$(iwctl station wlan0 show | awk '/State/ {print $2}')
# NETWORK=$(iwctl station wlan0 show | awk '/network/ {print $3}')
NETWORK="W"

if [ "$NETWORK_STATE" = "connected" ]; then
    CONNECTION_FG='#000000'
    CONNECTION_BG='#66aa66'
else
    CONNECTION_FG='#000000'
    CONNECTION_BG='#dd6666'
fi;

echo "^bg($CONNECTION_BG)^fg($CONNECTION_FG)^r(10x20) $NETWORK ^fg()^bg()" # | dzen2 -p -ta c -w '100' -fn $FONT -fg $FG -bg $CONNECTION_COLOR
