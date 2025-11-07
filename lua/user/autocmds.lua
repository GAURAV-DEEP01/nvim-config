-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.yaml", "*.yml" },
	callback = function()
		-- prevent conform.nvim formatting
		if vim.fn.exists(":ConformFormat") == 2 then
			vim.cmd("ConformFormat!") -- or do nothing
		end
		-- disable LSP formatting
		local clients = vim.lsp.get_active_clients({ bufnr = 0 })
		for _, client in ipairs(clients) do
			if client.name == "yamlls" or client.name == "null-ls" then
				client.server_capabilities.documentFormattingProvider = false
			end
		end
		vim.bo.formatoptions = ""
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local uri = vim.uri_from_bufnr(bufnr)
		if uri:match("^diffview://") then
			vim.schedule(function()
				vim.lsp.buf_detach_client(bufnr, args.data.client_id)
			end)
		end
	end,
})
