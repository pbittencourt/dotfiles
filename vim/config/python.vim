" PYTHON general config

" Indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" run python scripts
autocmd FileType python map <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" REPL config
let g:repl_program = {
			\	'python': 'ipython',
			\	'r': 'R',
			\	'default': 'bash'
			\	}
let g:repl_ipython_version = '7.12'
let g:repl_position = 3
nnoremap <leader>r :REPLToggle<Cr>
nnoremap <leader>e :REPLSendSession<Cr>
