MYPYPATH="$HOME/shk-leser/synthetic_benchmarks/wfcommons"
export PYTHONPATH=$PYTHONPATH:$MYPYPATH

MYPATH=$HOME/manual-installs
MYPATH=$MYPATH:$HOME/.config/sway/scripts
MYPATH=$MYPATH:$HOME/.config/tmux/scripts

export PATH=$PATH:/bin:/usr/bin:$HOME/.local/bin:$PYTHONPATH:$MYPATH
