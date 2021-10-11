" JUPYTEXT config

let g:jupytext_enable = 1
let g:jupytext_command = 'jupytext'
let g:jupytext_fmt = 'md'
autocmd FileType markdown map <buffer> <F9> <esc>:w<CR>:exec '!jupytext --to py' shellescape(@%, 1)<CR>:exec '!python3' expand('%:t:r') . ('.py')<CR>
