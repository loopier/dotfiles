#!/bin/sh

# export DESKTOP_SESSION=plasma
# export KDEWM=/usr/bin/bubbles

setxkbmap gb extd -option caps:escape
xbindkeys

# KDE applications theme manager
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_SCALE_FACTOR=0.5
# export QT_AUTO_SCREEN_SCALE_FACTOR=0

# use only 1 DBus for all apps -- fabian style
export DBUS_SESSION_BUS_ADDRESS=unix:path=/tmp/dbus-`id -u`
dbus-daemon --address="$DBUS_SESSION_BUS_ADDRESS" --session --print-address --fork

# exec startplasma-x11
exec bubbles-rc
