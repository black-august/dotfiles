syntax on
set tabstop=2
set shiftwidth=2
filetype on
set ruler
set so=7
set autoindent
set number
set relativenumber
set smartcase

colo gruvbox
set background=dark

hi Normal ctermbg=NONE guibg=NONE

map ff G :r!date && echo "; "<CR> $a
