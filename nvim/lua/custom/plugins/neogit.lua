return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  cmd = "Neogit",
  opts = {
    graph_style = "unicode",
  },
  keys = {
    { "<leader>gg", "<CMD>Neogit<CR>", desc = "Neogit" },
  },
}
