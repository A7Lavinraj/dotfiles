return {
  {
    "folke/tokyonight.nvim",
    enabled = true,
    opts = {
      transparent = true,
      style = "night",
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.api.nvim_command("colorscheme tokyonight")
    end,
  },
  {
    "catppuccin/nvim",
    enabled = false,
    opts = {
      transparent_background = true
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.api.nvim_command("colorscheme catppuccin-mocha")
    end
  },
  {
    "EdenEast/nightfox.nvim",
    enabled = false,
    opts = {
      options = {
        transparent = true
      }
    },
    config = function(_, opts)
      require("nightfox").setup(opts)
      vim.api.nvim_command("colorscheme terafox")
    end
  },
  {
    "sainnhe/gruvbox-material",
    enabled = false,
    config = function()
      vim.api.nvim_command("colorscheme gruvbox-material")
    end
  },
  {
    "bluz71/vim-nightfly-colors",
    enabled = false,
    config = function()
      vim.g.nightflyTransparent = true
      vim.api.nvim_command("colorscheme nightfly")
    end
  },
  {
    "maxmx03/solarized.nvim",
    enabled = false,
    opts = {
      transparent = {
        enabled = true,
        pmenu = true,
        normal = true,
        normalfloat = true,
        neotree = true,
        nvimtree = true,
        whichkey = true,
        telescope = true,
        lazy = true,
        mason = true,
      },
    },
    config = function(_, opts)
      require('solarized').setup(opts)
      vim.api.nvim_command("colorscheme solarized")
    end
  },
  {
    "tiagovla/tokyodark.nvim",
    enabled = false,
    opts = {
      transparent_background = true
    },
    config = function (_, opts)
      require("tokyodark").setup(opts)
      vim.api.nvim_command("colorscheme tokyodark")
    end
  },
  {
    "olivercederborg/poimandres.nvim",
    enabled = false,
    opts = {
      disable_background = true,
      disable_float_background = true,
      bold_vert_split = true
    },
    config = function (_, opts)
      require("poimandres").setup(opts)
      vim.api.nvim_command("colorscheme poimandres")
    end
  },
  {
    "oxfist/night-owl.nvim",
    enabled = false,
    opts = {
      transparent_background = true,
    },
    config = function (_, opts)
      require("night-owl").setup(opts)
      vim.api.nvim_command("colorscheme night-owl")
    end
  },
  {
    "dgox16/oldworld.nvim",
    enabled = false,
    config = function ()
      vim.api.nvim_command("colorscheme oldworld")
    end
  }
}
