return {
	'echasnovski/mini.files',
	version = '*',
	config = function()
		vim.keymap.set("n", "<leader>e", ":lua MiniFiles.open()<CR>")
		require('mini.files').setup({

		})
	end,
}
