return {
  "echasnovski/mini.nvim",
  config = function()
    require("mini.pairs").setup()

    require("mini.ai").setup()

    require("mini.notify").setup({
      lsp_progress = { enable = false },
    })

    require("mini.hipatterns").setup({
      highlighters = {
        hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
      },
    })
  end,
}
