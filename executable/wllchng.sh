#!/bin/sh

wall=$(find ~/Pictures/ -type f -name "*.jpg" -o -name "*.png" -o -name "*.gif" | shuf -n 1)

# Picks background wallpaper
swww img $wall
