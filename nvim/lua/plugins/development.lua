return {
  {
    -- "A7lavinraj/assistant.nvim",
    dir = "~/workspace/development/assistant.nvim",
    dependencies = { "folke/snacks.nvim" }, -- optional but recommended
    lazy = false, -- if you want to start TCP Listener on neovim startup
    keys = {
      { "<leader>a", "<cmd>Assistant<cr>", desc = "Assistant.nvim" },
    },
    opts = { ui = { border = "rounded", backdrop = 100 } },
  },
}
