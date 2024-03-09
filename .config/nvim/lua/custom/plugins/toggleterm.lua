return {
  -- amongst your other plugins
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    keys =
    {
      { "<C-t>", "<cmd>ToggleTerm<cr>", desc = "Terminal 1" },
    },
    config = true,
    opts =
    {
      start_in_insert = true,
      size = 80,
      direction = 'float',
      open_mapping = [[<C-t>]],
      float_opts = {
        title_pos = 'center'
      }
    }
  }
}
