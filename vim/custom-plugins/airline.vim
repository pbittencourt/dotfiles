" diquinhas top pra melhor utilização dos buffers
" source https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
