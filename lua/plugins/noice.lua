return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		-- Set up nvim-notify explicitly before configuring noice
		require("notify").setup({
			background_colour = "#1e1e2e", -- Set a valid background color (change as needed)
			stages = "fade", -- Animation style for notifications
			timeout = 3000, -- Notification timeout in milliseconds
			top_down = false, -- Notifications appear from the bottom if false
		})

		-- Optionally, define a custom highlight for NotifyBackground
		vim.cmd([[highlight NotifyBackground guibg=#1e1e2e]])

		-- Now, set up noice.nvim
		require("noice").setup({
			cmdline = {
				view = "cmdline_popup", -- Floating command line
			},
			messages = {
				enabled = true,
				view = "mini", -- Change this to "echo" or "mini" for simpler UI
			},
			popupmenu = {
				enabled = true, -- Enable popups for completions
			},
			notify = {
				enabled = true, -- Enable sending notifications to `nvim-notify`
			},
		})
	end,
}
