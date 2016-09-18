#!/bin/bash

if ! which -s brew; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if ! brew list --full-name | grep -q rcmdnk/file/brew-file ; then
    brew install rcmdnk/file/brew-file
fi

brew file install
