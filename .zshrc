export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="lambda"

HIST_STAMPS="yyyy-mm-dd"

plugins=(git extract)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export EDITOR=vim

if [[ -d "$HOME/.bin" ]]; then
  export PATH="$HOME/.bin:$PATH"
fi

if [[ -f "$HOME/.rbenv/bin/rbenv" ]]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi


