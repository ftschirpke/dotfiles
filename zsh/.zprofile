# manage ssh and gpg keys
. ~/.config/zsh/evaluate_keys.sh
export GPG_TTY=$(tty)

source $ZDOTDIR/aliases.sh

# path adjustments
source $ZDOTDIR/path_additions.sh

export XDG_CURRENT_DESKTOP=sway

# only execute right after login
if [[ -z $WAYLAND_DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]
then
    sway
fi
