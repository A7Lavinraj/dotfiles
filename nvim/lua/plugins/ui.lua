return {
  {
    "folke/which-key.nvim",
    opts = {
      preset = "classic",
    },
  },
  {
    "folke/snacks.nvim",
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
        end,
      })
    end,
    opts = {
      picker = {
        layout = "vscode",
      },
      styles = {
        notification_history = {
          relative = "editor",
          height = 0.8,
          width = 0.8,
        },
      },
    },
    keys = {
      {
        "<leader>sl",
        function()
          Snacks.picker.lines()
        end,
        desc = "Search Lines",
      },
      {
        "<leader>fc",
        function()
          Snacks.picker.files({ cwd = "~/workspace/dotfiles", hidden = true })
        end,
        desc = "Find Config",
      },
      {
        "<leader>n",
        function()
          Snacks.notifier.show_history()
        end,
        desc = "Notification History",
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        command_palette = false,
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "right",
      },
    },
  },
}
