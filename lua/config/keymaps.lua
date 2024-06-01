-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Neotree

keymap.set("n", "<C-n>", ":Neotree left reveal filesystem toggle<CR>", opts)

-- Git

keymap.set("n", "<leader>gs", ":Gitsigns preview_hunk<CR>", { desc = "Show Git Hunk" })
keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Show Git Blame for current line." })
keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "Show Git Blame for the entire file" })
keymap.set(
  "n",
  "<leader>gc",
  ":Git commit<CR>",
  { desc = "Commit to VCS from NeoVim. Use SPC GA to add new files first." }
)
keymap.set(
  "n",
  "<leader>ga",
  ":Git add .<CR>",
  { desc = "Add files to VCS from NeoVim. Use SPC GC to commit the files." }
)
keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "Push files to VCS from NeoVim" })
keymap.set("n", "<leader>gl", ":Git log<CR>", { desc = "Show VCS Log" })
keymap.set("n", "<leader>gg", ":Git pull<CR>", { desc = "Pull recent changes from VCS" })
keymap.set("n", "<leader>gr", ":Git clone ", { desc = "Pull recent changes from VCS" })
keymap.set("n", "<C-g>", ":Git<CR>", { desc = "Show VCS and its unstaged changes" })

-- NoneLS

keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format code", noremap = true, silent = true })

-- LSP

keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
keymap.set("n", "<leader>gh", vim.lsp.buf.hover, opts)
keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
keymap.set("n", "<leader>gk", vim.lsp.buf.signature_help, opts)
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

-- AI

keymap.set("n", "<leader>ai", ":Gen<CR>")

-- Telescope

local builtin = require("telescope.builtin")

keymap.set("n", "<leader>ff", builtin.find_files, {})
keymap.set("n", "<leader>fg", builtin.live_grep, {})
keymap.set("n", "<leader>fb", builtin.buffers, {})
keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- Codeium

local filetypes = {
  "javascript",
  "python",
  "lua",
  "html",
  "css",
  "json",
  "typescript",
  "ruby",
  "perl",
  "bash",
  "sh",
  "make",
  "pod",
  "markdown",
  "yaml",
}

for _, ft in ipairs(filetypes) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = ft,
    callback = function()
      vim.keymap.set("n", "<tab>", ":CodeiumComplete<CR>", { buffer = true, noremap = true, silent = true })
    end,
  })
end
