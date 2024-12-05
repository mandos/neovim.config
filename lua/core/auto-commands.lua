vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (mine)",
  group = vim.api.nvim_create_augroup("highlights-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
