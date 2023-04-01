" netrw
" source: https://www.akhatib.com/making-netrw-clean-and-minimally-disruptive-then-stop-using-it/

" hide header
let g:netrw_banner = 0

" hide some pattern of files (hidden, git, pycache, etc.)
let g:netrw_list_hide = '^\.\.\=/\=$,.DS_Store,.idea,.git,__pycache__,venv,node_modules,*\.o,*\.pyc,.*\.swp'
let g:netrw_hide = 1

" when browsing, open the file in a new tab
let g:netrw_browse_split = 4

" change from left splitting to right splitting
let g:netrw_altv = 1

" tree listing style
let g:netrw_liststyle = 3

" specify initial size of new windows
let g:netrw_winsize = 20
