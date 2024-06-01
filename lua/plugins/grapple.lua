return {
	"cbochs/grapple.nvim",
	config = function()
    local grap = require("grapple")
		vim.keymap.set("n", "<leader>tg", grap.toggle, { desc = "Toggle Grapple" })
		vim.keymap.set("n", "<leader>tt", grap.toggle_tags, { desc = "Toggle Grapple Tags" })
		vim.keymap.set("n", "<leader>tw", grap.open_scopes, { desc = "Shows Grapple's Scopes" })

		vim.keymap.set("n", "<leader>g1", "<cmd>Grapple select index=1<cr>", { desc = "Select Grapple's 1st index" })
	end,
}
