" GENERAL Plugin configs

" ================
" MARKDOWN-PREVIEW
" ================

let g:mkdp_open_to_the_world = 1
let g:mkdp_markdown_css = '/home/monolito/OneDrive/backlog/css/axist.min.css'

" ====
" GOYO
" ====
let g_goyo_width = 90
let g:goyo_height = '90%'
let g:goyo_linenr = 1

" =========
" LIMELIGHT
" =========
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'green'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 0

" Goyo integration
"autocmd! User GoyoEnter Limelight
"autocmd! User GoyoLeave Limelight!
