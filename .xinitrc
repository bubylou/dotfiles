#theme
feh --bg-fill ~/Pictures/wheezy.png &
(conky | while read LINE; do xsetroot -name "$LINE"; done) &

#custom
xset -b &
xrdb -merge .Xresources &
xmodmap ~/.xmodmap &

#daemons
urxvtd -q -o -f &
unclutter -root &
mpd ~/.mpd/mpd.conf &
dropbox start &
xscreensaver &

#startup
firefox &
steam &
teamspeak &

#wm
exec i3
