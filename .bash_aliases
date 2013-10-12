#!/bin/bash
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

alias brspec='bundle exec rspec'
alias brails='bundle exec rails'
alias brake='bundle exec rake'
alias be='bundle exec '
alias lsports='netstat -lnptu'
alias ll='ls -lah'
alias gg='git status -s'
alias du='du -h'
alias dus='du -hs'
alias ..='cd ..'