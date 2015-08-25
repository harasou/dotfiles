
alias ll='ls -lF'
alias la='ls -alF'

export GOPATH=$HOME
export PATH=$HOME/bin:$PATH

# brew
if which -s brew ; then
  PATH=/usr/local/bin:$PATH
fi

if which -s ghq ; then
  alias gl='repo=$(ghq list|peco);[ -z $repo ] || { eval cd "$(git config ghq.root)/$repo" && clear && pwd ; }'
  alias ssh="$(ghq list -p sshwrapper)/ssh.sh"
fi

# anyenv
if [ -x "$HOME/.anyenv/bin/anyenv" ] ; then
  PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
fi

# docker
#eval $(docker-machine env default)
