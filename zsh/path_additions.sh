MYPYPATH="$HOME/shk-leser/synthetic_benchmarks/wfcommons"
export PYTHONPATH=$PYTHONPATH:$MYPYPATH

MYPREPATH=$HOME/ccache_aliases

MYPATH=$HOME/manual-installs
MYPATH=$MYPATH:$HOME/.config/tmux/scripts
MYPATH=$MYPATH:$HOME/.config/i3/scripts

export PATH=$MYPREPATH:$PATH:/bin:/usr/bin:$HOME/.local/bin:$PYTHONPATH:$MYPATH
