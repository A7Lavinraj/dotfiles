local function get_filename()
  return vim.fn.expand("%:t")
end

return {
  "nvim-lualine/lualine.nvim",
  -- dir = "~/workspace/development/lualine.nvim",
  dependencies = { "echasnovski/mini.icons" },
  event = "VeryLazy",
  enabled = false,
  opts = {
    options = {
      theme = "auto",
      globalstatus = 3,
      disabled_filetypes = { statusline = { "snacks_dashboard" } },
      component_separators = { left = "|", right = "|" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_b = { { "branch", icon = "󰘬" } },
      lualine_c = {
        get_filename,
      },
      lualine_x = {},
      lualine_y = { "lsp_status" },
      lualine_z = {
        function()
          return "  " .. os.date("%R")
        end,
      },
    },
    extensions = { "neo-tree", "lazy", "oil", "assistant" },
  },
}
