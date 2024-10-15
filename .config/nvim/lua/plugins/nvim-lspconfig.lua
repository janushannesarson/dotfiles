return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.api.nvim_create_autocmd('LspAttach', {
			callback = function(event)
				vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action,
					{ buffer = event.buf, desc = "some description" })
			end
		})
	end

}
