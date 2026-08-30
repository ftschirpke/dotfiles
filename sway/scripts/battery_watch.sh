#!/usr/bin/env bash

BAT_INFO=$(acpi -b)
STATUS=$(echo "$BAT_INFO" | grep -o "Discharging")
PERCENT=$(echo "$BAT_INFO" | grep -P -o '[0-9]+(?=%)')

if [ "$STATUS" = "Discharging" ]; then
    STATE_DIR="/tmp/sway-battery-state"
    mkdir -p "$STATE_DIR"

    if [ "$PERCENT" -le 20 ] && [ ! -f "$STATE_DIR/warn_20" ]; then
        notify-send -u critical "🚨 CRITICAL BATTERY: ${PERCENT}%" "Plug in immediately! You are about to lose your compilation work."
        touch "$STATE_DIR/warn_20"
    elif [ "$PERCENT" -le 30 ] && [ "$PERCENT" -gt 20 ] && [ ! -f "$STATE_DIR/warn_30" ]; then
        notify-send -u normal "⚠️ Low Battery: ${PERCENT}%" "Consider saving your work and finding a plug."
        touch "$STATE_DIR/warn_30"
    elif [ "$PERCENT" -le 40 ] && [ "$PERCENT" -gt 30 ] && [ ! -f "$STATE_DIR/warn_40" ]; then
        notify-send -u low "ℹ️ Battery Notice: ${PERCENT}%" "You're compiling on battery power. 70% limit drains fast."
        touch "$STATE_DIR/warn_40"
    fi
fi

if [ "$STATUS" != "Discharging" ]; then
    rm -rf /tmp/sway-battery-state
fi
