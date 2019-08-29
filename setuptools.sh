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
if ! brew list rcmdnk/file/brew-file >/dev/null 2>&1 ; then
    brew install rcmdnk/file/brew-file
fi

#
# other brew, cask, mas tools
#
brew file install

#
# anyenv
#
if [ ! -x "$HOME/.anyenv/bin/anyenv" ]; then
    git clone https://github.com/riywo/anyenv $HOME/.anyenv
    git clone https://github.com/znz/anyenv-update.git $HOME/.anyenv/plugins/anyenv-update
fi
