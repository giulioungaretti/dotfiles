#!/usr/bin/bash
# Start i3 WM
echo "" > /home/unga/.xinitrc
echo 'eval $(dbus-launch --sh-syntax --exit-with-session)' >> /home/unga/.xinitrc
echo 'exec i3' >> /home/unga/.xinitrc
xrdb ~/.Xresources
xmodmap ~/.Xmodmap
startx
