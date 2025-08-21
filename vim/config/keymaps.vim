" o essencial
let mapleader = " "
ino jk <Esc>
xno jk <Esc>
ino <C-L> <Esc>la
nno <leader>v :Lexplore<CR>
nno <leader>t :tabnew<CR>:Startify<CR>

" modos mais rápidos de salvar e de sair
nno <leader>w :w<CR>
nno <leader>q :q<CR>
nno <leader>x :x<CR>
nno <leader>a :q!<CR>

" yank/paste -- ctrlC ctrlV conflita com terminal, então evitemos
vno <C-y> "+y
nno <C-p> "+gp

" equivalente a Ctrl+A Ctrl+C - copia todo o buffer pro registro
nno <leader>y :%y+<CR>

" edit/source vimrc
nno <leader>ev :vsplit $MYVIMRC<CR>
nno <leader>sv :source $MYVIMRC<CR>

" split navigations
nno <C-H> <C-W><C-H>
nno <C-J> <C-W><C-J>
nno <C-K> <C-W><C-K>
nno <C-L> <C-W><C-L>

" movendo linhas
" source: https://vim.fandom.com/wiki/Moving_lines_up_or_down
nno <A-j> :m .+1<CR>==
nno <A-k> :m .-2<CR>==
vno <A-j> :m '>+1<CR>gv=gv
vno <A-k> :m '<-2<CR>gv=gv

" insere linha abaixo/acima do cursor, sem movê-lo ou entrar no modo insert
" source: https://stackoverflow.com/a/16136133/6064933
nno <expr> <leader><Down> 'm`' . v:count1 . 'o<Esc>``'
nno <expr> <leader><Up> 'm`' . v:count1 . 'O<Esc>``'

" melhora movimentos
"nno ç ^
"xno ç ^
"nno $ g_
"xno $ g_
nno H H zz
nno M M zz
nno L L zz
nno } }ztj
nno { k{ztj
nno n nzz
nno N Nzz

" abertura/fechamento de folds mais ergonômica
nno z[ za
nno z] zA

" liga/desliga caracteres não imprimíveis
nno <leader>i :set list!<CR>

" liga/desliga destaque em linha e coluna sob cursor
nmap <leader>l :set cursorline!<CR>
nmap <leader>c :set cursorcolumn!<CR>

" autoclose and position cursor to write text inside
ino ' ''<left>
ino ` ``<left>
ino " ""<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>

" autoclose and position cursor after
ino '<tab> ''
ino `<tab> ``
ino "<tab> ""
ino (<tab> ()
ino [<tab> []
ino {<tab> {}

" autoclose 2 lines below and position cursor in the middle
ino '<CR> '<CR>'<ESC>O
ino `<CR> `<CR>`<ESC>O
ino "<CR> "<CR>"<ESC>O
ino (<CR> (<CR>)<ESC>O
ino [<CR> [<CR>]<ESC>O
ino {<CR> {<CR>}<ESC>O

" fecha todos os outros buffers
" https://stackoverflow.com/a/42071865
nno <leader>d :%bd\|e#<CR>

" manipulação de texto
ino <c-u> <esc>viwgUea
iabbrev ibullet ∙
iabbrev itodo ∘
iabbrev idone ×
iabbrev ievent ▫
iabbrev inote ▪
iabbrev imoved ▹
iabbrev i-- —
iabbrev nao não
iabbrev Nao Não
iabbrev entao então
iabbrev Entao Então
iabbrev voce você
iabbrev Voce Você
iabbrev mto muito
iabbrev Mto Muito
iabbrev ciencia ciência
iabbrev Ciencia Ciência
iabbrev tambem também
iabbrev Tambem Também
nmap <c-s> ]s1z=

" funções
nmap <leader>8 :call ToggleCC()<CR>
nmap <leader>m :call ToggleHighlightWord()<CR>
nmap <leader>tw :call ToggleTW()<CR>

" FZF
nno <leader>f :FZF<CR>
nno <leader>b :Buffers<CR>
" inicia pesquisa no diretório do buffer ativo
nno <leader>h :Files %:h<CR>
" inicia pesquisa na home
nno <leader><F1> :Files ~<CR>
" arquivos recentes -- versão bonita de :browse old
nno <leader>o :History<CR>

" REPL
nno <leader>/ :REPLToggle<Cr>
nno <leader>. :REPLSendSession<Cr>
" esse, a rigor, não é um KEYMAP, mas estar aqui é mais sustentável
let g:sendtorepl_invoke_key = "<leader>;"

" markdown-preview
nno <leader><F5> <Plug>MarkdownPreviewToggle

" md2clipboard
augroup copymdimage
    autocmd FileType markdown nno <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
augroup END

" vim-lsp
nno <leader>]] <plug>(lsp-next-diagnostic)
nno <leader>[[ <plug>(lsp-previous-diagnostic)
nno <leader>gd <plug>(lsp-definition)
