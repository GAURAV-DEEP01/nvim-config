return {
	"lewis6991/gitsigns.nvim",
	config = function()
		-- Set up highlights first
		vim.api.nvim_set_hl(0, "GitSignsAdd", { link = "GitSignsAdd" })
		vim.api.nvim_set_hl(0, "GitSignsAddLn", { link = "GitSignsAddLn" })
		vim.api.nvim_set_hl(0, "GitSignsAddNr", { link = "GitSignsAddNr" })
		vim.api.nvim_set_hl(0, "GitSignsChange", { link = "GitSignsChange" })
		vim.api.nvim_set_hl(0, "GitSignsChangeLn", { link = "GitSignsChangeLn" })
		vim.api.nvim_set_hl(0, "GitSignsChangeNr", { link = "GitSignsChangeNr" })
		vim.api.nvim_set_hl(0, "GitSignsChangedelete", { link = "GitSignsChange" })
		vim.api.nvim_set_hl(0, "GitSignsChangedeleteLn", { link = "GitSignsChangeLn" })
		vim.api.nvim_set_hl(0, "GitSignsChangedeleteNr", { link = "GitSignsChangeNr" })
		vim.api.nvim_set_hl(0, "GitSignsDelete", { link = "GitSignsDelete" })
		vim.api.nvim_set_hl(0, "GitSignsDeleteLn", { link = "GitSignsDeleteLn" })
		vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { link = "GitSignsDeleteNr" })
		vim.api.nvim_set_hl(0, "GitSignsTopdelete", { link = "GitSignsDelete" })
		vim.api.nvim_set_hl(0, "GitSignsTopdeleteLn", { link = "GitSignsDeleteLn" })
		vim.api.nvim_set_hl(0, "GitSignsTopdeleteNr", { link = "GitSignsDeleteNr" })

		-- Then set up gitsigns with the new configuration
		require("gitsigns").setup({
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "│" },
				topdelete = { text = "‾" },
				changedelete = { text = "│" },
			},
			preview_config = {
				border = "single",
				relative = "cursor",
			},
			numhl = true,
			linehl = false,
			current_line_blame = true,
			sign_priority = 6,
			update_debounce = 200,
			status_formatter = nil,
			max_file_length = 40000,
			diff_opts = { internal = true },
		})
	end,
}
