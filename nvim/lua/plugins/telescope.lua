return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = false,
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-ui-select.nvim",
  },
  keys = {
    { "<leader>ff",       "<cmd>Telescope find_files<cr>", silent = true, desc = "Telescope find files" },
    { "<leader><leader>", "<cmd>Telescope buffers<cr>",    silent = true, desc = "Telescope search buffers" },
    { "<leader>sh",       "<cmd>Telescope help_tags<cr>",  silent = true, desc = "Telescope search help" },
    {
      "<leader>fc",
      function()
        require("telescope.builtin").find_files({
          cwd = "~/coding/dotfiles",
          hidden = true,
        })
      end,
      silent = true,
      desc = "Telescope config",
    },
  },
}
