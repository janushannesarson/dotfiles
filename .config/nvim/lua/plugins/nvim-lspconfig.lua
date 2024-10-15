return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.api.nvim_create_autocmd('LspAttach', {
			callback = function(event)
				vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action,
					{ buffer = event.buf, desc = "Action" })
				vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename,
					{ buffer = event.buf, desc = "Rename" })
				vim.keymap.set('n', '<leader>cs', vim.lsp.buf.document_symbol,
					{ buffer = event.buf, desc = "Document Symbol" })
				vim.keymap.set('n', 'gh', vim.lsp.buf.hover,
					{ buffer = event.buf, desc = "Hover" })
				vim.keymap.set('n', 'gd', vim.lsp.buf.definition,
					{ buffer = event.buf, desc = "Goto Definition" })
				vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help,
					{ buffer = event.buf, desc = "Goto Definition" })
				vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help,
					{ buffer = event.buf, desc = "Goto Definition" })
			end
		})
	end

}
