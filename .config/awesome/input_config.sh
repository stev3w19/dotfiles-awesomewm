#!/bin/sh

setxkbmap -layout gb -option caps:swapescape &

xsetroot -cursor_name left_ptr &
xinput set-prop "TPPS/2 Elan TrackPoint" "libinput Accel Speed" -0.3 &
# disables the touchpad 
xinput set-prop 10 "Device Enabled" 0 &

