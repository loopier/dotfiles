#!/usr/bin/env bash
set -euo pipefail

WIDTH=1920
# HEIGHT=100
# font format:
# https://en.wikipedia.org/wiki/X_logical_font_description
# https://wiki.archlinux.org/title/X_Logical_Font_Description
# FONT='-*-iosevka-*-*-*-*-*-100-*-*-*-*-*-*'
FONT='-*-mononoki-*-*-*-*-*-100-*-*-*-*-*-*'

# SYSINFO=$(dzsysinfo.sh)
# CONKY=$(dzconky.sh)
# VOL_ICO="^bg(grey70)^i(~/.local/share/icons/sm4rik-icons/spkr_01.xbm) bla"
# NETWORK="^ca(1, xfce4-terminal -H -x iwctl station wlan0 show; xfce4-terminal -x iwctl)$(dznetwork.sh)^ca()"



# COUNTER=$(while true; do date; sleep 1; done&)

# echo "$PACMAN ^ca(1, xfce4-terminal -x alsamixer)$VOL^ca()" | dzen2 -p -w "$WIDTH" -sa 'l' -ta 'c' -fn $FONT #\
    #-title-name 'popup_sysinfo' -e 'button1=exit;button3=exit'
# echo "$PACMAN|$VOL|$NETWORK|$DATE_TIME" | dzen2 -p -w "$WIDTH" -sa 'l' -ta 'r' -fn $FONT

# while true; do cat dzbar.conf; sleep 1; done | dzen2 -p -w "$WIDTH" -sa 'l' -ta 'r' -fn $FONT &

# setup
DATE_TIME=$(date +"%a %e/%m/%y %R")
PACMAN="^ca(1, xfce4-terminal -H -x pamac update; dzpamac.sh)$(dzpamac.sh)^ca()"
# VOL="vol:^ca(1, xfce4-terminal -x alsamixer)$(dzvol.sh)^ca()"

while true
do
    PACMAN="^ca(1, xfce4-terminal -H -x pamac update; dzpamac.sh)$(dzpamac.sh)^ca()"
    sleep 1h
done &

# update once per minute
while true
do
    DATE_TIME=$(date +"%a%e/%m/%y %R")
    sleep 1m
done &

# update once per second
update() {
    NETWORK="^ca(1, xfce4-terminal -H -x iwctl station wlan0 show; xfce4-terminal -x iwctl)$(dznetwork.sh)^ca()"
    VOL="^ca(1, xfce4-terminal -x alsamixer)$(dzvol.sh)^ca()"
    # cat dzbar.conf
    echo "$VOL$NETWORK$PACMAN $DATE_TIME"
}
while true; do update; sleep 1; done | dzen2 -p -w "$WIDTH" -sa 'l' -ta 'r' -fn $FONT &
