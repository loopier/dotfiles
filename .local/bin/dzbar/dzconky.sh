#!/bin/sh

# FG='#aaaaaa'
# BG='#1a1a1a'
# FONT='-*-terminus-*-r-normal-*-*-120-*-*-*-*-iso8859-*'
conky | dzen2 -p -e - -h '24' -w 600 -ta r -fg $FG -bg $BG -fn $FONT -e 'button1=exit;button3=exit' &
