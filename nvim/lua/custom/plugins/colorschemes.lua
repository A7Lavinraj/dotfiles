return {
  {
    "folke/tokyonight.nvim",
    priority = 10000,
  },
  {
    "marko-cerovac/material.nvim",
    priority = 10000,
  },
  {
    "EdenEast/nightfox.nvim",
    priority = 10000,
    opts = {
      options = {
        transparent = true,
      },
    },
    config = function(_, opts)
      require("nightfox").setup(opts)
      vim.cmd.colorscheme "nightfox"
    end,
  },
}
