return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope-ui-select.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    opts = {
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
          height = 0.60,
        },
      },
    },
    keys = {
      {
        "<leader>fc",
        function()
          require("telescope.builtin").find_files({
            cwd = "~/workspace/dotfiles",
            hidden = true,
          })
        end,
      },
      {
        "<leader>o",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Buffers",
      },
      {
        "<leader>sf",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Find File (CWD)",
      },
      {
        "<leader>sg",
        function()
          require("telescope.builtin").git_files()
        end,
        desc = "Search Git Files",
      },
      {
        "<leader>sh",
        function()
          require("telescope.builtin").help_tags()
        end,
        desc = "Find Help",
      },
      {
        "<leader>sH",
        function()
          require("telescope.builtin").highlights()
        end,
        desc = "Find highlight groups",
      },
      {
        "<leader>sM",
        function()
          require("telescope.builtin").man_pages()
        end,
        desc = "Map Pages",
      },
      {
        "<leader>so",
        function()
          require("telescope.builtin").oldfiles()
        end,
        desc = "Open Recent File",
      },
      {
        "<leader>/",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Live Grep",
      },
    },
  },
}
