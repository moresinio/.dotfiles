#!/bin/bash
if pgrep gammastep >/dev/null; then
    pkill gammastep
    notify-send -t 3500 "RedGlow Stoped"
else
    gammastep -O 3400 &
    notify-send -t 3500 "RedGlow ON"
fi
