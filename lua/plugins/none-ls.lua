return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
    "mfussenegger/nvim-lint",
  },
  config = function()
    local null_ls = require("null-ls")

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
        require("lint").try_lint("biomejs")
      end,
    })


    null_ls.setup({
      sources = {
        -- require("none-ls.diagnostics.eslint_d"),
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.asmfmt,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.google_java_format,
      },
    })
    vim.keymap.set(
      "n",
      "<leader>gf",
      vim.lsp.buf.format,
      { desc = "Format your code. PS: Only works if formatting is setup." }
    )
  end,
}
