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

if [[ -d "/usr/local/opt/node@22/bin" ]]; then
  export PATH="/usr/local/opt/node@22/bin:$PATH"
fi

if [[ -d "/usr/local/opt/postgresql@18/bin" ]]; then
  export PATH="/usr/local/opt/postgresql@18/bin:$PATH"
fi

if [[ -d "$HOME/.local/bin" ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

if [[ -d "$HOME/.bin" ]]; then
  export PATH="$HOME/.bin:$PATH"
fi

LDFLAGS=""
CPPFLAGS=""
PKG_CONFIG_PATH=""

if [[ -d "/usr/local/opt/node@22" ]]; then
  LDFLAGS="-L/usr/local/opt/node@22/lib $LDFLAGS"
  CPPFLAGS="-I/usr/local/opt/node@22/include $CPPFLAGS"
fi

if [[ -d "/usr/local/opt/postgresql@18" ]]; then
  LDFLAGS="-L/usr/local/opt/postgresql@18/lib $LDFLAGS"
  CPPFLAGS="-I/usr/local/opt/postgresql@18/include $CPPFLAGS"
  PKG_CONFIG_PATH="/usr/local/opt/postgresql@18/lib/pkgconfig:$PKG_CONFIG_PATH"
fi

[[ -n "$LDFLAGS" ]] && export LDFLAGS
[[ -n "$CPPFLAGS" ]] && export CPPFLAGS
[[ -n "$PKG_CONFIG_PATH" ]] && export PKG_CONFIG_PATH
