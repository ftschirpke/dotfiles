#!/bin/bash

MAIN_SERIAL='V30C2MWR'

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

for i in 1 2 3 4 5; do
    outputs=$(swaymsg -t get_outputs)
    if echo "$outputs" | grep -q "$MAIN_SERIAL"; then
        exec "$SCRIPT_DIR/monitor_mode.py" work
    fi
    sleep 0.4
done

exec "$SCRIPT_DIR/monitor_mode.py" laptop
