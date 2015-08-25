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

REPO="harasou/dotfiles.git"
REPODIR="$HOME/src/github.com/harasou/dotfiles"
BKUPDIR="$REPODIR/.backup/$(date +%Y%m%d%H%M%S)"
DOTBASE=".dotfiles"

function clone_repository(){
  if [ ! -d "$REPODIR" ] ; then
    git clone --recursive "https://github.com/$REPO" "$REPODIR"
    (cd $_ && git remote set-url origin git@github.com:$REPO)
  fi
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
