#!/bin/bash

MAIN_SERIAL='V5KPF680'
THIRD_SERIAL='V5KPF602'

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

for i in 1 2 3 4 5; do
    outputs=$(swaymsg -t get_outputs)
    if echo "$outputs" | grep -q "$MAIN_SERIAL" && echo "$outputs" | grep -q "$THIRD_SERIAL"; then
        exec "$SCRIPT_DIR/monitors_work.sh"
    fi
    sleep 0.4
done

exec "$SCRIPT_DIR/monitors_laptop.sh"
