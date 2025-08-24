return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			lazy = true,
			flavour = "macchiato",
			background = {
				light = "latte",
				dark = "mocha",
			},
			transparent_background = true,
			dim_inactive = {
				enabled = true,
				percentage = 0.03,
			},
			color_overrides = {
				mocha = {
					base = "#1a1d2a",
					mantle = "#212432",
					crust = "#2a2d3c",

					text = "#8B8BA5",
					subtext1 = "#75759C",
					subtext0 = "#6C6C8E",
					surface0 = "#1a1d2a",
					surface1 = "#212432",
					surface2 = "#2a2d3c",
					overlay0 = "#2f3242",
					overlay1 = "#3a3d4f",
					overlay2 = "#464959",
				},
			},
			integrations = {
				treesitter = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
				},
				telescope = true,
				which_key = true,
				cmp = true,
				gitsigns = true,
				indent_blankline = {
					enabled = true,
					scope_color = "overlay2",
				},
			},
		})
		-- vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
