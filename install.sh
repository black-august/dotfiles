#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

install_packages() {
    export DEBIAN_FRONTEND=noninteractive
    if command -v apt-get &> /dev/null; then
        sudo apt-get update -y
        sudo apt-get install -y fzf git tmux vim ripgrep curl \
            gdb zsh-syntax-highlighting wireguard-tools zsh fd-find
    elif command -v dnf &> /dev/null; then
        sudo dnf update -y
        sudo dnf install -y fzf git tmux vim ripgrep curl \
            gdb zsh-syntax-highlighting wireguard-tools zsh fd-find
    else
        echo "Neither apt-get nor dnf package manager found on this system."
        exit 1
    fi
}

install_uv() {
    if command -v uv &> /dev/null; then
        echo "uv already installed, skipping"
        return
    fi
    curl -LsSf https://astral.sh/uv/install.sh | sh
}

install_zsh_plugins() {
    mkdir -p ~/.zsh/plugins
    if [[ ! -d ~/.zsh/plugins/zsh-fzf-history-search ]]; then
        git clone https://github.com/joshskidmore/zsh-fzf-history-search \
            ~/.zsh/plugins/zsh-fzf-history-search
    fi
}

link_dotfiles() {
    ln -sf "$SCRIPT_DIR/.tmux.conf" ~/.tmux.conf
    ln -sf "$SCRIPT_DIR/.vimrc" ~/.vimrc
    ln -sf "$SCRIPT_DIR/.zshrc" ~/.zshrc

    mkdir -p ~/.config/uv
    ln -sf "$SCRIPT_DIR/uv.toml" ~/.config/uv/uv.toml

    for item in "$SCRIPT_DIR/.config/"*; do
        ln -sf "$item" ~/.config/"$(basename "$item")"
    done
}

install_packages
install_uv
install_zsh_plugins
link_dotfiles

chsh -s "$(which zsh)"
echo "All done..."
