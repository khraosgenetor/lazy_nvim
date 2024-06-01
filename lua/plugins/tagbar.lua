return {
  "preservim/tagbar",
  config = function ()
    vim.keymap.set('n', '<leader>ct', ":TagbarToggle<CR>", {})
  end
}
