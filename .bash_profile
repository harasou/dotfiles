export BASH_SILENCE_DEPRECATION_WARNING=1

alias ll='ls -lF'
alias vim='nvim'
alias gitopen='open $(git remote get-url origin|sed "s/^ssh/http/;s/[^/]*@//")'

export PATH=$HOME/bin:$PATH

# brew
if test -x /opt/homebrew/bin/brew; then
  eval $(/opt/homebrew/bin/brew shellenv)

  test -e /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc && . $_
  test -e /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc && . $_
fi

# direnv
which -s direnv && eval "$(direnv hook bash)"

# asdf
if which -s asdf; then
  PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
  . <(asdf completion bash)
fi

# ghq
if which -s ghq && which -s peco; then
  alias gl='repo="$(ghq list|peco)"; [ -n "$repo" ] && { cd "$(ghq root)/$repo" && clear && pwd ; }'
fi

# bash-competion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# secret
test -e .env_secret && . $_

eval "$(starship init bash)"
