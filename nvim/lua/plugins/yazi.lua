return {
  ---@type LazySpec
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  enabled = false,
  keys = {
    {
      "<leader>e",
      "<cmd>Yazi toggle<cr>",
      desc = "Open yazi at the current file",
    },
  },
  ---@type YaziConfig
  opts = {
    open_for_directories = false,
    keymaps = {
      show_help = '<f1>',
    },
  },
}
