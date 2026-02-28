#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
  local src="$1" dest="$2"
  if [[ -e "$dest" && ! -L "$dest" ]]; then
    echo "  backing up $dest -> ${dest}.bak"
    mv "$dest" "${dest}.bak"
  fi
  ln -sfn "$src" "$dest"
  echo "  linked $dest -> $src"
}

deploy_git() {
  echo "==> git"
  link "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
}

deploy_tmux() {
  echo "==> tmux"
  link "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
  link "$DOTFILES_DIR/tmux/.tmux.gruvbox.conf" "$HOME/.tmux.gruvbox.conf"
}

deploy_nvim() {
  echo "==> nvim"
  mkdir -p "$HOME/.config"
  link "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
}

deploy_zsh() {
  echo "==> zsh"
  # Add zsh config links here as files are added to zsh/
}

TARGET="${1:-all}"

case "$TARGET" in
  all)  deploy_git; deploy_tmux; deploy_nvim; deploy_zsh ;;
  git)  deploy_git ;;
  tmux) deploy_tmux ;;
  nvim) deploy_nvim ;;
  zsh)  deploy_zsh ;;
  *)
    echo "Unknown target: $TARGET"
    echo "Usage: $0 [all|git|tmux|nvim|zsh]"
    exit 1
    ;;
esac

echo "Done."
