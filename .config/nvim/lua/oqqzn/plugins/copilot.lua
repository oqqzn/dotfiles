return {
	"github/copilot.vim",
	config = function()
		-- Optional: Disable Tab mapping to prevent conflicts
		vim.g.copilot_no_tab_map = true

		-- Optional: Map Copilot suggestion acceptance to <C-J>
		vim.api.nvim_set_keymap("i", "<C-E>", 'copilot#Accept("<CR>")', { silent = true, expr = true, noremap = true })
	end,
}
