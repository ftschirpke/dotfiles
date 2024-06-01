if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]
then
    # this if-body only executes right after login
    setleds -D +num # activate numlock

    startx # start GUI
fi


# manage ssh and gpg keys
eval "$(keychain -q --agents gpg,ssh --eval ~/.ssh/github ~/.ssh/hu_gitlab ~/.ssh/tu_gitlab)"
export GPG_TTY=$(tty)
