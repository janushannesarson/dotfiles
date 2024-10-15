return {
	'stevearc/oil.nvim',
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	-- opts = {
	-- 	default_file_explorer = true,
	-- 	-- win_options = {
	-- 	-- 	signcolumn = "number",
	-- 	-- },
	-- 	keymaps = {
	-- 		["<C-t>"] = false,
	-- 		["<C-e>"] = "actions.close",
	-- 		-- ["<C-e>"] = "<CMD>Oil<CR>",
	-- 		["<C-c>"] = false,
	-- 	},
	-- },
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			keymaps = {
				["<C-t>"] = false,
				["<C-e>"] = "actions.close",
				-- ["<C-e>"] = "<CMD>Oil<CR>",
				["<C-c>"] = false,
			},
		})
		vim.keymap.set("n", "<C-e>", "<cmd>Oil<CR><cmd>lua require('oil').discard_all_changes()<CR>")
	end,
	-- keys =
	-- {
	-- 	{ "<C-e>", "<cmd>Oil<CR><cmd>lua require('oil').discard_all_changes()<CR>", desc = "Oil" },
	-- },
	-- config = function()
	-- 	require("oil").setup({
	-- 		default_file_explorer = true
	-- 	})
	-- end,
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
}
