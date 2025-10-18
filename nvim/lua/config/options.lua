-- {{{ OPTIONS ---------------------------------------------------------------
--

vim.cmd("syntax on")
vim.g.have_nerd_font = true
vim.opt.termguicolors = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.conceallevel = 2
vim.o.laststatus = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.breakindent = true
vim.o.backspace = "indent,eol,start"
vim.o.wrap = true
vim.o.linebreak = true
vim.o.textwidth = 79
vim.o.cursorcolumn = false
vim.o.cursorline = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.spelllang = "en,pt_br"
-- vim.opt.complete:append({ "kspell" })
vim.opt.complete:append({ ".", "w", "b", "kspell" })
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.o.wildmenu = true
vim.o.wildoptions = "pum"
vim.o.wildignorecase = true
vim.opt.path:append({ "**" })
vim.o.showcmd = true
vim.o.autochdir = true
vim.o.mouse = "a"
vim.o.showmode = false
vim.schedule(function() -- `:help 'clipboard'`
	vim.o.clipboard = "unnamed"
end)
vim.o.undofile = true
vim.o.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.confirm = true -- `:help 'confirm'`
vim.o.inccommand = "split" -- preview substitution as you type

-- Configurações do netrw
vim.g.netrw_banner = 0
vim.g.netrw_list_hide = [[^\.\.\=/\=$,.DS_Store,.idea,.git,__pycache__,venv,node_modules,*\.o,*\.pyc,.*\.swp]]
vim.g.netrw_hide = 1
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 20

-- Folds
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- }}}
