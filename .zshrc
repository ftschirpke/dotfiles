# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/home/friedrich/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt autocd beep
bindkey -v
# End of lines configured by zsh-newuser-install


source ~/manual-installs/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# === USER CONFIG ===

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}


eval "$(keychain -q --agents gpg,ssh --eval ~/.ssh/github_shk ~/.ssh/gitlab_hu ~/.ssh/tu_gitlab)"

alias sFONDA='. /home/friedrich/.kube/set_fonda_config.sh'
alias sHU='. /home/friedrich/.kube/set_hu_config.sh'
alias sCPU='. /home/friedrich/.kube/set_cpu_config.sh'

alias l="ls -lisah"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
. "$HOME/.cargo/env"


export MYPYPATH="/home/friedrich/shk-leser/synthetic_benchmarks/wfcommons"
export PYTHONPATH=$PYTHONPATH:$MYPYPATH

MYPREPATH=/home/friedrich/ccache_aliases

MYPATH=/home/friedrich/manual-installs
MYPATH=$MYPATH:/home/friedrich/.config/tmux/scripts
MYPATH=$MYPATH:/home/friedrich/.config/i3/scripts
MYPATH=$MYPATH:/usr/local/go/bin

export PATH=$MYPREPATH:$PATH:/bin:/usr/bin:/home/friedrich/.local/bin:$PYTHONPATH:$MYPATH
. "$HOME/.cargo/env"


