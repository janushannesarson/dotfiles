-- <leader>
vim.keymap.set('n', '<leader>f', require('telescope.builtin').find_files, { desc = '[F]ind [f]iles' })
vim.keymap.set('n', '<leader>g', require('telescope.builtin').live_grep, { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>gs', require('telescope.builtin').git_status, { desc = '[G]it [S]tatus' })


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


vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "nzz")
