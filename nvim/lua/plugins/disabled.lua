local disabled = {
  {
    "akinsho/bufferline.nvim",
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
  },
}

for i = 1, #disabled do
  disabled[i].enabled = false
end

return disabled
