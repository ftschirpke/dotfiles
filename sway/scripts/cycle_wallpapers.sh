#!/bin/bash

WALLPAPER_DIR="$HOME/wallpapers"
INDEX_FILE="$HOME/.config/sway/.wallpaper_index"
WALLPAPERS=($WALLPAPER_DIR/wp*.jpg)

TOTAL=${#WALLPAPERS[@]}

if [ ! -f "$INDEX_FILE" ]; then
    echo 0 > "$INDEX_FILE"
fi

INDEX=$(cat "$INDEX_FILE")
INDEX=$(( (INDEX + 1) % TOTAL ))
echo $INDEX > "$INDEX_FILE"

set_wallpapers.sh

