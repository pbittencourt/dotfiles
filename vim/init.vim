" ========================================================================== "
" NOVA ERA configurações vim/neovim -- 2023 edition!
" Pedro P. Bittencourt
" https://github.com/pbittencourt/dotfiles
" ========================================================================== "

if has('win32')
    " Set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin('~/vimfiles/bundle')
    " Let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'
else
    " Set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    " Let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'
endif

Plugin  'prabirshrestha/asyncomplete.vim'
Plugin  'prabirshrestha/asyncomplete-lsp.vim'
Plugin        'lilydjwg/colorizer'
Plugin        'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin        'junegunn/fzf.vim'
Plugin        'junegunn/goyo.vim'
Plugin     'vim-scripts/indentpython.vim'
Plugin        'junegunn/limelight.vim'
Plugin          'iamcco/markdown-preview.nvim'
Plugin 'arcticicestudio/nord-vim'
Plugin        'jalvesaq/Nvim-R'
Plugin       'godlygeek/tabular'
Plugin          'SirVer/ultisnips'
Plugin          'lervag/vimtex'
Plugin     'vim-airline/vim-airline'
Plugin     'vim-airline/vim-airline-themes'
Plugin           'tpope/vim-commentary'
Plugin        'junegunn/vim-easy-align'
Plugin           'tpope/vim-fugitive'
Plugin  'prabirshrestha/vim-lsp'
Plugin           'mattn/vim-lsp-settings'
Plugin      'plasticboy/vim-markdown'
Plugin        'sillybun/vim-repl'
Plugin           'honza/vim-snippets'
Plugin           'tpope/vim-surround'

call vundle#end()            " required
filetype plugin indent on    " required

" carrega seções de forma 'dinâmica'
" source: https://dev.to/iggredible/what-is-inside-my-vimrc-3ob7
let b:fileList = split(globpath('~/dotfiles/vim/config', '*.vim'), '\n')
let b:fileList += split(globpath('~/dotfiles/vim/custom-plugins', '*.vim'), '\n')
for fpath in b:fileList
  exe 'source' fpath
endfor
