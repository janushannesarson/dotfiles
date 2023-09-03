-- Merging with default neo-tree plugin spec

return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      mappings = {
        ["Z"] = "expand_all_nodes",
      },
    },
  },
}
