#!/bin/bash
# With only two outputs (main + laptop), sway falls back to "the other
# output" whenever there's no output in the exact direction requested, so
# "up" alone toggles the focused workspace between them either way.
swaymsg move workspace to output up
