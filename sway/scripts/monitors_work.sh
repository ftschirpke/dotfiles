#!/bin/bash

MAIN='Lenovo Group Limited T27p-30 V5KPF680'
THIRD='Lenovo Group Limited T27p-30 V5KPF602'
LAPTOP=eDP-1

swaymsg "output \"$THIRD\" enable pos 0 0 res 3840x2160"
swaymsg "output \"$MAIN\" enable pos 3840 0 res 3840x2160"
swaymsg "output $LAPTOP enable pos 4480 2160 res 2560x1600"

swaymsg "workspace 1 output \"$MAIN\""
swaymsg "workspace 2 output \"$MAIN\""
swaymsg "workspace 4 output \"$MAIN\""
swaymsg "workspace 3 output $LAPTOP"
swaymsg "workspace 5 output \"$THIRD\""

for ws in 1 2 4; do
    swaymsg "workspace number $ws"
    swaymsg "move workspace to output \"$MAIN\""
done

swaymsg "workspace number 3"
swaymsg "move workspace to output $LAPTOP"

swaymsg "workspace number 5"
swaymsg "move workspace to output \"$THIRD\""
