return {
  "ibhagwan/fzf-lua",
  dependencies = { "echasnovski/mini.icons" },
  cmd = { "FzfLua" },
  keys = {
    {
      "<leader>sf",
      "<cmd>FzfLua files<cr>",
      desc = "Search Files",
    },
    {
      "<leader>sh",
      "<cmd>FzfLua helptags<cr>",
      desc = "Search Help",
    },
    {
      "<leader>sH",
      "<cmd>FzfLua highlights<cr>",
      desc = "Search Hightlights",
    },
    {
      "<leader>/",
      "<cmd>FzfLua live_grep<cr>",
      desc = "Live grep",
    },
    {
      "<leader>so",
      function()
        require("fzf-lua").files({ cwd = "~/workspace/dotfiles" })
      end,
      desc = "Search Dotfiles",
    },
  },
  opts = {
    winopts = {
      split = "belowright new",
      preview = { hidden = true },
    },
  },
}
