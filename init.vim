set number
set tabstop=2
set shiftwidth=2

" Make new lines not just enter
inoremap <CR> <Esc>o
inoremap <C-J> <CR>

" Change leader
let mapleader=" "
let maplocalleader=" "

" plugins
call plug#begin()

" C# syntax
Plug 'OmniSharp/omnisharp-vim'

" LaTeX syntax
Plug 'lervag/vimtex'

" js and jsx
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

call plug#end()
