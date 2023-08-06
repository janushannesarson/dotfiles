-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
-- Use Alt+1 to switch to buffer 1
vim.api.nvim_set_keymap("n", "<A-1>", ":buffer 1<CR>", { noremap = true })
-- Use Alt+2 to switch to buffer 2
vim.api.nvim_set_keymap("n", "<A-2>", ":buffer 2<CR>", { noremap = true })
-- And so on for other buffers
