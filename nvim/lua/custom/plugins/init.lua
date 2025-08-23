local function with_prefix(path)
  return vim.fn.expand "$HOME/workspace/development/" .. path
end

return {
  {
    name = "Fyler.nvim",
    dir = with_prefix "fyler.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    opts = {
      icon_provider = "nvim-web-devicons",
      views = {
        explorer = {
          confirm_simple = true,
          default_explorer = true,
          git_status = false,
          win = {
            win_opts = {
              number = false,
              relativenumber = false,
              cursorline = false,
            },
          },
        },
      },
    },
    keys = {
      { "<leader>e", "<CMD>Fyler<CR>", desc = "Fyler.nvim" },
    },
  },
  {
    name = "Oil.nvim",
    dir = with_prefix "oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    opts = {
      default_file_explorer = false,
    },
    keys = {
      { "<leader>o", "<CMD>Oil<CR>", desc = "Oil.nvim" },
    },
  },
}
