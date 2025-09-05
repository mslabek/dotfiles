
# TODO: ensure stow is installed

stow --target "$HOME" bash
stow --target "$HOME" --ignore='.config/tmux/plugins' tmux
stow --target "$HOME" nvim
stow --target "$HOME" alacritty
stow --target "$HOME" zsh
stow --target "$HOME" ghostty
stow --target "$HOME" yazi
