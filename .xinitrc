#theme
feh --bg-fill ~/wheezy.png &
(conky | while read LINE; do xsetroot -name "$LINE"; done) &

#custom
xrdb -merge .Xresources &
xmodmap ~/.xmodmap &

#daemons
urxvtd -q -o -f &
unclutter -root &
mpd ~/.mpd/mpd.conf &

#wm
exec i3
