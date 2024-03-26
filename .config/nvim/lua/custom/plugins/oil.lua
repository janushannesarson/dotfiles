return {
	'stevearc/oil.nvim',
	opts = {
		default_file_explorer = true,
		win_options = {
			signcolumn = "number",
		},
		keymaps = {
			["<C-t>"] = false,
			["<C-e>"] = "actions.close",
			["<C-c>"] = false,
		},
	},
	-- Optional dependencies
	keys =
	{
		{ "<C-e>", "<cmd>Oil<CR><cmd>lua require('oil').discard_all_changes()<CR>", desc = "Oil" },
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false
}
