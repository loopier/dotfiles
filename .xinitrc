#!/bin/sh

# export DESKTOP_SESSION=plasma
# export KDEWM=/usr/bin/bubbles

setxkbmap gb extd -option caps:escape
xbindkeys

# KDE applications theme manager
export QT_QPA_PLATFORMTHEME="qt5ct"
# https://unix.stackexchange.com/questions/202588/how-can-i-set-the-default-font-size-for-all-qt5-apps
export QT_FONT_DPI=96

# use only 1 DBus for all apps -- fabian style
export DBUS_SESSION_BUS_ADDRESS=unix:path=/tmp/dbus-`id -u`
dbus-daemon --address="$DBUS_SESSION_BUS_ADDRESS" --session --print-address --fork

xrandr --output DP-0 --mode 2560x1440 --pos 0x0 --rotate normal --output HDMI-0 --off --output DP-1 --mode 1920x1080 --pos 2560x0 --rotate normal --output DP-2 --off # --scale '0.5x0.5'

xsetwacom set "Wacom Cintiq Pro 24 Pen stylus" MapToOutput HEAD-0
xsetwacom set "Wacom Cintiq Pro 24 Pen eraser" MapToOutput HEAD-0
xsetwacom set "Wacom Cintiq Pro 24 Pad pad" MapToOutput HEAD-0
xsetwacom set "Wacom Cintiq Pro 24 Touch Finger touch" MapToOutput HEAD-0
xsetwacom set "Wacom Experss Key Remote Pad pad" MapToOutput HEAD-0

wacom-map-expresskeyremote

slstatus &

# exec startplasma-x11
# exec bubbles-rc
exec dwm
