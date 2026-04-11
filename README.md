Dotfiles
========
Configuration files for zsh, git, irb, gem, tmux, rubocop, and Zed.

## Install

```sh
rake install
```

Creates symlinks in `$HOME` pointing to files in this repo. Existing files with differing content are backed up with a timestamp suffix.

## Uninstall

```sh
rake uninstall
```

Removes symlinks that point to this repo. Other files are left untouched.