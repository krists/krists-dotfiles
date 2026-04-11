export ZSH=$HOME/.oh-my-zsh

if [ -d "$ZSH" ]; then
    ZSH_THEME="lambda"

    HIST_STAMPS="yyyy-mm-dd"

    plugins=(git extract)

    source $ZSH/oh-my-zsh.sh
else
  echo "oh-my-zsh is not installed at at $ZSH"
fi

if [[ -f "$HOME/.aliases" ]]; then
  source $HOME/.aliases
fi

autoload -Uz compinit
compinit
ulimit -n 65536

export EDITOR=vim
