return {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = false,
  enabled = false,
  branch = "v3.x",
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Neotree toggle" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
  },
}
