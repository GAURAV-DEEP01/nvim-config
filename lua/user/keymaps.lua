vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- custom key map for consistant select
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set({ "i", "n", "v" }, "<A-r>", "<C-^>", { noremap = true, silent = true })

vim.keymap.set({ "n", "v" }, "<A-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<LocalLeader>at", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "<LocalLeader>aa", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])

vim.keymap.set("n", "<leader>e", function()
	require("nvim-tree").toggle()
end, { desc = "[E]xplorer: Toggle NvimTree" })
vim.keymap.set("n", "<leader>+", ":NvimTreeResize 50<CR>", { desc = "Increase NvimTree width" })
vim.keymap.set("n", "<leader>-", ":NvimTreeResize 30<CR>", { desc = "Decrease NvimTree width" })

-- error/diagnostics undert the curser
vim.keymap.set("n", "<leader>de", function()
	local opts = {
		focusable = true,
		border = "rounded",
		-- Removed `close_events` to avoid auto-closing
	}

	local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
	if vim.tbl_isempty(diagnostics) then
		return
	end

	local float_win = vim.diagnostic.open_float(nil, opts)
	if not float_win then
		return
	end

	-- Apply pitch black background and border
	vim.api.nvim_set_hl(0, "MyDiagnosticFloat", { bg = "#000000" })
	vim.api.nvim_set_hl(0, "MyDiagnosticBorder", { bg = "#000000", fg = "#444444" })

	vim.api.nvim_win_set_option(float_win, "winhl", "NormalFloat:MyDiagnosticFloat,FloatBorder:MyDiagnosticBorder")

	-- Focus the float
	vim.api.nvim_set_current_win(float_win)
end, { desc = "Show diagnostics under cursor (focused, black float)" })

vim.keymap.set("n", "<leader>nd", function()
	require("notify").dismiss({ silent = true, pending = true })
end, { desc = "Dismiss notifications" })

local function toggle_diffview()
	local view = require("diffview.lib").get_current_view() -- Get the current DiffView state
	if view then
		vim.cmd("DiffviewClose") -- Close if open
	else
		vim.cmd("DiffviewOpen") -- Open if closed
	end
end

vim.keymap.set({ "i", "n" }, "<A-d>", toggle_diffview, { noremap = true, silent = true, desc = "Toggle DiffView" })

-- Function to open terminal in horizontal split
vim.keymap.set("n", "<leader>tt", function()
	vim.cmd("split | terminal")
	vim.cmd("resize 10") -- Adjust height as needed
end, { desc = "Open terminal in horizontal split" })

-- Function to open terminal in a floating window
vim.keymap.set("n", "<leader>tf", function()
	local buf = vim.api.nvim_create_buf(false, true)
	local width = math.floor(vim.o.columns * 0.8)
	local height = math.floor(vim.o.lines * 0.6)
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded",
	})

	vim.cmd("terminal")
end, { desc = "Open floating terminal" })
