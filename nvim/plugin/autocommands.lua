local api = vim.api

local function augroup(name)
  return api.nvim_create_augroup(name, { clear = true })
end

api.nvim_create_autocmd("TextYankPost", {
  group = augroup "YankHighlight",
  command = "lua vim.hl.on_yank()",
})

api.nvim_create_autocmd("BufEnter", {
  group = augroup "FormatOptions",
  command = "set formatoptions-=ro",
})

api.nvim_create_autocmd("BufReadPost", {
  group = augroup "LastLOC",
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].neovim_last_loc then
      return
    end
    vim.b[buf].neovim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

api.nvim_create_autocmd("FileType", {
  group = augroup "CloseWithQ",
  pattern = { "checkhealth", "grug-far", "help", "lspinfo", "qf" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      vim.keymap.set("n", "q", function()
        vim.cmd "close"
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = "Quit buffer",
      })
    end)
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  group = augroup "TermTweaks",
  callback = function(arg)
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.scrolloff = 0

    vim.bo.filetype = "terminal"

    vim.keymap.set(
      "t",
      "<esc><esc>",
      "<c-\\><c-n>",
      { desc = "Escape Terminal", buffer = arg.buf, silent = true, noremap = true }
    )
  end,
})
