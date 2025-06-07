---@diagnostic disable: undefined-global

return {
  "folke/snacks.nvim",
  lazy = false,
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
      end,
    })
  end,
  opts = {
    indent = {
      enabled = true,
    },
    picker = {
      layout = {
        preset = "select",
      },
    },
    notifier = {
      enabled = false,
      style = "compact",
      top_down = false,
    },
    styles = {
      notification_history = {
        relative = "editor",
        height = 0.8,
        width = 0.8,
      },
    },
    win = {
      backdrop = false,
    },
  },
}
