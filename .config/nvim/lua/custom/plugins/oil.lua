return {
	'stevearc/oil.nvim',
	opts = {
		default_file_explorer = true,
		float = {
			-- Padding around the floating window
			padding = 2,
			max_width = 0,
			max_height = 0,
			border = "rounded",
			win_options = {
				winblend = 0,
			},
			-- This is the config that will be passed to nvim_open_win.
			-- Change values here to customize the layout
			override = function(conf)
				return conf
			end,
		},
		win_options = {
			signcolumn = "number",
		}
	},
	-- Optional dependencies
	keys =
	{
		{ "<Leader>e", "<cmd>lua require('oil').toggle_float('.')<CR><cmd>lua require('oil').discard_all_changes()<CR>", desc = "Oil" },
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false
}
