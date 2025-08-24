return {
	"folke/tokyonight.nvim",
	priority = 1000,
	opts = {
		style = "night",
		on_colors = function(colors)
			-- Background
			colors.bg = "#121212"
			colors.bg_float = "#121212"
			colors.bg_sidebar = "#151515"

			-- Text adjustments
			colors.fg = "#aaaaaa" -- Main text
			colors.fg_dark = "#888888" -- Darker text
			colors.comment = "#666666" -- Softer comments
			colors.fg_gutter = "#555555" -- Line numbers/gutter
			colors.fg_border = "#333333" -- Borders
		end,
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd.colorscheme("tokyonight-night")
	end,
}
