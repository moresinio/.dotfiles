#!/bin/bash

# Source the file containing default temperature
source default_temp

# Check if gammastep is currently running
if pgrep gammastep >/dev/null; then
    # If gammastep is running, kill it and start with increased temperature
    current_temp=$((default_temp + 200))
    if (( current_temp > 4200 )); then
        notify-send -t 3500 "Temp can't exceed 4200K."
    else
        pkill gammastep
        gammastep -O "$current_temp" &
        notify-send -t 3500 "Temp $current_temp K"
        # Update default_temp in the separate file
        echo "default_temp=$((current_temp))" > default_temp
    fi
else
    default_temp=3000
    gammastep -O "$default_temp" &
    notify-send -t 3500 "RedGlow Started"
    echo "default_temp=$((default_temp))" > default_temp
fi
