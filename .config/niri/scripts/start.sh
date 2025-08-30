#!/bin/bash

kanshi                                                &
waybar -c ~/.config/waybar/for_niri/config -s         \
~/.config/waybar/for_niri/style.css 									&
dunst                                                 &
pipewire                                              &
wl-paste -t text --watch clipman store --no-persist   &
blueman-applet                                        &
udiskie --tray                                        &
sleep 1 && swww-daemon                                &
disown
