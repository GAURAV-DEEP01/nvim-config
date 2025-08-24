return {
	"sindrets/diffview.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		require("diffview").setup({
			-- Optional configuration can go here
		})
	end,
}
