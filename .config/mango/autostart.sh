#!/bin/bash

set +e

# wllchng_swaybg.sh                                                &
waybar -c ~/.config/waybar/for_mangowc/config                    \
			 -s ~/.config/waybar/for_mangowc/style.css                 &
foot --server                                                    &
kanshi                                                           &
dunst                                                            &
pipewire                                                         &
wl-paste -t text --watch clipman store --no-persist              &
udiskie --tray                                                   &
blueman-applet                                                   &

swayidle -w \
	timeout 570 'notify-send -t 5000 \
	-h string:bgcolor:#900000 \
	-h string:fgcolor:#ffffff \
	-h string:frcolor:#ff0000 "LOCKING screen in 30 seconds"'  \
	timeout 600 'locker_blur.sh' \
	timeout 900 'wlr-dpms off' \
	resume 'wlr-dpms on' \
	before-sleep 'locker_blur.sh'                                  &

swww-daemon                                                      &
