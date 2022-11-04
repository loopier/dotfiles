#!/bin/sh

FONT='-*-iosevka-*-*-*-*-*-100-*-*-*-*-*-*'

UPDATES=$(pamac checkupdates | awk '/updates/ {print $1}')

if [[ -n $UPDATES ]]; then
    UPDATE_COLOR='#dd6666'
    FG='#000000'
    MSG=$UPDATES
else
    UPDATE_COLOR='#ccaa00'
    FG='#000000'
    MSG="P"
fi;

BG=$UPDATE_COLOR

# pending updates
echo "^bg($BG)^fg($FG) $MSG ^fg()^bg()" # | dzen2 -p -ta c -w '100' -fn $FONT -fg $FG -bg $UPDATE_COLOR
