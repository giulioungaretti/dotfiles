#!/usr/bin/bash
# Start gnome-session

echo "dbus-launch --exit-with-session gnome-session" >  /home/unga/.xinitrc
xrdb ~/.Xresources
xmodmap ~/.Xmodmap
startx
