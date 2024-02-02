#!/bin/bash

# adapted from xss-lock documantation
# https://bitbucket.org/raymonad/xss-lock/src/1e158fb20108058dbd62bd51d8e8c003c0a48717/doc/dim-screen.sh

# Brightness will be lowered to this value.
min_brightness=0

# Set -time and -steps for fading
# to $min_brightness here. Setting steps to 1 disables fading.
fade_time=5000
fade_steps=400

###############################################################################

get_brightness() {
    light -G
}

set_brightness() {
    light -S 0
}


trap "exit 0" INT TERM
# kill background processes and set the brightness back to the original value
trap "kill \$(jobs -p); set_brightness $(get_brightness);" EXIT
sleep 2147483647 &
wait
