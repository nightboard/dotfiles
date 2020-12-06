#!/bin/zsh

# profile file. Runs on login. Environmental variables are set here.

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':' -)"

# Default programs:
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="brave"
