return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("gitsigns").setup()
		vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "See git chunk changes" })
		vim.keymap.set("n", "<leader>gc", ":Gitsigns toggle_current_line_blame<CR>", { desc = "See git commits" })
	end,
}
