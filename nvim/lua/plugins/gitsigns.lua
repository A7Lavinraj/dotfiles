-- git integration for blames and status
return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  opts = {
    current_line_blame = true,
  },
  config = function(_, opts)
    require("gitsigns").setup(opts)
  end,
}
