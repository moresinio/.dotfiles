#!/bin/bash

set +e

waybar -c ~/.config/waybar/for_maomao/config                     \
			 -s ~/.config/waybar/for_maomao/style.css                  &
foot --server                                                    &
kanshi                                                           &
dunst                                                            &
pipewire                                                         &
light -S 50                                                      &
wl-paste -t text --watch clipman store --no-persist              &
blueman-applet                                                   &
udiskie --tray                                                   &

swayidle -w \
	timeout 570 'notify-send -t 5000 \
	-h string:bgcolor:#900000 \
	-h string:fgcolor:#ffffff \
	-h string:frcolor:#ff0000 "LOCKING screen in 30 seconds"'  \
	timeout 600 locker_blur.sh                                     &
sleep 1 && swww-daemon                                           &
