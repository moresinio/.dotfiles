#!/bin/bash
if pgrep gammastep >/dev/null; then
    pkill gammastep
    notify-send -t 700 "RedGlow Stoped"
else
    gammastep -O 3400 &
    notify-send -t 700 "RedGlow ON"
fi
