#!/bin/bash


#
# brew
#
if ! which -s brew; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

#
# brew-file
#
if ! brew list --full-name | grep -q rcmdnk/file/brew-file ; then
    brew install rcmdnk/file/brew-file
fi

#
# other brew, cask, mas tools
#
brew file install

#
# anyenv
#
if [ ! -x "$HOME/.anyenv/bin/anyenv" ] ; then
    git clone --depth=1 https://github.com/riywo/anyenv $HOME/.anyenv
fi
