-- {{{ KEYMAPS ---------------------------------------------------------------

-- o essencial
vim.g.mapleader = " " -- must happen before plugins are loaded,
vim.g.maplocalleader = " " -- otherwise wrong leader will be used!
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("x", "jk", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("i", "<C-l>", "<Esc>la", { desc = "Move 1 char to the right and continue editing" })

-- modos mais rápidos de salvar e sair
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Write buffer" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Close buffer" })

-- yank/paste
vim.keymap.set("v", "<C-y>", '"+y', { desc = "Yank from visual selection" })
vim.keymap.set("n", "<C-p>", '"+gp', { desc = "Paste contents to buffer" })
vim.keymap.set("n", "<leader>y", ":%y+<CR>", { desc = "Yank buffer to register" })

-- edit init.lua
vim.keymap.set("n", "<leader>ev", ":vsplit $MYVIMRC<CR>", { desc = "Edit vimrc in a vsplit" })

-- clear highlights on search when pressing <esc> in normal mode
-- (See `:help hlsearch`)
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- diagnostic keymaps
vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist, { desc = "Open [d]iagnostic quickfix list" })

-- exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- close all buffers, instead current one
-- https://stackoverflow.com/a/42071865
vim.keymap.set("n", "<leader>d", function()
	vim.cmd("%bd")
	vim.cmd("e#")
end, { desc = "Close all buffers but this one" })

-- use ctrl+<hjkl> to switch between windows
-- (See `:help wincmd` for a list of all window commands)
-- vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
-- vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
-- vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
-- vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- use ctrl+shift+<hjkl> to move windows
-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- better movements
vim.keymap.set("n", "}", "}ztj")
vim.keymap.set("n", "{", "k{ztj")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- toggles
vim.keymap.set("n", "<leader>i", "<cmd>set list!<CR>")
vim.keymap.set("n", "<leader>l", "<cmd>set cursorline!<CR>")
vim.keymap.set("n", "<leader>c", "<cmd>set cursorcolumn!<CR>")

-- file explores
vim.keymap.set("n", "<leader>v", "<cmd>Lexplore<CR>")

-- text manipulation
vim.keymap.set("i", "<C-u>", "<esc>viwgUea")
vim.keymap.set("n", "<C-s>", "]s1z=")

-- typofix
vim.keymap.set("n", "<leader>xc", "<cmd>TypoFixCreate<cr>", { desc = "typofi[X] [C]reate" })
vim.keymap.set("n", "<leader>xd", "<cmd>TypoFixDelete<cr>", { desc = "typofi[X] [D]elete" })

-- todo-comments
vim.keymap.set("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- }}}
