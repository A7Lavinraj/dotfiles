return {
  "stevearc/oil.nvim",
  lazy = false,
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    keymaps = {
      ["q"] = { "actions.close", mode = "n" },
    },
    float = {
      override = function(conf)
        conf.width = vim.o.columns
        conf.height = math.ceil(vim.o.lines * 0.5)
        conf.col = 0
        conf.row = vim.o.lines - vim.o.cmdheight - conf.height - 2

        if vim.o.laststatus ~= 0 then
          conf.row = conf.row - 1
        end

        return conf
      end,
    },
  },
  keys = {
    {
      "<leader>e",
      function()
        require("oil").toggle_float()
      end,
      desc = "Launch Oil.nvim",
    },
  },
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
}
