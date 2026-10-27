#!/bin/sh
# Launch the work apps; the assign rules in the sway config place them.
swaymsg exec 'brave --new-window https://github.com/notifications'
swaymsg exec 'brave --app=https://calendar.google.com'
swaymsg exec obsidian
swaymsg exec slack
swaymsg exec thunderbird
swaymsg exec '$HOME/manual-installs/zotero'
