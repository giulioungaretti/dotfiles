#! /bin/sh
# manage wifi stuff on ubuntu
sudo nmcli d wifi list
sudo nmcli d wifi connect 'name' password 'pwd'  iface wlan0
