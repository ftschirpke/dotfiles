#!/usr/bin/env bash

pids=$(ps -aux | rg xdg-desktop-portal | awk '{print $2}' | xargs)
echo "Killing $pids"
kill $pids

