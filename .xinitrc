#!/bin/sh

# export DESKTOP_SESSION=plasma
# export QT_AUTO_SCREEN_SCALE_FACTOR=0
# export QT_SCALE_FACTOR=0.7
# export KDEWM=/usr/bin/bubbles


# [[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

xrandr --output DP-0 --off --output HDMI-0 --off --output DP-1 --off --output eDP-1-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal
# xrandr --output DP-0 --primary --mode 3840x2160 --pos 1920x0 --rotate normal --output HDMI-0 --off --output DP-1 --off --output eDP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal
setxkbmap gb extd -option caps:escape
# laptop
# xfce4-term&

exec startplasma-x11
# exec bubbles
