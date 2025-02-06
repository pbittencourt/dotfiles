" exibe buffers na tabline
let g:airline#extensions#tabline#enabled = 1
" exibe apenas o nome do arquivo
let g:airline#extensions#tabline#fnamemod = ':t'
" exibe número do buffer
let g:airline#extensions#tabline#buffer_nr_show = 1

" exibe virtual envs
let g:airline#extensions#virtualenv#enabled = 1

" powerline symbols
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.dirty='⚡'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" references:
" https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs
" https://blog.pdhawan.com/vim-airline-powerful-status-line-4dda605adae5
