return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-tree/nvim-web-devicons" },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = [[
        cmake -S. -Bbuild -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_BUILD_TYPE=Release \
        && cmake --build build --config Release \
        && cmake --install build --prefix build
      ]],
    },
  },
  build = "make",
  cmd = "Telescope",
  keys = {
    { "<leader><leader>", "<CMD>Telescope current_buffer_fuzzy_find<CR>", desc = "Current Buffer Fuzzy Find" },

    { "<leader>ff", "<CMD>Telescope find_files<CR>", desc = "Find Files" },
    { "<leader>sH", "<CMD>Telescope highlights<CR>", desc = "Search Highlights" },
    { "<leader>sc", "<CMD>Telescope commands<CR>", desc = "Search Commands" },
    { "<leader>sh", "<CMD>Telescope help_tags<CR>", desc = "Search Help" },
    { "<leader>sk", "<CMD>Telescope keymaps<CR>", desc = "Search Keymaps" },

    {
      "H",
      function()
        require("telescope.builtin").buffers { initial_mode = "normal" }
      end,
      desc = "Find Config",
    },
    {
      "<leader>fs",
      function()
        require("telescope.builtin").find_files { cwd = vim.fn.stdpath "data" .. "/lazy" }
      end,
      desc = "Find Source",
    },
    {
      "<leader>fc",
      function()
        require("telescope.builtin").find_files { cwd = vim.fn.stdpath "config" }
      end,
      desc = "Find Config",
    },
    {
      "<leader>fd",
      function()
        require("telescope.builtin").find_files { cwd = vim.fn.expand "$HOME/workspace/dotfiles" }
      end,
      desc = "Find Dotfiles",
    },
    {
      "<leader>sg",
      function()
        require("custom.telescope").pickers.multigrep()
      end,
      desc = "Multi Grep",
    },
  },
  config = function()
    require("custom.telescope").setup()
  end,
}
