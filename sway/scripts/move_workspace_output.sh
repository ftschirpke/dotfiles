#!/bin/bash
# Move the focused workspace to the other active output. Directions like "up"
# only work when an output actually lies in that direction (sway doesn't wrap),
# so look up the non-focused output by name; works for any desk layout.
other=$(swaymsg -t get_outputs | python3 -c '
import json, sys
print(next((o["name"] for o in json.load(sys.stdin) if o["active"] and not o["focused"]), ""))')
[ -n "$other" ] && swaymsg move workspace to output "$other"
