#!/bin/bash
set -e
 
DOTFILES="
.bash_profile
.gitconfig
.gvimrc
.vim/
.vimperatorrc
.vimrc
"

REPO="git@github.com:harasou/dotfiles.git"
REPODIR="$HOME/src/github.com/harasou/dotfiles"
BKUPDIR="$REPODIR/.backup/$(date +%Y%m%d%H%M%S)"
DOTBASE=".dotfiles"

function clone_repository(){
  [ -d "$REPODIR" ] || git clone --recursive "$REPO" "$REPODIR"
}

function make_backupdir(){
  [ -d "$BKUPDIR" ] || mkdir -p "$BKUPDIR"
}

function make_dotbase(){
  local dotd="$HOME/$DOTBASE"
  [ "$dotd" = "$REPODIR" ] && return
  [ -L "$dotd" ] && unlink "$dotd"
  [ -e "$dotd" ] && mv -v "$dotd" "$BKUPDIR"
  ln -sv "$REPODIR" "$dotd"
}

function linkdotfile(){
  local f="${1%/}"
  [ -L "$HOME/$f" ] && unlink "$HOME/$f"
  [ -e "$HOME/$f" ] && mv -v $HOME/$f "$BKUPDIR"
  ln -sv "$DOTBASE/$f" "$HOME/$f"
}


clone_repository
make_backupdir
make_dotbase

for dotfile in $DOTFILES
do
  linkdotfile $dotfile
done
  
rmdir "$BKUPDIR" 2>/dev/null
