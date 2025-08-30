#!/bin/bash

corrupter="/home/rengoku/.local/bin/corrupter"
for o in LVDS-1 VGA-1
do
	grim -o "$o" "/tmp/$o.png"
	$corrupter -bheight 25 -add 5 -boffset 15 -lag 0.001 -mag 5 -meanabber 3 -stdabber 25 -stdoffset 25 "/tmp/$o.png" "/tmp/$o.png" &
	# magick "/tmp/$o.png" -channel RGBA -blur 0x3 "/tmp/$o.png"
done
wait
exec gtklock -d -f -S --idle-hide --idle-timeout 10
