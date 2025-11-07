return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup({})

		require("telescope").load_extension("harpoon")

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "Harpoon add file" })

		vim.keymap.set("n", "<A-j>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon menu" })

		vim.keymap.set("n", "<leader>fh", "<cmd>Telescope harpoon marks<CR>", { desc = "Find Harpoon mark" })

		vim.keymap.set("n", "<leader>r", function()
			harpoon:list():next()
		end, { desc = "Next Harpoon file" })

		vim.keymap.set("n", "<leader>R", function()
			harpoon:list():prev()
		end, { desc = "Previous Harpoon file" })
	end,
}
