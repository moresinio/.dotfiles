#!/usr/bin/env bash
date +'%A, %B %d' # local time
echo "$USER@$HOSTNAME"
zone=$( date +'%Z' )
if [[ "$zone" =~ AEST.* ]]; then
    alt_zone='GB'
else
    alt_zone='AEST-10'
fi

time=$(TZ="$alt_zone" date +"%H:%M %Z")
echo
echo '<b>'"$time"'</b>' # you can use Pango markup (which will override the CSS)
