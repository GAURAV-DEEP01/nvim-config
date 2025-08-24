return {
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

		vim.api.nvim_set_keymap("n", "<leader>grs", ":Git reset --soft HEAD~1<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>grh", ":Git reset --hard HEAD~1<CR>", { noremap = true, silent = true })
	end,
}
