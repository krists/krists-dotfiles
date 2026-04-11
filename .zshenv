export LANG=en_US.UTF-8
export LANGUAGE=en_US:en
export LC_ALL=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=lv_LV.UTF-8
export LC_NUMERIC=lv_LV.UTF-8
export LC_TIME=lv_LV.UTF-8

if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -f /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

if command -v rbenv &>/dev/null; then
    eval "$(rbenv init - zsh)"
fi

export EDITOR=vim

if [[ -n "$HOMEBREW_PREFIX" ]]; then
  if [[ -d "$HOMEBREW_PREFIX/opt/node@22/bin" ]]; then
    export PATH="$HOMEBREW_PREFIX/opt/node@22/bin:$PATH"
  fi

  if [[ -d "$HOMEBREW_PREFIX/opt/postgresql@18/bin" ]]; then
    export PATH="$HOMEBREW_PREFIX/opt/postgresql@18/bin:$PATH"
  fi
fi

if [[ -d "$HOME/.local/bin" ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

if [[ -d "$HOME/.bin" ]]; then
  export PATH="$HOME/.bin:$PATH"
fi
