#!/usr/bin/env bash

eval "$(keychain -q --agents gpg,ssh --eval ~/.ssh/github ~/.ssh/hu_gitlab ~/.ssh/tu_gitlab)"
