#!/bin/sh
i3status --config ~/.i3status.conf | while :
do
    read line
    if ncmpcpp --now-playing; then
            mpd=$(ncmpcpp --now-playing)
    else
            mpd=''
    echo "$mpd | $line" || exit 1
    fi
done
