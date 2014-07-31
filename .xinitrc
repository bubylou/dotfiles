sh ~/.screenlayout/dual.sh &
xset -b &
xrdb -merge .Xresources &
xmodmap ~/.xmodmap &
feh --bg-fill ~/Pictures/wheezy.png &
(conky | while read LINE; do xsetroot -name "$LINE"; done) &

urxvtd -q -o -f &
unclutter -root &
parcellite &
mpd ~/.mpd/mpd.conf &
dropbox start &
xscreensaver &

firefox &
steam &
teamspeak &

exec i3
