inoremap <m-j> <Esc>A\\<c-j>
nnoremap <m-j> A\\<c-j>
nnoremap <leader>ea o\begin{align*}<CR><BS>\end{align*}<Esc>O
nnoremap <leader>n :<C-U>exe "call MatrixNext(" . v:count1 . ")"<CR>
nnoremap <leader>N :<C-U>exe "call MatrixNext(-" . v:count1 . ")"<CR>
inoremap <c-n> <esc>:<C-U>exe "call MatrixNext(1)"<CR>

let g:matrixLine = 0
let g:matrixStride = 0
let g:matrixLen = 0
let g:matrixExists = 0
let g:matrixPosition = 0

function CreateMatrix(M, N)
	" Set globals
	let g:matrixLine = getcurpos()[1] + 1
	let g:matrixStride = a:N
	let g:matrixLen = a:M * a:N
	let g:matrixExists = 1
	let g:matrixPosition = 0
	let matrix_list = []

	execute "normal! a\\begin{matrix}\<esc>"

	" Iterate over matrix dimensions
	let m = 0
	while m < a:M
		" If its not the first line, get ready for the newline with backslashes
		if m > 0
			execute "normal! a\\\\\<esc>"
		endif
		" Inner loop
		let n = 1
		while n < a:N
			if n == 1
				execute "normal! o\<space>\<esc>"
			endif
			execute "normal! a&\<space>\<space>\<esc>"
			let n += 1
		endwhile
		" End inner loop
		let m += 1
	endwhile
	" Make the location list
	execute "normal! o\<BS>\<BS>\\end{matrix}"

	call MatrixNext(0)
endfunction

function MatrixNext(jump)
	if g:matrixExists
		" Add the matrixLen again because vimscript matches sign on modulo
		let g:matrixPosition = (g:matrixPosition + a:jump + g:matrixLen) % g:matrixLen
		let line = g:matrixLine + g:matrixPosition / g:matrixStride
		let across = g:matrixPosition % g:matrixStride
		if across == 0
			execute "normal! " . line . "G0f&h"
		else
			execute "normal! " . line . "G0" . across . "f&2l"
		endif
		echo [line, across]
	endif
endfunction

