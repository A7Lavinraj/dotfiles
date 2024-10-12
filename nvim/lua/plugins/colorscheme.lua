return {
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
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd("colorscheme tokyonight")
  end,
}
