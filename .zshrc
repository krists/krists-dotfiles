export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="lambda"

HIST_STAMPS="yyyy-mm-dd"

plugins=(git extract)

source $ZSH/oh-my-zsh.sh

# lv_LV.UTF-8, en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US:en
export LC_ALL=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=lv_LV.UTF-8
export LC_NUMERIC=lv_LV.UTF-8
export LC_TIME=lv_LV.UTF-8


export EDITOR=vim

if [[ -d "$HOME/.bin" ]]; then
  export PATH="$HOME/.bin:$PATH"
fi

if [[ -f "$HOME/.rbenv/bin/rbenv" ]]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

if [[ -f "$HOME/.aliases" ]]; then
  source $HOME/.aliases
fi