#!/bin/zsh

# profile file. Runs on login. Environmental variables are set here.

# If you don't plan on reverting to bash, you can remove the link in ~/.profile
# to clean up.

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':' -)"

# Default programs:
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="brave"
