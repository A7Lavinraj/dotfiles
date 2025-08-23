local set = vim.keymap.set

local function opts_with_desc(desc)
  return { silent = true, noremap = true, desc = desc }
end

set("n", "<leader>l", "<CMD>Lazy<CR>", opts_with_desc "Lazy.nvim")
set("n", "<leader>m", "<CMD>Mason<CR>", opts_with_desc "Mason.nvim")

set("n", "<C-h>", "<C-W><C-h>", opts_with_desc "Goto Left Window")
set("n", "<C-j>", "<C-W><C-j>", opts_with_desc "Goto Below Window")
set("n", "<C-k>", "<C-W><C-k>", opts_with_desc "Goto Above Window")
set("n", "<C-l>", "<C-W><C-l>", opts_with_desc "Goto Right Window")

-- Move lines with respect to indentation
set("n", "<A-j>", "<CMD>execute 'move .+' . v:count1<CR>==", opts_with_desc "Move Down")
set("n", "<A-k>", "<CMD>execute 'move .-' . (v:count1 + 1)<CR>==", opts_with_desc "Move Up")
set("i", "<A-j>", "<esc><CMD>m .+1<CR>==gi", opts_with_desc "Move Down")
set("i", "<A-k>", "<esc><CMD>m .-2<CR>==gi", opts_with_desc "Move Up")
set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<CR>gv=gv", opts_with_desc "Move Down")
set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<CR>gv=gv", opts_with_desc "Move Up")
