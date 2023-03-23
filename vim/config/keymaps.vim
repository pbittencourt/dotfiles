" o essencial
ino jk <Esc>
xno jk <Esc>
ino <C-L> <Esc>la
nno <leader>v :Lexplore<CR>
nno <leader>f :FZF!<CR>
nno <leader>tt :tabnew<CR>

" modos mais rápidos de salvar e sair
nno Q :q<CR>
nno <leader>q :q<CR>
nno <leader>x :x<CR>
nno <leader>a :q!<CR>
nno <leader>u :update<CR>   " só salva se o buffer foi modificado

" yank/paste -- ctrlC ctrlV conflita com terminal, então evitemos
vno <C-y> "+y
nno <C-p> "+gp

" edit/source vimrc
nno <leader>ev :edit $MYVIMRC<CR>
nno <leader>sv :source $MYVIMRC<CR>

" movendo linhas
" source: https://vim.fandom.com/wiki/Moving_lines_up_or_down
nno <A-j> :m .+1<CR>==
nno <A-k> :m .-2<CR>==
vno <A-j> :m '>+1<CR>gv=gv
vno <A-k> :m '<-2<CR>gv=gv

" split navigations
nno <C-H> <C-W><C-H>
nno <C-J> <C-W><C-J>
nno <C-K> <C-W><C-K>
nno <C-L> <C-W><C-L>

" insere linha abaixo/acima do cursor, sem movê-lo ou entrar no modo insert
" source: https://stackoverflow.com/a/16136133/6064933
nnoremap <expr> <leader><Down> 'm`' . v:count1 . 'o<Esc>``'
nnoremap <expr> <leader><Up> 'm`' . v:count1 . 'O<Esc>``'

" melhora movimentos
nno ç ^
xno ç ^
nno $ g_
xno $ g_
nno H H zz
nno M M zz
nno L L zz

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
nno <leader>b :%bd\|e#<CR>
