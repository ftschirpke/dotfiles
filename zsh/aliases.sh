
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls="ls --color=auto"
    alias dir="dir --color=auto"
    alias vdir="vdir --color=auto"

    alias grep="grep --color=auto"
    alias fgrep="fgrep --color=auto"
    alias egrep="egrep --color=auto"
fi

alias sFONDA=". ~/.kube/set_fonda_config.sh"
alias sHU=". ~/.kube/set_hu_config.sh"
alias sCPU=". ~/.kube/set_cpu_config.sh"

alias l="ls -lisah"

alias ts="tmux-sessionizer"
alias eval-keys=". ~/.config/zsh/evaluate_keys.sh"