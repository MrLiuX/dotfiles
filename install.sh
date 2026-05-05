#!/usr/bin/env bash

# Dotfiles installer — symlinks config files from this repo to their expected
# paths under $HOME.  Safe to re-run: existing regular files are backed up,
# existing symlinks are left alone if they already point to the right place,
# broken or wrong-target symlinks are replaced.

set -euo pipefail

DOTDIR="$(cd "$(dirname "$0")" && pwd)"

# ── link src (relative to DOTDIR) → dest (absolute or relative to $HOME) ─────
link_file() {
    local src="$1"
    local dest="$2"

    local abs_src="$DOTDIR/$src"
    local abs_dest
    case "$dest" in
        /*) abs_dest="$dest" ;;
        *)  abs_dest="$HOME/$dest" ;;
    esac

    if [[ -L "$abs_dest" ]]; then
        local current_target
        current_target="$(readlink "$abs_dest")"
        if [[ "$current_target" == "$abs_src" ]]; then
            echo "  ok    $abs_dest  →  $src"
            return
        fi
        echo "  fix   $abs_dest  (was $current_target, relinking)"
        rm "$abs_dest"
    elif [[ -e "$abs_dest" ]]; then
        local backup="${abs_dest}.bak.$(date +%Y%m%d%H%M%S)"
        echo "  save  $abs_dest  →  $backup"
        mv "$abs_dest" "$backup"
    fi

    mkdir -p "$(dirname "$abs_dest")"
    ln -s "$abs_src" "$abs_dest"
    echo "  link  $abs_dest  →  $src"
}

echo "==> Dotfiles installer ($(date '+%Y-%m-%d %H:%M:%S'))"
echo "    DOTDIR = $DOTDIR"
echo

link_file "zsh/zshrc"        ".zshrc"
link_file "tmux/tmux.conf"   ".tmux.conf"
link_file "git/gitconfig"    ".gitconfig"
link_file "git/ignore"       ".gitignore_global"

echo
echo "Done. Run 'source ~/.zshrc' or open a new shell to pick up changes."
