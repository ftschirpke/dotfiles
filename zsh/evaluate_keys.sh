#!/usr/bin/env bash

eval "$(keychain -q --eval --immediate ~/.ssh/github ~/.ssh/tum_gitlab ~/.ssh/tum_free_gitlab ~/.ssh/gitlab_com)"
