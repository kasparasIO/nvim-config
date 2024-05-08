vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight text after yanking",
  callback = function ()
    vim.highlight.on_yank()
  end
})
