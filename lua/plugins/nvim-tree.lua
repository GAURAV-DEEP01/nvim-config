return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({
			disable_netrw = true,
			hijack_netrw = true,
			respect_buf_cwd = true,
			sync_root_with_cwd = true,
			sort_by = "case_sensitive",
			renderer = {
				indent_markers = {
					enable = true, -- Show vertical lines for nested folders
					icons = {
						corner = "╰─",
						edge = "│ ",
						item = "├─",
						none = "  ",
					},
				},
				highlight_opened_files = "all",
				root_folder_label = false,
				icons = {
					show = {
						file = true,
						folder = true,
						folder_arrow = false,
						git = true,
					},
					glyphs = {
						default = "󰈙",
						folder = {
							default = "",
							open = "",
							empty = "",
							empty_open = "",
						},
						git = {
							unstaged = "",
							unmerged = "",
							staged = "✓",
							deleted = "",
							untracked = "★",
							renamed = "➜",
							ignored = "◌",
						},
					},
				},
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
				icons = {

					hint = "󰌶", -- dot
					info = "", -- arrow
					warning = "‣", -- ascii warning
					error = "󰅚", -- minimal x
				},
			},
			git = {
				enable = true,
				ignore = false,
				timeout = 500,
			},
			view = {
				width = 30,
				side = "left",
				preserve_window_proportions = true,
				signcolumn = "yes",
			},
			actions = {
				open_file = {
					quit_on_open = false,
					resize_window = true,
				},
			},
			update_focused_file = {
				enable = true,
				update_cwd = false,
			},
		})

		-- Keybindings for better navigation
		vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>r", ":NvimTreeRefresh<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>n", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })
	end,
}
