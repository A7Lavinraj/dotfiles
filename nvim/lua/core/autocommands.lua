vim.cmd([[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup terminal_opts
    autocmd!
    autocmd termOpen * setlocal nonumber
  augroup end
]])

local group = vim.api.nvim_create_augroup("TransparentBackground", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	group = group,
	callback = function()
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
	end,
})
