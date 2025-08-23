local conf = require("telescope.config").values
local finders = require "telescope.finders"
local make_entry = require "telescope.make_entry"
local pickers = require "telescope.pickers"

local M = {}

M.pickers = {}
M.pickers.multigrep = function(opts)
  opts = opts or {}
  opts.cwd = opts.cwd and vim.fn.expand(opts.cwd) or vim.uv.cwd()
  opts.pattern = opts.pattern or "%s"

  local custom_grep = finders.new_async_job {
    command_generator = function(prompt)
      if not prompt or prompt == "" then
        return nil
      end

      local prompt_split = vim.split(prompt, "  ")
      local args = { "rg" }
      if prompt_split[1] then
        table.insert(args, "-e")
        table.insert(args, prompt_split[1])
      end

      if prompt_split[2] then
        table.insert(args, "-g")

        local pattern
        if opts.shortcuts[prompt_split[2]] then
          pattern = opts.shortcuts[prompt_split[2]]
        else
          pattern = prompt_split[2]
        end

        table.insert(args, string.format(opts.pattern, pattern))
      end

      return vim
        .iter({
          args,
          {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
        })
        :flatten()
        :totable()
    end,
    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd,
  }

  opts = vim.tbl_deep_extend("force", require("telescope.themes").get_ivy(), opts)
  pickers
    .new(opts, {
      debounce = 100,
      prompt_title = "Live Grep (with filters)",
      finder = custom_grep,
      previewer = conf.grep_previewer(opts),
      sorter = require("telescope.sorters").empty(),
    })
    :find()
end

function M.setup()
  local telescope = require "telescope"
  for _, picker in ipairs {
    "autocommands",
    "buffers",
    "builtin",
    "colorscheme",
    "commands",
    "current_buffer_fuzzy_find",
    "find_files",
    "grep_string",
    "help_tags",
    "highlights",
    "keymaps",
    "live_grep",
    "lsp_definitions",
    "lsp_document_symbols",
    "lsp_implementations",
    "lsp_references",
  } do
    pickers[picker] = { theme = "ivy" }
  end

  telescope.setup {
    defaults = {
      mappings = {
        n = {
          ["q"] = "close",
          ["x"] = "delete_buffer",
        },
      },
      selection_caret = " ",
      entry_prefix = " ",
      sorting_strategy = "ascending",
    },
    pickers = pickers,
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
  }

  telescope.load_extension "fzf"
end

return M
