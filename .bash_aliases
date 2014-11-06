#!/bin/bash
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

alias lsports='sudo netstat -lnptu'
alias ll='ls -lah'
alias gg='git status -s'
alias du='du -h'
alias dus='du -hs'
alias ..='cd ..'

alias gdh='git diff --color HEAD'
alias ggdh='git difftool HEAD'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias sniff='sudo tcpdump -A -n -s 0 host '
alias rev_lookup='dig +noall +answer -x '

alias server="open http://localhost:3333 && ruby -rwebrick -e'WEBrick::HTTPServer.new(:Port => 3333, :DocumentRoot => Dir.pwd).start'"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias flush_dns="dscacheutil -flushcache;sudo killall -HUP mDNSResponder"
alias rebuild_open_with="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user"

# OS X has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# OS X has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

alias cleanup='find . -type f -name "*.orig" -or -name "*.DS_Store" | xargs rm'

# Pipe my public key to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"