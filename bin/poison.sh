#!/usr/bin/bash
# Start ratPoison WM

echo "" > /home/unga/.xinitrc
echo 'eval $(dbus-launch --sh-syntax --exit-with-session)' >> /home/unga/.xinitrc
echo "exec /usr/bin/ratpoison" > /home/unga/.xinitrc
xrdb ~/.Xresources
xmodmap ~/.Xmodmap
startx
