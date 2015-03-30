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
  node
  openssl
  packer
  rbenv
  sshpass
  tig
  vim
  motemen/ghq/ghq
  peco/peco/peco
  caskroom/cask/brew-cask
"
BREW_CASK_PACKAGES="
  alfred
  appcleaner
  dropbox
  firefox
  google-chrome
  iterm2
  karabiner
  keepassx
  limechat
  macvim
  marked
  remote-desktop-connection
  scroll-reverser
  slack
  tunnelblick
  vagrant
  virtualbox
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
