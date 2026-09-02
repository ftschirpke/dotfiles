#!/usr/bin/env python3
# Move the focused workspace to the next/previous active screen, cycling
# third -> main -> laptop (wrapping). sway's own "move workspace to output
# left/right" only works between outputs that are actually adjacent in that
# direction, which skips the laptop since it sits below main, not beside it.
import json
import subprocess
import sys

MAIN_SERIAL = "V5KPF680"
THIRD_SERIAL = "V5KPF602"
LAPTOP_NAME = "eDP-1"
CYCLE = ["third", "main", "laptop"]


def get(kind):
    out = subprocess.run(["swaymsg", "-t", kind], capture_output=True, text=True)
    return json.loads(out.stdout)


def canonical(output):
    if output["name"] == LAPTOP_NAME:
        return "laptop"
    serial = output.get("serial") or ""
    if MAIN_SERIAL in serial:
        return "main"
    if THIRD_SERIAL in serial:
        return "third"
    return None


direction = sys.argv[1] if len(sys.argv) > 1 else "next"

active = {canonical(o): o["name"] for o in get("get_outputs") if o.get("active") and canonical(o)}
order = [c for c in CYCLE if c in active]
if len(order) < 2:
    sys.exit(0)

focused = next((w for w in get("get_workspaces") if w.get("focused")), None)
if focused is None:
    sys.exit(0)

current = next((c for c, name in active.items() if name == focused["output"]), None)
if current not in order:
    sys.exit(0)

step = -1 if direction == "prev" else 1
target = active[order[(order.index(current) + step) % len(order)]]
subprocess.run(["swaymsg", f"move workspace to output {target}"])
