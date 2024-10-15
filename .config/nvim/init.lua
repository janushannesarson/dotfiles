vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.completeopt = { "menu" }
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Bootstrap lazy.nvim
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
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{
			'hrsh7th/nvim-cmp',
			dependencies = {
				'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
				'hrsh7th/cmp-buffer', -- Buffer completions
				'hrsh7th/cmp-path', -- Path completions
				'hrsh7th/cmp-cmdline', -- Cmdline completions
				'hrsh7th/cmp-vsnip', -- Snippet completions
				'hrsh7th/vim-vsnip', -- Snippet engine
			}
		},
		{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = {} },
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
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	-- automatically check for plugin updates
	checker = { enabled = true },
})

-- Enable completion triggered by <c-space>
local cmp = require('cmp')
cmp.setup({
	mapping = {
		['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'path' },
	},
})

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

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

-- keybindings
-- Navigate between windows using Ctrl-h/j/k/l
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Buffers
vim.keymap.set("n", "<S-h>", ":bprev<CR>")
vim.keymap.set("n", "<S-l>", ":bnext<CR>")

-- stolen from primagen
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
