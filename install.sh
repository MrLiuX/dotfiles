# #!/usr/bin/env bash

# # Dotfiles installer — symlinks config files from this repo to their expected
# # paths under $HOME.  Safe to re-run: existing regular files are backed up,
# # existing symlinks are left alone if they already point to the right place,
# # broken or wrong-target symlinks are replaced.

# set -euo pipefail

# DOTDIR="$(cd "$(dirname "$0")" && pwd)"

# # ── link src (relative to DOTDIR) → dest (absolute or relative to $HOME) ─────
# link_file() {
#     local src="$1"
#     local dest="$2"

#     local abs_src="$DOTDIR/$src"
#     local abs_dest
#     case "$dest" in
#         /*) abs_dest="$dest" ;;
#         *)  abs_dest="$HOME/$dest" ;;
#     esac

#     if [[ -L "$abs_dest" ]]; then
#         local current_target
#         current_target="$(readlink "$abs_dest")"
#         if [[ "$current_target" == "$abs_src" ]]; then
#             echo "  ok    $abs_dest  →  $src"
#             return
#         fi
#         echo "  fix   $abs_dest  (was $current_target, relinking)"
#         rm "$abs_dest"
#     elif [[ -e "$abs_dest" ]]; then
#         local backup="${abs_dest}.bak.$(date +%Y%m%d%H%M%S)"
#         echo "  save  $abs_dest  →  $backup"
#         mv "$abs_dest" "$backup"
#     fi

#     mkdir -p "$(dirname "$abs_dest")"
#     ln -s "$abs_src" "$abs_dest"
#     echo "  link  $abs_dest  →  $src"
# }

# echo "==> Dotfiles installer ($(date '+%Y-%m-%d %H:%M:%S'))"
# echo "    DOTDIR = $DOTDIR"
# echo

# link_file "zsh/zshrc"        ".zshrc"
# link_file "tmux/tmux.conf"   ".tmux.conf"
# link_file "git/gitconfig"    ".gitconfig"
# link_file "git/ignore"       ".gitignore_global"

# echo
# echo "Done. Run 'source ~/.zshrc' or open a new shell to pick up changes."

change_default_shell_to_zsh() {
    local zsh_path
    zsh_path="$(command -v zsh)"
    if [[ -z "$zsh_path" ]]; then
        echo "zsh not found, cannot change default shell."
        return 1
    fi

    # Determine the target user: if script was invoked via sudo, use SUDO_USER
    local target_user="${SUDO_USER:-$USER}"

    # Check current shell of that user with getent, or fallback
    local current_shell
    current_shell="$(getent passwd "$target_user" | cut -d: -f7)"
    if [[ "$current_shell" == "$zsh_path" ]]; then
        echo "Default shell for $target_user is already zsh ($zsh_path)."
        return
    fi

    echo "Changing default shell for $target_user to $zsh_path ..."

    # Try without sudo first (works in most interactive environments)
    if [[ "$target_user" == "$USER" ]] && chsh -s "$zsh_path" 2>/dev/null; then
        echo "Successfully changed default shell to zsh."
        echo "Please log out and back in for the change to take effect."
        return
    fi

    # Fallback to sudo (requires password)
    if command -v sudo >/dev/null 2>&1; then
        if sudo chsh -s "$zsh_path" "$target_user"; then
            echo "Successfully changed default shell for $target_user to zsh (via sudo)."
            echo "Please log out and back in for the change to take effect."
            return
        fi
    fi

    echo "Failed to change default shell. You can try manually:"
    echo "  chsh -s $zsh_path"
    echo "or"
    echo "  sudo chsh -s $zsh_path $target_user"
}