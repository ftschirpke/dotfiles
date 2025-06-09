#!/bin/bash

WALLPAPER_DIR="$HOME/wallpapers"
INDEX_FILE="$HOME/.config/sway/.wallpaper_index"
WALLPAPERS=($WALLPAPER_DIR/wp*.jpg)

if [ ! -f "$INDEX_FILE" ]; then
    exit 0
fi

INDEX=$(cat "$INDEX_FILE")

swaymsg output "*" bg "${WALLPAPERS[$INDEX]}" fill
