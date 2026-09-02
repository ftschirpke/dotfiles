#!/usr/bin/env python3
# Apply a monitor layout: which outputs are on/off (and where), and which
# output each workspace belongs to. One table per mode instead of a
# hand-duplicated script per mode, so the "which workspace goes where"
# mapping can't drift between a preference list and a move list.
# Usage: monitor_mode.py <work|no_left|main_only|laptop>
import json
import subprocess
import sys

MAIN = 'Lenovo Group Limited T27p-30 V5KPF680'
THIRD = 'Lenovo Group Limited T27p-30 V5KPF602'
LAPTOP = 'eDP-1'

ALL_WS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
REST = [1, 2, 6, 7, 8, 9, 0]  # workspaces with no dedicated app/output rule

MODES = {
    'work': {
        'outputs': {
            THIRD: ('0 0', '3840x2160'),
            MAIN: ('3840 0', '3840x2160'),
            LAPTOP: ('4480 2160', '2560x1600'),
        },
        'workspaces': {**{w: MAIN for w in REST}, 3: LAPTOP, 4: LAPTOP, 5: THIRD},
    },
    'no_left': {
        'outputs': {
            THIRD: None,
            MAIN: ('3840 0', '3840x2160'),
            LAPTOP: ('4480 2160', '2560x1600'),
        },
        'workspaces': {**{w: MAIN for w in REST}, 3: LAPTOP, 4: LAPTOP, 5: LAPTOP},
    },
    'main_only': {
        'outputs': {
            THIRD: None,
            LAPTOP: None,
            MAIN: ('3840 0', '3840x2160'),
        },
        'workspaces': {w: MAIN for w in ALL_WS},
    },
    'laptop': {
        'outputs': {
            MAIN: None,
            THIRD: None,
            LAPTOP: ('0 0', None),
        },
        'workspaces': {w: LAPTOP for w in ALL_WS},
    },
}


def sway(cmd):
    subprocess.run(['swaymsg', cmd])


def sway_json(kind):
    out = subprocess.run(['swaymsg', '-t', kind], capture_output=True, text=True)
    return json.loads(out.stdout)


def q(name):
    return f'"{name}"' if ' ' in name else name


mode = sys.argv[1]
spec = MODES[mode]

focused = next((w['num'] for w in sway_json('get_workspaces') if w.get('focused')), None)

for name, state in spec['outputs'].items():
    if state is None:
        sway(f'output {q(name)} disable')
    else:
        pos, res = state
        sway(f'output {q(name)} enable pos {pos}' + (f' res {res}' if res else ''))

for ws, output in spec['workspaces'].items():
    sway(f'workspace {ws} output {q(output)}')

for ws, output in spec['workspaces'].items():
    sway(f'workspace number {ws}')
    sway(f'move workspace to output {q(output)}')

if focused is not None:
    sway(f'workspace number {focused}')
