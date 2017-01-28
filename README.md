```
                            _ 
                           (_)

```

# linux preps (mostly ubuntu)
- allow bitmap fonts
```
# "Un-disable" bitmap fonts
sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf
# Clear the font cache
sudo fc-cache -f -v
````
move fonts into ~/.fonts
