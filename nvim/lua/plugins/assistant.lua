return {
  -- This is for production usage (User should use this config and set `enabled` field to `true`)
  {
    "A7Lavinraj/assistant.nvim",
    enabled = false,
    lazy = false,
    dependencies = { "stevearc/dressing.nvim" },
    -- dir = "~/workspace/development/assistant.nvim",
    keys = {
      { "<leader>a", "<cmd>AssistantToggle<cr>", desc = "Toggle Assistant.nvim window" },
    },
    opts = {},
  },

  -- This is for development usage
  {
    "Assistant.nvim",
    dir = "~/workspace/development/assistant.nvim",
    dependencies = {
      { "Assistant-stdio-mod", dir = "~/workspace/development/assistant-stdio-mod.nvim" },
    },
    enabled = true,
    lazy = false,
    config = function()
      require("assistant").setup()
      require("assistant._modifiers").register("stdio-mod", {})
    end,
  },
}
