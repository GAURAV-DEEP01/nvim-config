return {
	{
		enabled = false,
		"olimorris/codecompanion.nvim",
		cmd = { "CodeCompanionActions", "CodeCompanionChat" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			{
				"MeanderingProgrammer/render-markdown.nvim",
				ft = { "markdown", "codecompanion" },
				opts = {
					render_modes = true,
					sign = { enabled = false },
				},
			},
		},
	},
	{
		enabled = false,
		"github/copilot.vim",
		lazy = false,
		config = function()
			vim.g.copilot_no_tab_map = true

			-- Proper way to use the plugin's Vimscript implementation
			vim.cmd([[imap <silent> <script><expr> <Tab> copilot#Accept("\<CR>")]])
		end,
	},
}
