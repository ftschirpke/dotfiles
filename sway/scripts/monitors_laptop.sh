#!/bin/bash

MAIN='Lenovo Group Limited T27p-30 V5KPF680'
THIRD='Lenovo Group Limited T27p-30 V5KPF602'
LAPTOP=eDP-1

swaymsg "output \"$MAIN\" disable"
swaymsg "output \"$THIRD\" disable"
swaymsg "output $LAPTOP enable pos 0 0"

for ws in 1 2 3 4 5; do
    swaymsg "workspace $ws output $LAPTOP"
done
