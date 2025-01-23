return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = false,
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  opts = {
    pickers = {
      colorscheme = {
        enable_preview = true,
      },
    },
    defaults = {
      preview = false,
      prompt_prefix = "   ",
      selection_caret = " ",
      entry_prefix = " ",
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
        },
        width = 0.87,
        height = 0.50,
      },
    },
    extensions = {},
  },
  keys = {
    {
      "<leader>fc",
      function()
        require("telescope.builtin").find_files(require("telescope.themes").get_ivy({
          cwd = "~/workspace/dotfiles",
          hidden = true,
          layout_config = { height = 0.4 },
        }))
      end,
    },
    {
      "<leader>so",
      function()
        require("telescope.builtin").buffers(require("telescope.themes").get_ivy({ layout_config = { height = 0.4 } }))
      end,
      desc = "Buffers",
    },
    {
      "<leader>sf",
      function()
        require("telescope.builtin").find_files(
          require("telescope.themes").get_ivy({ layout_config = { height = 0.4 } })
        )
      end,
      desc = "Find File (CWD)",
    },
    {
      "<leader>sh",
      function()
        require("telescope.builtin").help_tags(
          require("telescope.themes").get_ivy({ layout_config = { height = 0.4 } })
        )
      end,
      desc = "Find Help",
    },
    {
      "<leader>sg",
      function()
        require("telescope.builtin").highlights(
          require("telescope.themes").get_ivy({ layout_config = { height = 0.4 } })
        )
      end,
      desc = "Find highlight groups",
    },
    {
      "<leader>/",
      function()
        require("telescope.builtin").live_grep(
          require("telescope.themes").get_ivy({ layout_config = { height = 0.4 } })
        )
      end,
      desc = "Live Grep",
    },
  },
}
