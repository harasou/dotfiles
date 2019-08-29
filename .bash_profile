
alias ll='ls -lF'
alias la='ls -alF'
alias vim='nvim'
alias opengithub='open $(git remote get-url origin|sed "s/^ssh/http/;s/[^/]*@//")'
alias brew="PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin brew" # for brew doctor

export GOPATH=$HOME
export PATH=$HOME/bin:$PATH

# brew
if which -s brew ; then
  PATH=/usr/local/sbin:/usr/local/bin:$PATH
fi

# ghq
which -s ghq && ghq=true || ghq=false

if $ghq && which -s peco ; then
  alias gl='repo="$(ghq list|peco)"; [ -n "$repo" ] && { cd "$(ghq root)/$repo" && clear && pwd ; }'
fi

# direnv
which -s direnv && eval "$(direnv hook bash)"

# anyenv
if [ -x "$HOME/.anyenv/bin/anyenv" ] ; then
  PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
fi

# bash-completaion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/harasou/google-cloud-sdk/path.bash.inc' ]; then source '/Users/harasou/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/harasou/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/harasou/google-cloud-sdk/completion.bash.inc'; fi
export PATH="/usr/local/opt/terraform@0.11/bin:$PATH"
