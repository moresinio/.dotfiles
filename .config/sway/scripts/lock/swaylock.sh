#!/usr/bin/bash

# --image ~/Pictures/wallhaven-4oj627.jpg  \
source ~/.cache/wal/colors.sh


source ~/.cache/wal/colors.sh
exec swaylock                         \
	-S \
	--effect-blur 5x1  \
	--show-failed-attempts              \
  --image ~/Pictures/wallhaven-4oj627.jpg  \
	--font FiraCode Nerd Font           \
	--font-size 33                      \
	--scaling fill                      \
	--show-keyboard-layout              \
	--indicator-idle-visible            \
	--indicator-radius 100              \
	--indicator-thickness 10  	  	      \
	--bs-hl-color=$color1               \
	--inside-color=#00000080   \
	--inside-clear-color=#01c5b170   \
	--inside-ver-color=#00473060   \
	--inside-wrong-color=#b1192b60   \
	--key-hl-color=$color7  \
	--layout-bg-color=#00000060  \
	--layout-border-color=#00000060   \
	--layout-text-color=$color3   \
	--line-color=$color4  \
	--line-clear-color=#00000030   \
	--line-caps-lock-color=#d579fc26   \
	--line-ver-color=#16ca91   \
	--line-wrong-color=#b1192b   \
	--ring-color=$color3  \
	--ring-clear-color=#01c5b1   \
	--ring-caps-lock-color=#d376e2b7   \
	--ring-ver-color=#00473090   \
	--ring-wrong-color=#b1192b   \
	--separator-color=#b6bf0900   \
	--text-color=$color3   \
	--text-clear-color=#01c5b1   \
	--text-caps-lock-color=#fa703a04   \
	--text-ver-color=#16ca91   \
	--text-wrong-color=#b1192b   \
	--grace 5                           \   \
	--fade-in 0.2                       \
	--clock                             \
	--timestr '%H:%M'                   \
	--datestr '%Y-%m-%d'                \
	--indicator                         \ &
