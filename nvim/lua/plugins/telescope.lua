return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
    },
  },
  enabled = true,
  keys = {
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Find Files",
    },
    {
      "<leader>o",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Find Buffers",
    },
    {
      "<leader><leader>",
      function()
        require("telescope.builtin").current_buffer_fuzzy_find()
      end,
      desc = "Find in Current Buffer",
    },
    {
      "<leader>fs",
      function()
        require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("data") })
      end,
      desc = "Find Dotfiles",
    },
    {
      "<leader>fc",
      function()
        require("telescope.builtin").find_files({ cwd = "~/workspace/dotfiles", hidden = true })
      end,
      desc = "Find Dotfiles",
    },
    {
      "<leader>sh",
      function()
        require("telescope.builtin").help_tags()
      end,
      desc = "Find Help",
    },
    {
      "<leader>sH",
      function()
        require("telescope.builtin").highlights()
      end,
      desc = "Find Highlights",
    },
    {
      "<leader>sG",
      function()
        require("telescope.builtin").grep_string()
      end,
      desc = "Grep String",
    },
    {
      "<leader>sg",
      function()
        local opts = {}
        opts.cwd = opts.cwd or vim.uv.cwd()

        require("telescope.pickers")
          .new(opts, {
            debounce = 100,
            prompt_title = "Live Grep",
            finder = require("telescope.finders").new_async_job({
              command_generator = function(prompt)
                if not prompt or prompt == "" then
                  return nil
                end

                local pieces = vim.split(prompt, "  ")
                local args = { "rg" }
                if pieces[1] then
                  table.insert(args, "-e")
                  table.insert(args, pieces[1])
                end

                if pieces[2] then
                  table.insert(args, "-g")
                  table.insert(args, pieces[2])
                end

                return vim
                  .iter({
                    args,
                    { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
                  })
                  :flatten()
                  :totable()
              end,
              entry_maker = require("telescope.make_entry").gen_from_vimgrep(opts),
              cwd = opts.cwd,
            }),
            previewer = require("telescope.config").values.grep_previewer(opts),
            sorter = require("telescope.sorters").empty(),
          })
          :find()
      end,
      desc = "Live Grep",
    },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        preview = false,
        prompt_prefix = "   ",
        selection_caret = " ",
        entry_prefix = " ",
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.5,
          },
          width = 0.6,
          height = 0.7,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })

    require("telescope").load_extension("fzf")
  end,
}
