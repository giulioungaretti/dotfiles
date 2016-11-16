xmodmap ~/.Xmodmap
xrdb -merge ~/.Xresources
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
xrandr --dpi 220
gsettings set org.gnome.desktop.interface scaling-factor 2
i3
