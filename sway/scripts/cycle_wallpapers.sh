#!/bin/bash

WALLPAPER_DIR="$HOME/wallpapers"
INDEX_FILE="$HOME/.config/sway/.wallpaper_index"
WALLPAPERS=($WALLPAPER_DIR/wp*.jpg)

TOTAL=${#WALLPAPERS[@]}

# Create index file if not exists
if [ ! -f "$INDEX_FILE" ]; then
  echo 0 > "$INDEX_FILE"
fi

# Read, increment, and cycle index
INDEX=$(cat "$INDEX_FILE")
INDEX=$(( (INDEX + 1) % TOTAL ))
echo $INDEX > "$INDEX_FILE"

# Set the wallpaper using swaymsg
swaymsg output "*" bg "${WALLPAPERS[$INDEX]}" fill

