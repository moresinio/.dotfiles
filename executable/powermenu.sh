#!/bin/bash
#lock="gtklock -f -S --idle-hide --idle-timeout 3"
lock=locker_blur.sh

#### Options ###
power_off="1:  Shutdown"
reboot="2: 󰜉 Reboot"
suspend="3:  Suspend"
hibernate="4: 󰒲 Hibernate"
log_out="5: 󰍃 Log Out"
lock_screen="6:  Lock Screen"

# Options passed to fuzzel
options="$power_off\n$reboot\n$suspend\n$hibernate\n$log_out\n$lock_screen"
lines="$(echo "$options" | grep -oF '\n' | wc -l)"
command="fuzzel -d -w 17 -l $((lines+1))"
chosen="$(echo -e "$options" | $command )"
case $chosen in
    "$lock_screen")
				exec "~/.local/bin/locker_blur.sh"
        ;;    
    "$power_off")
        loginctl poweroff
        ;;
    "$reboot")
        loginctl reboot
        ;;
    "$suspend")
        exec "~/.local/bin/locker_blur.sh" && loginctl suspend
        ;;
    "$hibernate")
        $lock && loginctl hibernate
        ;;
    "$log_out")
        loginctl terminate-session "${XDG_SESSION_ID-}"
        ;;
esac
