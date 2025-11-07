return {
	{
		"sindrets/diffview.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("diffview").setup({})
		end,
	},
	{
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
	},
	{
		"tpope/vim-fugitive",
		config = function()
			-- Optional configuration can go here
			-- For example, you can set up key mappings for Git commands
			function CloseNvimTree(cmd)
				local bufname = vim.api.nvim_buf_get_name(0)
				if string.match(bufname, "NvimTree") then
					vim.cmd("NvimTreeClose")
				end
				vim.cmd(cmd)
			end
			vim.api.nvim_set_keymap(
				"n",
				"<leader>gcc",
				[[:lua CloseNvimTree("Git commit")<CR>]],
				{ desc = "Git commit", noremap = true, silent = true }
			)

			vim.api.nvim_set_keymap(
				"n",
				"<leader>gcs",
				[[:lua CloseNvimTree("Git commit --signoff")<CR>]],
				{ desc = "Git commit with signoff", noremap = true, silent = true }
			)

			vim.api.nvim_set_keymap(
				"n",
				"<leader>gt",
				[[:lua CloseNvimTree("Git log --graph --oneline --all")<CR>]],
				{ desc = "Git graph log", noremap = true, silent = true }
			)

			vim.api.nvim_set_keymap(
				"n",
				"<leader>gl",
				[[:lua CloseNvimTree("Git log")<CR>]],
				{ desc = "Git log", noremap = true, silent = true }
			)

			vim.api.nvim_set_keymap("n", "<leader>gs", ":Git status<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<leader>gpp", ":Git push<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<leader>gpf", ":Git push --force<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<leader>gpl", ":Git pull<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<leader>grn", ":Git reset --hard<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", { noremap = true, silent = true })

			vim.api.nvim_set_keymap(
				"n",
				"<leader>grs",
				":Git reset --soft HEAD~1<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>grh",
				":Git reset --hard HEAD~1<CR>",
				{ noremap = true, silent = true }
			)
		end,
	},
}
