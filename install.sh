function install_zsh_and_plugins () {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  git clone https://github.com/joshskidmore/zsh-fzf-history-search ~/.oh-my-zsh/plugins/zsh-fzf-history-search || echo "Failed to install fzf history search"
}

function install_vim_plugins () {
  mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
  git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree || echo "Failed to install nerdtree"
  git clone https://github.com/lilydjwg/colorizer ~/.vim/bundle || echo "Failed to install colorizer"
}

function install_dotfiles () {
  cp .tmux.conf ~/.tmux.conf
  cp .vimrc ~/.vimrc
  cp .zshrc ~/.zshrc
  cp -r .config/ ~/.config
}

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

install_zsh_and_plugins
install_vim_plugins
install_dotfiles

chsh -s $(which zsh)
echo "All done..."
