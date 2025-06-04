return {
  -- "A7Lavinraj/assistant.nvim",
  -- branch = "stable",
  dir = "~/workspace/development/assistant.nvim/",
  lazy = false,
  keys = {
    { "<leader>a", "<cmd>Assistant<cr>", desc = "Assistant" },
  },
  opts = function()
    local actions = require("assistant.actions")
    return {
      ui = {
        diff_mode = true,
        title_components_separator = "",
      },
      mappings = {
        panel = {
          n = {
            ["x"] = actions.close_current,
          },
        },
      },
    }
  end,
}
