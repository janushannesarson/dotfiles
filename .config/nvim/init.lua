require("config.lazy")

vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.completeopt = { "menu" }
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- keybindings
-- Navigate between windows using Ctrl-h/j/k/l
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Buffers
vim.keymap.set("n", "<S-h>", ":bprev<CR>")
vim.keymap.set("n", "<S-l>", ":bnext<CR>")
vim.keymap.set("n", "<leader>q", ":bd<CR>")

vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

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

vim.cmd([[highlight! link SignColumn Normal]])
vim.cmd([[:tnoremap <Esc> <C-\><C-n>]])
vim.cmd([[set clipboard+=unnamedplus]])
