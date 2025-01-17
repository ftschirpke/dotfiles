#!/usr/bin/env bash

eval "$(keychain -q --agents gpg,ssh --eval ~/.ssh/github ~/.ssh/tu_gitlab)"
