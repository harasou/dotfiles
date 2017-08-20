#!/bin/bash -xe
 
GITHUB="harasou/dotfiles.git"
DOTFILES="
.bash_profile
.brewfile
.config/nvim/
.gitconfig
"

REPODIR="$HOME/src/github.com/${GITHUB%.git}"
BKUPDIR="$REPODIR/.backup/$(date +%Y%m%d%H%M%S)"
DOTBASE=".dotfiles"

# Clone Repository
if [ ! -d "$REPODIR" ] ; then
  git clone "https://github.com/$GITHUB" "$REPODIR"
  (cd $_ && git remote set-url origin git@github.com:$GITHUB)
fi

# Make BackupDir
[ -d "$BKUPDIR" ] || mkdir -p "$BKUPDIR"

# Make DotbaseDir
DOTBASEDIR="$HOME/$DOTBASE"
[ "$DOTBASEDIR" = "$REPODIR" ] && return
[ -L "$DOTBASEDIR" ] && unlink "$DOTBASEDIR"
[ -e "$DOTBASEDIR" ] && mv -v "$DOTBASEDIR" "$BKUPDIR"
ln -sv "$REPODIR" "$DOTBASEDIR"

# Link dotfiles
function linkdotfile(){
  local f="${1%/}"
  [ $(dirname $f) != "." ] && { mkdir -p "$HOME/$(dirname $f)"; DOTBASE="$DOTBASEDIR"; } 
  [ -L "$HOME/$f" ] && unlink "$HOME/$f"
  [ -e "$HOME/$f" ] && mv -v $HOME/$f "$BKUPDIR"
  ln -sv "$DOTBASE/$f" "$HOME/$f"
}

for dotfile in $DOTFILES
do
  linkdotfile $dotfile
done
  
rmdir "$BKUPDIR" 2>/dev/null
