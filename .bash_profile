
alias ll='ls -lF'
alias la='ls -alF'

if which -s brew ; then
  PATH=/usr/local/bin:$PATH
fi

if which -s ghq ; then

  alias gl='repo=$(ghq list|peco);[ -z $repo ] || { eval cd "$(git config ghq.root)/$repo" && clear && pwd ; }'
 
  alias ssh="$(ghq list -p sshwrapper)/ssh.sh"

  # anyenv
  PATH="$(ghq list -p anyenv)/bin:$PATH"
  eval "$(anyenv init -)"

fi

export GOPATH=$HOME
export PATH=$HOME/bin:$PATH
