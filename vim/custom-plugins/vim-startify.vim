let g:startify_custom_header = [
            \ '                                                    ',
            \ '    ██████╗ ███████╗██╗   ██╗██████╗ ██╗███╗   ███╗ ',
            \ '    ██╔══██╗██╔════╝██║   ██║██╔══██╗██║████╗ ████║ ',
            \ '    ██████╔╝█████╗  ██║   ██║██████╔╝██║██╔████╔██║ ',
            \ '    ██╔═══╝ ██╔══╝  ╚██╗ ██╔╝██╔══██╗██║██║╚██╔╝██║ ',
            \ '    ██║     ███████╗ ╚████╔╝ ██║  ██║██║██║ ╚═╝ ██║ ',
            \ '    ╚═╝     ╚══════╝  ╚═══╝  ╚═╝  ╚═╝╚═╝╚═╝     ╚═╝ ',
            \ '                                   [ 2023 EDITION ] ',
            \ '                                                    ',
            \ ]

let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   Recentes']               },
      \ { 'type': 'dir',       'header': ['   Recentes em '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessões']                },
      \ { 'type': 'bookmarks', 'header': ['   Favoritos']              },
      \ { 'type': 'commands',  'header': ['   Comandos']               },
      \ ]