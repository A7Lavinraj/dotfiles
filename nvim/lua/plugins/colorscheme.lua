return {
  {
    "RRethy/base16-nvim",
    enabled = false,
    config = function()
      vim.cmd.colorscheme("base16-everforest")
    end,
  },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000,
    enabled = false,
    config = function()
      require("everforest").setup({
        transparent_background_level = 2,
      })

      vim.cmd.colorscheme("everforest")
    end,
  },
  {
    "folke/tokyonight.nvim",
    enabled = false,
    config = function()
      require("tokyonight").setup({
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      })

      vim.cmd.colorscheme("tokyonight-night")
    end,
  },
  {
    "tjdevries/gruvbuddy.nvim",
    dependencies = { "tjdevries/colorbuddy.nvim" },
    enabled = false,
    config = function()
      vim.cmd.colorscheme("gruvbuddy")
    end,
  },
  {
    "RishabhRD/gruvy",
    dependencies = { "rktjmp/lush.nvim" },
    enabled = false,
    config = function()
      vim.cmd.colorscheme("gruvy")
    end,
  },
  {
    "marko-cerovac/material.nvim",
    enabled = false,
    config = function()
      require("material").setup({
        disable = {
          background = true,
        },
      })
      vim.cmd.colorscheme("material-deep-ocean")
    end,
  },
  {
    "AlexvZyl/nordic.nvim",
    enabled = true,
    config = function()
      require("nordic").setup({
        on_highlight = function(highlights, _)
          for _, highlight in pairs(highlights) do
            highlight.italic = false
          end
        end,
        italic_comments = false,
        transparent = { bg = true, float = true },
      })
      vim.cmd.colorscheme("nordic")
    end,
  },
}
