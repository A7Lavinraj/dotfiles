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
  keys = {
    {
      "<leader>n",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "[N]otification",
    },

    -- Picker
    --[[ {
      "<leader>ff",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files",
    },
    {
      "<leader>o",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Find Buffers",
    },
    {
      "<leader><leader>",
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = "Find in Current Buffer",
    },
    {
      "<leader>fc",
      function()
        Snacks.picker.files({ cwd = "~/workspace/dotfiles", hidden = true })
      end,
      desc = "Find Dotfiles",
    },
    {
      "<leader>sh",
      function()
        Snacks.picker.help()
      end,
      desc = "Find Help",
    },
    {
      "<leader>sH",
      function()
        Snacks.picker.highlights()
      end,
      desc = "Find Highlights",
    },
    {
      "<leader>sG",
      function()
        Snacks.picker.grep_word()
      end,
      desc = "Grep String",
    },
    {
      "<leader>sg",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    }, ]]
  },
}
