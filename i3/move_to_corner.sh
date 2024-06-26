#!/bin/bash
# Inspired by Sofiane Hamlaoui's script: https://github.com/SofianeHamlaoui/movetocorner/blob/master/movetocorner.sh

selection=$1

echo "Script called with argument: $selection" >> /tmp/script.log

{ read max_x max_y ; } < <(xrandr -q | awk '/\yconnected\y/{ gsub("x|+", " ", $0); print $4 " " $5}')
{ read window_id ; } < <(xdotool getactivewindow)
{ read window_g_x window_g_y ; } < <(xdotool getwindowfocus getwindowgeometry | grep Geometry | cut -d ":" -f2 | sed 's/ //g' | sed 's/x/ /g')
half_x=$(( max_x / 2 ))
half_y=$(( max_y / 2 ))

quarter_window_x=$(( window_g_x / 4 ))
quarter_window_y=$(( window_g_y / 4 ))


case $selection in 
    'v') new_pos="0 $(( $max_y - window_g_y ))";;
    'r') new_pos="0 $(( $max_y - 2 * window_g_y ))";;
    'c') new_pos="$(($half_x - (2 * $quarter_window_x))) $(($half_y - (2 * $quarter_window_y)))";;
    'm') new_pos="$(($max_x - window_g_x)) $(( $max_y - window_g_y ))";;
    'u') new_pos="$(($max_x - window_g_x)) $(( $max_y - 2 * window_g_y ))";;
    *) echo "Invalid preset \"$selection\"" >&2; exit 2;;
esac 

xdotool windowmove $window_id $new_pos
