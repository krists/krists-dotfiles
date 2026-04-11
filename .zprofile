export LANG=en_US.UTF-8
export LANGUAGE=en_US:en
export LC_ALL=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=lv_LV.UTF-8
export LC_NUMERIC=lv_LV.UTF-8
export LC_TIME=lv_LV.UTF-8

if [[ -f /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

if [[ -f /usr/local/bin/rbenv ]]; then
    eval "$(rbenv init - zsh)"
fi

if [[ -f /usr/local/bin/direnv ]]; then
    eval "$(direnv hook zsh)"
fi

export PATH="/usr/local/opt/node@22/bin:$PATH"
export PATH="/usr/local/opt/postgresql@18/bin:$PATH"

if [[ -d "$HOME/.local/bin" ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

if [[ -d "$HOME/.bin" ]]; then
  export PATH="$HOME/.bin:$PATH"
fi

export LDFLAGS="-L/usr/local/opt/node@22/lib -L/usr/local/opt/postgresql@18/lib"
export CPPFLAGS="-I/usr/local/opt/node@22/include -I/usr/local/opt/postgresql@18/include"
export PKG_CONFIG_PATH="/usr/local/opt/postgresql@18/lib/pkgconfig"
