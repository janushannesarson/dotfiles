local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.completeopt = { "menu" }
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

require("lazy").setup({
	spec = {
		{
			-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
			-- used for completion, annotations and signatures of Neovim apis
			'folke/lazydev.nvim',
			ft = 'lua',
			opts = {
				library = {
					-- Load luvit types when the `vim.uv` word is found
					{ path = 'luvit-meta/library', words = { 'vim%.uv' } },
				},
			},
		},
		{ 'projekt0n/github-nvim-theme', name = 'github-theme' },
		{ import = "plugins" },
	},
	checker = { enabled = true },
})

-- LSP Configuration
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup {
	capabilities = capabilities,
	cmd = { "rust-analyzer" },
}
lspconfig.lua_ls.setup {
	capabilities = capabilities,
	cmd = { "lua-language-server" },
}
lspconfig.html.setup {
	capabilities = capabilities,
}
-- lspconfig.emmet_ls.setup {
-- 	capabilities = capabilities,
-- 	filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
-- 	init_options = {
-- 		html = {
-- 			options = {
-- 				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
-- 				["bem.enabled"] = true,
-- 			},
-- 		},
-- 	}
-- }

-- keybindings
-- Navigate between windows using Ctrl-h/j/k/l
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
-- local function move_right_if_exists()
-- 	local curr_win = vim.api.nvim_get_current_win()
-- 	vim.cmd('wincmd l')
-- 	local new_win = vim.api.nvim_get_current_win()
--
-- 	if curr_win == new_win then
-- 		vim.cmd("!zellij action move-focus-or-tab right")
-- 		vim.cmd('redraw!')
-- 	end
-- end
-- vim.keymap.set('n', '<C-l>', move_right_if_exists, { noremap = true, silent = true })


-- Buffers
vim.keymap.set("n", "<S-h>", ":bprev<CR>")
vim.keymap.set("n", "<S-l>", ":bnext<CR>")
vim.keymap.set("n", "<leader>q", ":bd<CR>")

vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

-- Git
vim.keymap.set("n", "<leader>gs", ":G<CR>")

-- nicer vertical navigation
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true, desc = "Half page up" })
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true, desc = "Half page down" })

-- debug
-- vim.keymap.set('n', '<leader>dd', require('dapui').toggle, { desc = '[D]ebug' })
-- vim.keymap.set('n', '<leader>db', require('dap').toggle_breakpoint, { desc = '[D]ebug [B]reak' })
-- vim.keymap.set('n', '<leader>ds', require('dap').step_over, { desc = '[D]ebug [S]tep' })
-- vim.keymap.set('n', '<leader>di', require('dap').step_into, { desc = '[D]ebug Step [I]nto' })

vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")


require('github-theme').setup({
	options = {
		darken = {
			floats = false,
		},
	}
})

vim.cmd([[colorscheme github_dark]])
vim.cmd([[highlight! link SignColumn Normal]])
vim.cmd([[:tnoremap <Esc> <C-\><C-n>]])
vim.cmd([[set clipboard+=unnamedplus]])

local lsp = vim.lsp
lsp.handlers["textDocument/hover"] = lsp.with(vim.lsp.handlers.hover, {
	border = "single",
})
lsp.handlers["textDocument/signature"] = lsp.with(vim.lsp.handlers.signature_help, {
	border = "single",
})
