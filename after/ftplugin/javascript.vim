" Disable inserting comment leader after hitting o or O or <Enter>
set formatoptions-=o
set formatoptions-=r

" Switch up newlines in edit mode
inoremap <m-j> <Esc>A;<c-j>
nnoremap <m-j> A;<c-j>
