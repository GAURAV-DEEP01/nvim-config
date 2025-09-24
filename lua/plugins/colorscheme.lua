return {
	{

		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "main", -- rich contrast
				disable_background = false,
				disable_float_background = true,
				disable_italics = true,
			})

			vim.cmd.colorscheme("rose-pine")

			-- Set background and UI elements slightly lighter than pitch black
			vim.defer_fn(function()
				vim.cmd([[highlight Normal guibg=#101010]])
				vim.cmd([[highlight NormalNC guibg=#0c0c0c]])
				vim.cmd([[highlight SignColumn guibg=#101010]])
				vim.cmd([[highlight LineNr guibg=#101010]])
				vim.cmd([[highlight FoldColumn guibg=#101010]])
				vim.cmd([[highlight VertSplit guibg=NONE guifg=#2a2a2a]])
				vim.cmd([[highlight WinSeparator guibg=NONE guifg=NONE]])
				vim.cmd([[highlight Comment guifg=#444444]])
				vim.cmd([[highlight DiffText guibg=#252525 guifg=NONE]]) -- Less intense than #2a2a2a
				vim.cmd([[highlight DiffChange guibg=#1a1a1a guifg=NONE]]) -- Even softer for changed lines
				vim.cmd([[highlight DiffAdd guibg=#182818 guifg=NONE]]) -- Slightly darker greenish add
				vim.cmd([[highlight DiffDelete guibg=#281818 guifg=NONE]]) -- Slightly darker reddish delete

				-- Optional: soften file panel in Diffview
				vim.cmd([[highlight DiffviewFilePanelNormal guibg=#101010]])
				vim.cmd([[highlight DiffviewFilePanelTitle guifg=#555555]])
			end, 10)

			-- Soften error message appearance
			vim.cmd([[highlight ErrorMsg guifg=#cc6666 guibg=#1a1a1a]])
			vim.cmd([[highlight DiagnosticError guifg=#cc6666 guibg=#1a1a1a]])
			vim.cmd([[highlight DiagnosticUnderlineError gui=undercurl guisp=#cc6666]])
			vim.cmd([[highlight LspDiagnosticsDefaultError guifg=#cc6666 guibg=NONE]])
			vim.cmd([[highlight LspDiagnosticsVirtualTextError guifg=#aa4444 guibg=#1a1a1a]])

			vim.cmd([[highlight DiagnosticVirtualTextError guifg=#553333 guibg=NONE]])
			vim.cmd([[highlight DiagnosticVirtualTextWarn  guifg=#665533 guibg=NONE]])
			vim.cmd([[highlight DiagnosticVirtualTextInfo  guifg=#335566 guibg=NONE]])
			vim.cmd([[highlight DiagnosticVirtualTextHint  guifg=#445555 guibg=NONE]])

			vim.cmd([[highlight CursorLine guibg=#1a1a1a]])
			-- Clean up vertical lines and EOB chars
			vim.opt.fillchars:append({ vert = " " })
			vim.opt.fillchars:append({ eob = " " })
		end,
	},
	{
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
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		opts = {
			style = "night",
			on_colors = function(colors)
				colors.bg = "#121212"
				colors.bg_float = "#121212"
				colors.bg_sidebar = "#151515"

				colors.fg = "#aaaaaa" -- Main text
				colors.fg_dark = "#888888" -- Darker text
				colors.comment = "#666666" -- Softer comments
				colors.fg_gutter = "#555555" -- Line numbers/gutter
				colors.fg_border = "#333333" -- Borders
			end,
		},
		-- config = function(_, opts)
		-- 	require("tokyonight").setup(opts)
		-- 	vim.cmd.colorscheme("tokyonight-night")
		-- end,
	},
}
