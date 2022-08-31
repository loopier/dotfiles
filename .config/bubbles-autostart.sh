#!/bin/sh
# export GDK_SCALE=2
# export GDK_DPI_SCALE=0.5
# export QT_AUTO_SCREEN_SET_FACTOR=0
# export QT_SCALE_FACTOR=2
# export QT_FONT_DPI=96

xrandr --output DP-0 --mode 2560x1440 --pos 0x0 --rotate normal --output HDMI-0 --off --output DP-1 --mode 1920x1080 --pos 2560x0 --rotate normal --output DP-2 --off # --scale '0.5x0.5'

xsetwacom set "Wacom Cintiq Pro 24 Pen stylus" MapToOutput HEAD-0
xsetwacom set "Wacom Cintiq Pro 24 Pen eraser" MapToOutput HEAD-0
xsetwacom set "Wacom Cintiq Pro 24 Pad pad" MapToOutput HEAD-0
xsetwacom set "Wacom Cintiq Pro 24 Touch Finger touch" MapToOutput HEAD-0
xsetwacom set "Wacom Experss Key Remote Pad pad" MapToOutput HEAD-0

(sleep 3 && alacritty) &
