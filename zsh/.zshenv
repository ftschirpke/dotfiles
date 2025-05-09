export EDITOR="nvim"
export VISUAL="nvim"

# direnv setup
export DIRENV_LOG_FORMAT=
eval "$(direnv hook zsh)"

# zsh settings
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

. "$HOME/.cargo/env"
