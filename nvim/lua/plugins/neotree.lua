return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "echasnovski/mini.icons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  ---@module 'neo-tree'
  ---@type neotree.Config?
  opts = {
    enable_git_status = false,
    sources = { "filesystem", "buffers", "git_status" },
    open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
    close_if_last_window = false,
    hide_root_node = true,
    default_component_configs = {
      indent = {
        with_expanders = false,
      },
      file_size = {
        enabled = false,
      },
      type = {
        enabled = false,
      },
      last_modified = {
        enabled = false,
        format = "",
      },
      created = {
        enabled = false,
        format = "",
      },
    },
    window = {
      mappings = {
        ["l"] = "open",
        ["h"] = "close_node",
        ["<space>"] = "none",
        ["P"] = { "toggle_preview", config = { use_float = false } },
      },
    },
    filesystem = {
      bind_to_cwd = false,
      use_libuv_file_watcher = true,
      follow_current_file = { enabled = true },
      hijack_netrw_behavior = "disabled",
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false,
      },
    },
    popup_border_style = "rounded",
  },
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({
          toggle = true,
          position = "right",
          reveal = true,
          reveal_force_cwd = true,
        })
      end,
      { desc = "Toggle neotree (CWD)" },
    },
  },
}
