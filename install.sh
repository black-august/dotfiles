if command -v apt-get &> /dev/null; then
    sudo apt-get update -y
    sudo apt-get install -y fzf git tmux vim ripgrep zsh curl \
        gdb zsh-syntax-highlighting flameshot wireguard-tools
elif command -v dnf &> /dev/null; then
    sudo dnf update -y
    sudo dnf install -y fzf git tmux vim ripgrep zsh curl \
        gdb zsh-syntax-highlighting flameshot wireguard-tools
else
    echo "Neither apt-get nor dnf package manager found on this system."
    exit 1
fi

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/joshskidmore/zsh-fzf-history-search ~/.oh-my-zsh/plugins/zsh-fzf-history-search

cp .zshrc ~/.zshrc
cp .tmux.conf ~/.tmux.conf
cp .vimrc ~/.vimrc

chsh -s $(which zsh)

echo "All done..."
