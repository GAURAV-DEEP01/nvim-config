return {
	"github/copilot.vim",
	lazy = false,
	config = function()
		vim.g.copilot_no_tab_map = true

		-- Proper way to use the plugin's Vimscript implementation
		vim.cmd([[imap <silent> <script><expr> <Tab> copilot#Accept("\<CR>")]])
	end,
}
