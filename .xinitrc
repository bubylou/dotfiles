#!/bin/sh
. ~/.profile
xset -b
xsetroot -cursor_name left_ptr
xrdb ~/.Xresources
xmodmap ~/.xmodmap &
feh --bg-fill ~/Pictures/wheezy.png &

urxvtd -q -o -f &
unclutter -root &
parcellite &
mpd ~/.mpd/mpd.conf &
mpd-notification &
dropbox start &
xscreensaver -no-splash &

firefox &
steam &
teamspeak &

sxhkd &
exec bspwm
