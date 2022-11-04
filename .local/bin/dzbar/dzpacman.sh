#!/bin/sh

FONT='-*-iosevka-*-*-*-*-*-100-*-*-*-*-*-*'

# UPDATES=$(sudo pacman -Syu -p | wc -l | xargs expr 4 -)
UPDATES=$(sudo pacman -Syu -p | wc -l | xargs bash -c 'echo $(($0 - 4))')

if [ $UPDATES -gt 0 ]; then
    UPDATE_COLOR='#ff6666'
    FG='#000000'
else
    UPDATE_COLOR='#1a1a1a'
    FG='#aaaaaa'
fi;

BG=$UPDATE_COLOR

# pending updates
echo "^bg($BG)^fg($FG)pkg:$UPDATES^fg()^bg()" # | dzen2 -p -ta c -w '100' -fn $FONT -fg $FG -bg $UPDATE_COLOR
