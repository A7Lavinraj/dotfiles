local set = vim.keymap.set

set("n", "<C-h>", "<C-w><C-h>", { desc = "Goto left window" })
set("n", "<C-k>", "<C-w><C-k>", { desc = "Goto above window" })
set("n", "<C-l>", "<C-w><C-l>", { desc = "Goto right window" })
set("n", "<C-j>", "<C-w><C-j>", { desc = "Goto below window" })
