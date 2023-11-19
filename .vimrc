syntax on
set tabstop=2
set shiftwidth=2
filetype plugin indent on
set ruler
set so=7
set autoindent
set number
set relativenumber
set smartcase
set expandtab

colo industry 

hi Normal ctermbg=NONE guibg=NONE

execute pathogen#infect()

nnoremap <C-e> :NERDTreeToggle<CR>
nnoremap <C-q> :Rg<CR>
nnoremap <C-g> :Rg 

map ff G :r!date && echo "; "<CR> $a
