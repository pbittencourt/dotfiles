" GENERAL Plugin configs

" =========
" ULTISNIPS
" =========

" Defines how the edit window is opened
let g:UltiSnipsEditSplit="context"

" UltiSnips personal data
let g:snips_author = 'Pedro Pompermayer Bittencourt'
let g:snips_email = 'contato@pedrobittencourt.com.br'
let g:snips_github = 'https://github.com/pbittencourt'

" Trigger configuration
let g:UltiSnipsExpandTrigger="<tab>"

" ================
" MARKDOWN-PREVIEW
" ================

let g:mkdp_open_to_the_world = 1
let g:mkdp_markdown_css = '/home/monolito/OneDrive/backlog/css/axist.min.css'

" ============
" VIM MARKDOWN
" ============

let g:vim_markdown_emphasis_multiline = 0

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
"
" ========
" VIM-REPL
" ========

let g:repl_program = {
			\	'python': 'ipython',
			\	'r': 'R',
			\	'default': 'bash'
			\	}
let g:repl_ipython_version = '7.12'
let g:repl_position = 3
let g:sendtorepl_invoke_key = "<space>"
let g:repl_python_auto_send_unfinish_line = 1
nnoremap <leader>r :REPLToggle<Cr>
nnoremap <leader>e :REPLSendSession<Cr>

" ======
" NVIM-R
" ======

" Start R automatically, even if Vim is already started
let R_auto_start = 2

" Object browser options
let R_objbr_place = 'console,above'
let R_objbr_opendf = 0    " Hide data.frames elements
let R_objbr_openlist = 0  " Hide lists elements
let R_objbr_allnames = 0  " Hide hidden objects

