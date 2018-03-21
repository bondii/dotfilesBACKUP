#!/usr/bin/env bash

icon="$HOME/.xlock/icon.png"
tmpbg='.tmp/screen.png'

(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
#convert "$icon" -scale 50% "$icon"
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
i3lock -e --radius 150 --insidecolor=00000000 --indpos="(w/2)-10:(h/2)+15" -i "$tmpbg"
