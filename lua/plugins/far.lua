return {
  "brooth/far.vim",
  config = function()
    vim.keymap.set("n", "<leader>nr", ":Far <find> <replace>", { desc = "Find and Replace in NeoVim." })
    vim.keymap.set("n", "<leader>nd", ":Fardo<CR>", { desc = "Perform the :Far command" })
  end,
}
