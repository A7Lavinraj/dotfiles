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
        prompt_prefix = "  ",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            width = 0.5,
            height = 0.5,
          },
        },
      },
    },
    keys = {
      {
        "<leader>fc",
        function()
          require("telescope.builtin").find_files({
            cwd = "~/coding/dotfiles",
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
