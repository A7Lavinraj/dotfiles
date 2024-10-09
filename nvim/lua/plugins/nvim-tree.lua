return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "stevearc/dressing.nvim",
  },
  opts = {
    view = {
      width = 50,
    },
    renderer = {
      group_empty = true,
      root_folder_label = false,
    },
    filters = {
      dotfiles = false,
    },
  },
}
