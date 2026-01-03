#!/bin/bash

stow --target "$HOME" snippets
stow --target "$HOME" formatters
stow --target "$HOME" --ignore='.config/tmux/plugins' tmux
stow --target "$HOME" nvim
stow --target "$HOME" zsh
stow --target "$HOME" ghostty
stow --target "$HOME" yazi

