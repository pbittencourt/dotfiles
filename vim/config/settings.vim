syntax enable
syntax on
set number relativenumber       " números e números relativos
set conceallevel=2              " chars ocultos são exibidos quando em foco
set laststatus=2                " sempre exibe a barra de status
set splitbelow splitright       " onde um split deve ser aberto
set tabstop=4                   " comandos para lidar com tabulações, ...
set softtabstop=4               " ...
set shiftwidth=4                " ...
set expandtab                   " ...
set smartindent                 " ... até aqui
set backspace=indent,eol,start  " deleta com backspace, sem precisar de <esc>dd
set wrap linebreak              " não quebrar palavras quando quebrar linha
set textwidth=79                " acima dessa largura, automat. quebra linha
set colorcolumn=80              " destaca última coluna de texto
set ignorecase smartcase        " melhora o motor de pesquisa
set nohlsearch                  " na pesquisa, ñ destaca corresp. encontrada
set incsearch                   " inicia a pesquisa conforme digita
set nospell                     " por padrão, não verifica ortografia ...
set spelllang=en,pt_br          " ... mas, quando o fizer, faça-o em EN e PT
set complete+=kspell            " sugere palavras à medida em que digita
set wildmenu                    " na linha de comando, exibir todas as 
                                " correspondências no autocomplete com <tab>
set wildoptions=pum             " exibe as correspondências num popup
set path+=**                    " pesquisa em subdiretórios
set noshowmode                  " vim-airline já mostra
