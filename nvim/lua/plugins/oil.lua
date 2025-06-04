return {
  "stevearc/oil.nvim",
  lazy = false,
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    columns = {
      "icon",
      "permissions",
      "size",
      "mtime",
    },
    keymaps = {
      ["q"] = { "actions.close", mode = "n" },
    },
    float = {
      border = "none",
      override = function(conf)
        conf.width = vim.o.columns
        conf.height = vim.o.lines - 1
        conf.col = 0
        conf.row = 0
        return conf
      end,
    },
    skip_confirm_for_simple_edits = true,
  },
  keys = {
    {
      "<leader>fo",
      function()
        require("oil").toggle_float()
      end,
      desc = "Launch Oil.nvim",
    },
  },
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
}
