local function folder()
  return " " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
end

local function file()
  local filename = vim.fn.expand("%:t")

  if filename == "NvimTree_1" then
    return ""
  end

  return filename
end

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      component_separators = " ",
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff" },
      lualine_c = { file },
      lualine_x = {},
      lualine_y = {},
      lualine_z = { folder },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
  },
}
