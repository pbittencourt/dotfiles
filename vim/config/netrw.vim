" netrw
" source: https://www.akhatib.com/making-netrw-clean-and-minimally-disruptive-then-stop-using-it/

let g:netrw_banner = 0
let g:netrw_list_hide = '^\.\.\=/\=$,.DS_Store,.idea,.git,__pycache__,venv,node_modules,*\.o,*\.pyc,.*\.swp'
let g:netrw_hide = 1
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_liststyle = 3
let g:netrw_winsize = 20

" source:
" https://www.reddit.com/r/vim/comments/126woxk/netrw_made_better
augroup netrw
  autocmd!
  autocmd FileType netrw setlocal bufhidden=wipe
augroup end
