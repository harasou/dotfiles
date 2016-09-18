
alias ll='ls -lF'
alias la='ls -alF'

export GOPATH=$HOME
export PATH=$HOME/bin:$PATH

# brew
if which -s brew ; then
  PATH=/usr/local/bin:$PATH
fi

# ghq
which -s ghq && ghq=true || ghq=false

if $ghq && which -s peco ; then
  alias gl='repo="$(ghq root)/$(ghq list|peco)"; [ -d "$repo" ] && { cd "$repo" && clear && pwd ; }'
fi

# ssh
if $ghq && [ -x "$(ghq list -p sshwrapper)/ssh.sh" ] ; then
  alias ssh="$(ghq list -p sshwrapper)/ssh.sh"
fi

# anyenv
if [ -x "$HOME/.anyenv/bin/anyenv" ] ; then
  PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
fi
