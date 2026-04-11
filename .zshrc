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

if command -v direnv &>/dev/null; then
  eval "$(direnv hook zsh)"
fi

LDFLAGS=""
CPPFLAGS=""
PKG_CONFIG_PATH=""

if [[ -n "$HOMEBREW_PREFIX" ]]; then
  if [[ -d "$HOMEBREW_PREFIX/opt/node@22" ]]; then
    LDFLAGS="-L$HOMEBREW_PREFIX/opt/node@22/lib $LDFLAGS"
    CPPFLAGS="-I$HOMEBREW_PREFIX/opt/node@22/include $CPPFLAGS"
  fi

  if [[ -d "$HOMEBREW_PREFIX/opt/postgresql@18" ]]; then
    LDFLAGS="-L$HOMEBREW_PREFIX/opt/postgresql@18/lib $LDFLAGS"
    CPPFLAGS="-I$HOMEBREW_PREFIX/opt/postgresql@18/include $CPPFLAGS"
    PKG_CONFIG_PATH="$HOMEBREW_PREFIX/opt/postgresql@18/lib/pkgconfig:$PKG_CONFIG_PATH"
  fi
fi

[[ -n "$LDFLAGS" ]] && export LDFLAGS
[[ -n "$CPPFLAGS" ]] && export CPPFLAGS
[[ -n "$PKG_CONFIG_PATH" ]] && export PKG_CONFIG_PATH
