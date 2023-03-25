if command -v apt-get &> /dev/null; then
    sudo apt-get update -y
    sudo apt-get install -y fzf git tmux vim ripgrep curl \
        gdb zsh-syntax-highlighting flameshot wireguard-tools \
        fish
elif command -v dnf &> /dev/null; then
    sudo dnf update -y
    sudo dnf install -y fzf git tmux vim ripgrep curl \
        gdb zsh-syntax-highlighting flameshot wireguard-tools \
        fish
else
    echo "Neither apt-get nor dnf package manager found on this system."
    exit 1
fi

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

mkdir -p ~/.config/fish/
cp fish_variables ~/.config/fish
cp .tmux.conf ~/.tmux.conf
cp .vimrc ~/.vimrc

chsh -s $(which fish)

echo "All done..."
