" ==========================================================================
" NOVA ERA configurações vim/neovim -- 2023 edition!
" Pedro P. Bittencourt
" https://github.com/pbittencourt/dotfiles
" ==========================================================================

set nocompatible     " requerido
set encoding=UTF-8   " acentuações
filetype off         " requerido
if has('win32')
    set shellslash   " no windows, converte / para \
endif

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
Plugin         'sainnhe/everforest'
Plugin        'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin        'junegunn/fzf.vim'
Plugin        'junegunn/goyo.vim'
Plugin        'Yggdroot/indentLine'
Plugin     'vim-scripts/indentpython.vim'
Plugin  'img-paste-devs/img-paste.vim'
Plugin        'junegunn/limelight.vim'
Plugin          'iamcco/markdown-preview.nvim'
Plugin 'arcticicestudio/nord-vim'
Plugin        'jalvesaq/Nvim-R'
Plugin           'sotte/presenting.vim'
Plugin       'godlygeek/tabular'
Plugin          'SirVer/ultisnips'
Plugin          'lervag/vimtex'
Plugin     'vim-airline/vim-airline'
Plugin     'vim-airline/vim-airline-themes'
Plugin           'tpope/vim-commentary'
Plugin       'ryanoasis/vim-devicons'
Plugin        'junegunn/vim-easy-align'
Plugin           'tpope/vim-fugitive'
Plugin           'rhysd/vim-healthcheck'
Plugin  'prabirshrestha/vim-lsp'
Plugin           'mattn/vim-lsp-settings'
Plugin       'preservim/vim-markdown'
Plugin         'sheerun/vim-polyglot'
Plugin        'sillybun/vim-repl'
Plugin           'honza/vim-snippets'
Plugin           'mhinz/vim-startify'
Plugin           'tpope/vim-surround'
Plugin      'jmcantrell/vim-virtualenv'

call vundle#end()            " required
filetype plugin indent on    " required

" carrega seções de forma 'dinâmica'
" source: https://dev.to/iggredible/what-is-inside-my-vimrc-3ob7
let b:fileList = split(globpath('~/dotfiles/vim/config', '*.vim'), '\n')
let b:fileList += split(globpath('~/dotfiles/vim/custom-plugins', '*.vim'), '\n')
for fpath in b:fileList
  exe 'source' fpath
endfor
