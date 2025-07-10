#!/bin/bash

set -e  # Exit on any error

DOTFILES_DIR="$HOME/dotfiles"

echo "Linking top-level dotfiles..."
ln -sf "$DOTFILES_DIR/.bashrc" ~/.bashrc
ln -sf "$DOTFILES_DIR/.bash_profile" ~/.bash_profile
ln -sf "$DOTFILES_DIR/.tmux.conf" ~/.tmux.conf

echo "Linking Neovim config..."
mkdir -p ~/.config
ln -sf "$DOTFILES_DIR/.config/nvim" ~/.config/nvim

echo "Setting up Neovim Python virtual environment (if missing)..."
VENV_PATH="$HOME/.config/nvim/.venv"
if [ ! -x "$VENV_PATH/bin/python3" ]; then
  echo "Creating virtualenv at $VENV_PATH"
  python3 -m venv "$VENV_PATH"
  "$VENV_PATH/bin/pip" install --upgrade pip pynvim
else
  echo "Python venv already exists."
fi

echo "Dotfiles setup complete."
