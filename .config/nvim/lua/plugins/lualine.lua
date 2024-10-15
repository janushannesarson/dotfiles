return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		vim.cmd([[colorscheme github_dark]])
		require("lualine").setup({
			tabline = {
				lualine_a = {},
				lualine_b = {
					'buffers',
					-- buffers_color = {
					-- 	-- Same values as the general color option can be used here.
					-- 	active = 'lualine_{section}_normal', -- Color for active buffer.
					-- 	inactive = 'lualine_{section}_inactive', -- Color for inactive buffer.
					-- },
				},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {}
			}
		})
	end,
}
