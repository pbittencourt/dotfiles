return {
	-- tokyonight colorscheme
	{
		"folke/tokyonight.nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("tokyonight").setup({
				terminal_colors = true,
				styles = {
					comments = { italic = true },
					keywords = { italic = true },
				},
				-- Background styles. Can be "dark", "transparent" or "normal"
				sidebars = "dark", -- style for sidebars, see below
				floats = "dark", -- style for floating windows
			})
			-- Load the colorscheme here.
			-- Like many other themes, this one has different styles, and you could
			-- load any other, such as 'tokyonight-storm', 'tokyonight-moon', or
			-- 'tokyonight-day'.
			vim.cmd.colorscheme("tokyonight-storm")
		end,
	},
}
