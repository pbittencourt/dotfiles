-- return {
-- 	{
-- 		"barnii77/typofix.nvim",
-- 		opts = {
-- 			path = "~/AppData/Local/nvim/typofix.vim",
-- 			features = {
-- 				create = true,
-- 				delete = true,
-- 				list = true,
-- 				enable = true,
-- 				disable = true,
-- 				print_opts = false,
-- 			},
-- 		},
-- 	},
-- }

return {
	{
		"barnii77/typofix.nvim",
		opts = function()
			local sysname = vim.loop.os_uname().sysname
			local typofix_path
			if sysname:match("Windows") then
				typofix_path = "~/AppData/Local/nvim/typofix.vim"
			else
				typofix_path = "~/.config/nvim/typofix.vim"
			end
			return {
				path = typofix_path,
				features = {
					create = true,
					delete = true,
					list = true,
					enable = true,
					disable = true,
					print_opts = false,
				},
			}
		end,
	},
}
