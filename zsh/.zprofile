# manage ssh and gpg keys
. ~/.config/zsh/evaluate_keys.sh
export GPG_TTY=$(tty)

source $ZDOTDIR/aliases.sh

# path adjustments
source $ZDOTDIR/path_additions.sh

# only execute right after login
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]
then
    startx # start GUI
fi
