return {
	"iamcco/markdown-preview.nvim",
	build = "cd app && npm install",
	ft = { "markdown" },
	keys = {
		{ "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", desc = "Toggle Markdown Preview" },
	},
}
