return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function ()
      require("toggleterm").setup{}

      vim.keymap.set('n', "<leader>tf", ":ToggleTerm direction=float<CR>", { desc = "Toggle Floating Terminal" })
      vim.keymap.set('n', "<leader>th", ":ToggleTerm direction=horizontal size=20<CR>", { desc = "Toggle Horizontal Terminal" })
      vim.keymap.set('n', "<leader>tv", ":ToggleTerm direction=vertical size=80<CR>", { desc = "Toggle Vertical Terminal" })

    end
  },
}
