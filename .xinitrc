#!/bin/sh
source ~/.profile
xset -b
xsetroot -cursor_name left_ptr
xrdb ~/.Xresources
feh --bg-fill /mnt/hdd/Pictures/wheezy.png &

urxvtd -q -o -f &
unclutter -root &
xscreensaver -no-splash &
mpd ~/.mpd/mpd.conf &
mpd-notification &

google-chrome &
steam &
teamspeak &

sxhkd -f 100 &
exec bspwm
