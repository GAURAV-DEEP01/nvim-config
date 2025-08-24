return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			variant = "main", -- rich contrast
			disable_background = false,
			disable_float_background = true,
			disable_italics = true,
		})

		vim.cmd("colorscheme rose-pine")

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
}
