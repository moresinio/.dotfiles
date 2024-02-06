#!/bin/bash

## run (only once) processes which spawn with the same name
function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

## run (only once) processes which spawn with different name

if (command -v start-pulseaudio-x11 && ! pgrep pulseaudio); then
    start-pulseaudio-x11 &
fi


run wl-paste -t text --watch clipman store --no-persist &
run way-displays &
run --no-startup-id python ~/.config/sway/scripts/inactive-windows-transparency.py &
run blueman-applet &
run udiskie --tray &
run mako &

run light -S 50 &
###
notify-send "AwesomeWM Loaded 
...  
Enter the void"
###
