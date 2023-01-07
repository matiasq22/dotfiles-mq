#!/bin/sh

# systray battery icon
cbatticon -u 5 &
# systray volume
volumeicon &
nm-applet &
picom &
nitrogen --restore
xrandr --output HDMI-1 --mode 1920x1080 --right-of eDP-1
udiskie --no-automount --no-nofify --tray &
