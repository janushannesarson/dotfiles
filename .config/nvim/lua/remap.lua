-- <leader>
vim.keymap.set('n', '<leader><leader>', require('telescope.builtin').find_files, {})
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles}' })
vim.keymap.set('n', '<leader>fh', function()
	require('telescope.builtin').find_files({ hidden = true })
end, { desc = '[F]ind Hidden' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[F]ind by Grep' })
vim.keymap.set('n', '<leader>gs', require('telescope.builtin').git_status, { desc = '[G]it [S]tatus' })

-- File tree
vim.keymap.set('n', '<leader>e', require("nvim-tree.api").tree.toggle, {})

-- Navigate between windows using Ctrl-h/j/k/l
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })


-- stolen from primagen
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

-- nicer vertical navigation
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true, desc = "Half page up" })
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true, desc = "Half page down" })

-- debug
vim.keymap.set('n', '<leader>dd', require('dapui').toggle, { desc = '[D]ebug' })
vim.keymap.set('n', '<leader>db', require('dap').toggle_breakpoint, { desc = '[D]ebug [B]reak' })
vim.keymap.set('n', '<leader>ds', require('dap').step_over, { desc = '[D]ebug [S]tep' })
vim.keymap.set('n', '<leader>di', require('dap').step_into, { desc = '[D]ebug Step [I]nto' })

vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "nzz")
