return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		local notify = require("notify")

		-- Setup nvim-notify
		notify.setup({
			background_colour = "#1e1e2e",
			stages = "fade",
			timeout = 3000,
			top_down = false,
			merge_duplicates = true,
		})

		-- Override vim.notify to suppress WARN messages
		vim.notify = function(msg, level, opts)
			if level == vim.log.levels.WARN then
				return
			end
			notify(msg, level, opts)
		end

		-- Setup noice.nvim
		require("noice").setup({
			cmdline = { view = "cmdline_popup" },
			messages = { view = "mini" },
			popupmenu = { enabled = true },
			routes = {
				{
					filter = { event = "notify", kind = "warn" },
					opts = { skip = true },
				},
			},
		})
	end,
}
