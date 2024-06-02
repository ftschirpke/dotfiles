# manage ssh and gpg keys
. ~/.config/zsh/evaluate_keys.sh
export GPG_TTY=$(tty)

# only execute right after login
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]
then
    startx # start GUI
fi
