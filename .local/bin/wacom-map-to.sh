#!/bin/sh
head="HEAD-$1"
# echo $head
# xsetwacom set "Wacom Cintiq Pro 16 Pen stylus" MapToOutput $DISPLAY
# xsetwacom set "Wacom Cintiq Pro 16 Pen eraser" MapToOutput $DISPLAY
# xsetwacom set "Wacom Cintiq Pro 16 Pad pad" MapToOutput $DISPLAY
# xsetwacom set "Wacom Cintiq Pro 16 Touch Finger touch" MapToOutput $DISPLAY
# xsetwacom set "Wacom Experss Key Remote Pad pad" MapToOutput $DISPLAY
xsetwacom set "Wacom Cintiq Pro 16 Pen stylus" MapToOutput $head;
xsetwacom set "Wacom Cintiq Pro 16 Pen eraser" MapToOutput $head;
xsetwacom set "Wacom Cintiq Pro 16 Pad pad" MapToOutput $head;
xsetwacom set "Wacom Cintiq Pro 16 Touch Finger touch" MapToOutput $head;
