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
    ---@type snacks.Config
    opts = {
      picker = {
        layout = {
          preset = "ivy",
          fullscreen = true,
        },
      },
      dashboard = {
        sections = {
          { section = "header" },
          { section = "startup" },
        },
      },
      notifier = {
        style = "compact",
        top_down = false,
      },
      styles = {
        notification_history = {
          relative = "editor",
          height = 0.8,
          width = 0.8,
        },
      },
      win = {
        backdrop = false,
      },
    },
    keys = {
      {
        "<leader>n",
        function()
          Snacks.notifier.show_history()
        end,
        desc = "Notification History",
      },
      {
        "<s-h>",
        function()
          Snacks.picker.buffers()
        end,
        desc = "Find Buffers",
      },
      {
        "<leader>fc",
        function()
          Snacks.picker.files({ cwd = "~/workspace/dotfiles", hidden = true })
        end,
        desc = "Find Config",
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
    "catppuccin/nvim",
    opts = {
      transparent_background = true,
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
      default_component_configs = {
        indent = {
          with_expanders = false,
        },
      },
      window = {
        position = "right",
        use_float = true,
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
        },
      },
    },
    keys = {
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = true, position = "current", dir = vim.uv.cwd(), reveal = true })
        end,
        { desc = "Toggle neotree (CWD)" },
      },
      {
        "<leader>E",
        function()
          require("neo-tree.command").execute({
            toggle = true,
            position = "current",
            dir = LazyVim.root(),
            reveal = true,
          })
        end,
        { desc = "Toggle neotree (ROOT)" },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {

      options = {
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_b = { { "branch", icon = "󰘬" } },
      },
    },
  },
  {
    "LunarVim/breadcrumbs.nvim",
    dependencies = {
      "SmiteshP/nvim-navic",
    },
    config = function()
      require("breadcrumbs").setup()
      vim.api.nvim_set_hl(0, "WinBar", { link = "Normal" })
      vim.api.nvim_set_hl(0, "WinBarNC", { link = "Normal" })
    end,
  },
  {
    "A7Lavinraj/poimandres.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      disable_background = true,
      disable_float_background = true,
    },
  },
}
