return {
	'akinsho/toggleterm.nvim',
	version = "*",
	config = function()
		require("toggleterm").setup({
			direction = "horizontal",
			shade_terminals = true,
			start_in_insert = false,
			open_mapping = '<C-t>',
			-- size = 99999999,
			size = vim.o.lines * 0.5,
			winbar = {
				enabled = true,
				name_formatter = function(term) --  term: Terminal
					return term.name
				end
			},
		})
		-- vim.keymap.set("n", "<C-t>", "<CMD>ToggleTerm<CR>")
	end
}
