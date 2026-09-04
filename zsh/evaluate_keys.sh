#!/usr/bin/env bash

eval "$(keychain -q --eval --immediate ~/.ssh/github ~/.ssh/tum_gitlab)"
