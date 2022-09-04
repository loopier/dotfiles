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

# exec startplasma-x11
# exec bubbles-rc
exec dwm
