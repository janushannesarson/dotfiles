-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  ---@diagnostic disable-next-line: missing-fields
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Buffers
map("n", "q", function()
  require("mini.bufremove").delete(0, false)
end, { desc = "Remove Buffer" })

map("n", "Q", function()
  require("mini.bufremove").delete(0, true)
end, { desc = "Remove Buffer (Force)" })

-- Macros
map({ "n" }, "m", "q", { desc = "Macro" })
