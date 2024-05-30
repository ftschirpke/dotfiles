
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias sFONDA='. /home/friedrich/.kube/set_fonda_config.sh'
alias sHU='. /home/friedrich/.kube/set_hu_config.sh'
alias sCPU='. /home/friedrich/.kube/set_cpu_config.sh'
alias l="ls -lisah"
alias bat=batcat
