#!/bin/bash

## run (only once) processes which spawn with the same name
function run {
   if (command -v $1 && ! pgrep $1); then
     $@&
   fi
}

## run (only once) processes which spawn with different name

if (command -v start-pulseaudio-x11 && ! pgrep pulseaudio); then
    start-pulseaudio-x11 &
fi


# run nm-applet &
# run blueman-applet &
# run udiskie --tray &
# run "flatpak run io.crow_translate.CrowTranslate" &
# run redshift &

light -S 50 &
xrdb -merge ~/.Xresources &
run setxkbmap -option grp:alt_shift_toggle us,ru & 
#xrandr --output VGA-0 --mode 1280x1024 --rate 75 --right-of LVDS &
#nitrogen --set-zoom-fill --head=1 --no-recurse --random ~/Pictures/ &
nitrogen --set-zoom-fill --head=0 --no-recurse --random ~/Pictures/ &
notify-send "AwesomeWM Loaded"
