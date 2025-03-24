local disabled = {
  {
    "akinsho/bufferline.nvim",
  },
}

for i = 1, #disabled do
  disabled[i].enabled = false
end

return disabled
