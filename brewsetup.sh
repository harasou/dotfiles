#!/bin/bash

if ! which -s brew; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

BREW_PACKAGES="
  ansible
  autossh
  git
  go
  jq
  openssl
  packer
  rbenv
  tig
  vim
  motemen/ghq/ghq
  peco/peco/peco
  caskroom/cask/brew-cask
"
BREW_CASK_PACKAGES="
  alfred
  appcleaner
  dockertoolbox
  dropbox
  firefox
  google-chrome
  iterm2
  karabiner
  keepassx
  limechat
  macvim
  remote-desktop-connection
  scroll-reverser
  slack
  tunnelblick
  vagrant
  wireshark
  xtrafinder
"

for package in $BREW_PACKAGES ; do
  if brew list | grep -wq "^$(basename $package)" ; then
    echo "Skip: brew install $package"
  else
    brew install $package
  fi
done

for package in $BREW_CASK_PACKAGES; do
  if brew-cask list | grep -wq "^$(basename $package)" ; then
    echo "Skip: brew-cask install $package"
  else
    brew-cask install $package
  fi
done
