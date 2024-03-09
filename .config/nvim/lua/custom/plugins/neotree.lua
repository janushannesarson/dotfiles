return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  lazy = false,
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ toggle = true, position = 'left' })
      end,
      desc = "Explorer NeoTree (cwd)",
    },
    {
      "<leader>ge",
      function()
        require("neo-tree.command").execute({ source = "git_status", toggle = true, position = 'left' })
      end,
      desc = "Git Explorer NeoTree (cwd)",
    },
    {
      "<leader>be",
      function()
        require("neo-tree.command").execute({ source = "buffers", toggle = true, position = 'left' })
      end,
      desc = "Buffer Explorer NeoTree (cwd)",
    },
  },
  opts = {
    filesystem = {
      hijack_netrw_behavior = "open_default"
    },
  },
  config = function(_, _)
    require("neo-tree").setup({
      window = {
        position = 'left',
        mappings = {
          ["Z"] = "expand_all_nodes",
        }
      }
    })
  end
}
