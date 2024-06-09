# powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/manual-installs/powerlevel10k/powerlevel10k.zsh-theme
p10k_zsh="$ZDOTDIR/.p10k.zsh"
[[ ! -f $p10k_zsh ]] || source $p10k_zsh

# completion settings
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$ZDOTDIR/.zcompcache"
zstyle ':completion:*' menu select
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*' file-list all
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zmodload zsh/complist
bindkey -M menuselect '^p' vi-up-line-or-history
bindkey -M menuselect '^n' vi-down-line-or-history
bindkey -M menuselect '^z' accept-line

zstyle :compinstall filename "$ZDOTDIR/.zshrc"
autoload -U compinit
compinit
_comp_options+=(globdots)

# zsh options
unsetopt autocd beep
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

# zsh vim mode
bindkey -v
export KEYTIMEOUT=1
source $ZDOTDIR/vim_cursor_mode.sh

source $ZDOTDIR/aliases.sh

# zsh autosuggestions
source "$HOME/manual-installs/zsh-autosuggestions/zsh-autosuggestions.zsh"
bindkey '^z' autosuggest-accept

# zsh colors
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

eval "$(direnv hook zsh)"

# === ADDED BY INSTALL SCRIPTS ===

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
