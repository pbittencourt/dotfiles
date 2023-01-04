let g:repl_program = {
\	'python': 'ipython',
\	'default': 'bash'
\	}
let g:repl_position = 3
let g:repl_python_auto_send_unfinish_line = 1
let g:repl_python_auto_import = 1
let g:repl_python_automerge = 1
nnoremap <leader>r :REPLToggle<Cr>
nnoremap <leader>e :REPLSendSession<Cr>
